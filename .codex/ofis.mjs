// Node 18+; both shells use this exact projection of the hook envelope.
// Only dates and a lifecycle flag are persisted locally. Neither the transcript nor its path is opened.
import { createHash } from 'node:crypto'
import { mkdirSync, readFileSync, readdirSync, unlinkSync, writeFileSync, openSync, closeSync } from 'node:fs'
import { homedir } from 'node:os'
import { join } from 'node:path'

const agents = new Set('atabey bilge bitigci boru elci kalemsor kam kayra korkut kurultay tamga tore tulpar ulgen yabanci yanki'.split(' '))
const day = 86_400_000

// A terminal signal may beat its start to the local filesystem, or the same
// subagent may be resumed after handing back. Serialize only the tiny local update.
async function startTime(slot, start, now) {
  const lock = slot + '.lock'
  let fd
  for (let attempt = 0; attempt < 12; attempt++) {
    try { fd = openSync(lock, 'wx', 0o600); break }
    catch (error) { if (error.code !== 'EEXIST') throw error }
    await new Promise(resolve => setTimeout(resolve, 12))
  }
  if (fd === undefined) return null
  try {
    let previous
    try { previous = JSON.parse(readFileSync(slot, 'utf8')) }
    catch (error) { if (error.code !== 'ENOENT') throw error }
    let timestamp = previous?.timestamp ?? now
    let state
    if (start) {
      if (previous?.state === 'closed') timestamp = Math.max(now, timestamp + 1)
      state = previous?.state === 'stop-first' ? 'closed' : 'running'
    } else {
      state = previous ? (previous.state === 'stop-first' ? 'stop-first' : 'closed') : 'stop-first'
    }
    writeFileSync(slot, JSON.stringify({ timestamp, state }), { mode: 0o600 })
    return timestamp
  } finally {
    closeSync(fd)
    unlinkSync(lock)
  }
}

async function signal() {
  if (process.env.MERGEN_KULLANIM === '0') return
  const codex = process.argv.at(-1) === 'codex'
  const token = codex ? process.env.MERGEN_TOKEN : process.env.CLAUDE_PLUGIN_OPTION_MERGEN_TOKEN
  if (!/^mrg_[A-Za-z0-9_-]{43}$/.test(token ?? '')) return
  const base = codex ? 'https://mergen-alpha.vercel.app' : process.env.CLAUDE_PLUGIN_OPTION_MERGEN_URL
  const url = new URL('/api/ofis', base)
  if (url.username || url.password || !(url.protocol === 'https:' ||
      (url.protocol === 'http:' && ['localhost', '127.0.0.1', '[::1]'].includes(url.hostname)))) return

  let bytes = 0
  const chunks = []
  for await (const chunk of process.stdin) {
    bytes += chunk.length
    if (bytes > 2_000_000) return
    chunks.push(chunk)
  }
  const hook = JSON.parse(Buffer.concat(chunks).toString('utf8'))
  const event = hook.hook_event_name
  const child = event === 'SubagentStart' || event === 'SubagentStop'
  if (!child && !['UserPromptSubmit', 'Stop'].includes(event)) return
  let agent = 'mergen'
  if (child) {
    if (typeof hook.agent_type !== 'string') return
    if (!codex && !hook.agent_type.startsWith('mergen:')) return
    agent = codex ? hook.agent_type : hook.agent_type.slice(7)
    if (!agents.has(agent)) return
  } else if (!codex) {
    if (hook.agent_id || !process.env.CLAUDE_PROJECT_DIR) return
    const enabled = ['settings.json', 'settings.local.json'].some(name => {
      try {
        const settings = JSON.parse(readFileSync(join(process.env.CLAUDE_PROJECT_DIR, '.claude', name), 'utf8'))
        return settings.enabledPlugins?.['mergen@mergen-marketplace'] === true
      } catch { return false }
    })
    if (!enabled) return
  }
  const instance = child ? hook.agent_id : (hook.turn_id ?? hook.prompt_id ?? hook.session_id)
  if (![instance, hook.session_id].every(id => typeof id === 'string' && /^[\w-]{1,180}$/.test(id))) return

  const folder = join(homedir(), '.mergen', 'ofis')
  mkdirSync(folder, { recursive: true, mode: 0o700 })
  const key = createHash('sha256').update(JSON.stringify([codex, hook.session_id, instance, agent])).digest('hex')
  const start = event === 'SubagentStart' || event === 'UserPromptSubmit'
  const now = Date.now()
  const today = Math.floor(now / day)
  // Keep yesterday's slots for calls crossing midnight. Only our date-prefixed files are removed.
  const files = readdirSync(folder)
  const previous = (today - 1) + '-' + key
  const slot = join(folder, files.includes(previous) ? previous : today + '-' + key)
  for (const name of files) {
    const match = /^(\d+)-[a-f0-9]{64}(?:\.lock)?$/.exec(name)
    if (match && Number(match[1]) < today - 1) { try { unlinkSync(join(folder, name)) } catch {} }
  }

  const timestamp = await startTime(slot, start, now)
  if (!timestamp) return
  const startedAt = new Date(timestamp).toISOString()
  await fetch(url, {
    method: 'POST', redirect: 'error', signal: AbortSignal.timeout(2500),
    headers: { authorization: 'Bearer ' + token, 'content-type': 'application/json' },
    body: JSON.stringify({ agent, status: start ? 'started' : 'stopped', startedAt,
      at: start ? startedAt : new Date(Math.max(now, timestamp)).toISOString() }),
  })
}
try { await signal() } catch { /* Availability of the office never gates the member's work. */ }
