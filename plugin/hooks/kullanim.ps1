# Mergen usage counter (Stop / SubagentStop hook) for Windows PowerShell 5.1
# and PowerShell 7. Same behaviour as kullanim.sh; Claude Code runs this one
# when hooks run in PowerShell (Windows without Git Bash).
#
# Sent per assistant message: agent name, model, message id, time and token
# counts. Never prompts, answers, file contents or paths. Turn off with
# MERGEN_KULLANIM=0. State (bytes already read per transcript) lives in
# $env:CLAUDE_PLUGIN_DATA\kullanim\<session>\.
#
# Runs as a script block (hooks.json), so execution policy does not apply and
# $PSScriptRoot is empty: paths come from CLAUDE_PLUGIN_ROOT.

$ErrorActionPreference = 'Stop'
try {
  if ($env:MERGEN_KULLANIM -eq '0') { return }
  $data = $env:CLAUDE_PLUGIN_DATA
  $pluginRoot = $env:CLAUDE_PLUGIN_ROOT
  if (-not $data -or -not $pluginRoot) { return }
  $url = ("" + $env:CLAUDE_PLUGIN_OPTION_MERGEN_URL).TrimEnd('/')
  $token = $env:CLAUDE_PLUGIN_OPTION_MERGEN_TOKEN
  $dry = $env:MERGEN_KULLANIM_DRY_RUN -eq '1'
  if (-not $dry) {
    # The key only travels over https (plain http only to this machine, for tests).
    if ($url -cnotmatch '^(https://|http://(127\.0\.0\.1|localhost):)') { return }
    if ($token -cnotmatch '^mrg_[A-Za-z0-9_-]{43}\z') { return }
  }

  $hook = [Console]::In.ReadToEnd() | ConvertFrom-Json
  $sleep = 2
  if ($env:MERGEN_KULLANIM_SLEEP) { $sleep = [int]$env:MERGEN_KULLANIM_SLEEP }
  Start-Sleep -Seconds $sleep

  $session = "" + $hook.session_id
  if ($session -cnotmatch '^[A-Za-z0-9_-]+\z') { return }
  $stateDir = Join-Path $data (Join-Path 'kullanim' $session)

  function Register-Transcript([string]$path, [string]$agent) {
    if (-not $path -or -not (Test-Path -LiteralPath $path -PathType Leaf)) { return }
    New-Item -ItemType Directory -Force -Path $stateDir | Out-Null
    $sha = [Security.Cryptography.SHA256]::Create()
    $hash = -join ($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($path)) | Select-Object -First 8 | ForEach-Object { $_.ToString('x2') })
    $st = Join-Path $stateDir "$hash.pst"
    if (-not (Test-Path -LiteralPath $st)) { [IO.File]::WriteAllLines($st, [string[]]@($agent, '0', $path)) }
  }

  switch ("" + $hook.hook_event_name) {
    'SubagentStop' {
      $name = ("" + $hook.agent_type) -replace '^mergen:', ''
      # Only the Mergen plugin's own agents (agents/<name>.md), never other subagents.
      if ($name -cmatch '^[a-z0-9_-]+\z' -and (Test-Path -LiteralPath (Join-Path $pluginRoot "agents\$name.md"))) {
        Register-Transcript ("" + $hook.agent_transcript_path) $name
      }
    }
    'Stop' {
      $project = $env:CLAUDE_PROJECT_DIR
      if ($project) {
        $settings = @('settings.json', 'settings.local.json') | ForEach-Object { Join-Path $project ".claude\$_" } |
          Where-Object { Test-Path -LiteralPath $_ }
        $isWorkspace = $false
        foreach ($file in $settings) {
          if ((Get-Content -Raw -LiteralPath $file) -match 'mergen@mergen-marketplace') { $isWorkspace = $true }
        }
        if ($isWorkspace) { Register-Transcript ("" + $hook.transcript_path) 'mergen' }
      }
    }
    default { return }
  }
  if (-not (Test-Path -LiteralPath $stateDir)) { return }

  function Format-Time($value) {
    if ($value -is [datetime]) { return $value.ToUniversalTime().ToString("yyyy-MM-dd'T'HH:mm:ss.fff'Z'") }
    return "" + $value
  }

  # Posts events in batches of at most 2000 (the server takes 5000).
  # Returns $false only when a retry could succeed later.
  function Send-Events($list) {
    for ($i = 0; $i -lt $list.Count; $i += 2000) {
      $last = [Math]::Min($i + 2000, $list.Count) - 1
      $body = ConvertTo-Json -Compress -Depth 4 -InputObject ([ordered]@{ v = 1; events = @($list[$i..$last]) })
      if ($dry) { [Console]::Out.WriteLine($body); continue }
      $status = 0
      try {
        $response = Invoke-WebRequest -Uri "$url/api/kullanim" -Method Post -UseBasicParsing -TimeoutSec 20 -MaximumRedirection 0 `
          -ContentType 'application/json' -Headers @{ Authorization = "Bearer $token" } -Body ([Text.Encoding]::UTF8.GetBytes($body))
        $status = [int]$response.StatusCode
      } catch {
        if ($_.Exception.Response) { $status = [int]$_.Exception.Response.StatusCode }
      }
      # 400 / 413: rejected for good; sending the same lines again would not help.
      if ($status -ne 200 -and $status -ne 400 -and $status -ne 413) { return $false }
    }
    return $true
  }

  [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

  # Read every followed transcript of this session from where we left off; this
  # also picks up subagent lines that were not written yet at their own stop.
  # Each transcript is marked as read only after its own events were accepted;
  # on a failure the rest wait for the next stop (the server ignores repeats).
  foreach ($st in Get-ChildItem -LiteralPath $stateDir -Filter '*.pst' -File) {
    $lines = [IO.File]::ReadAllLines($st.FullName)
    if ($lines.Count -lt 3) { continue }
    $agent = $lines[0]; $offset = [long]$lines[1]; $path = $lines[2]
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { continue }
    # Shared read: Claude Code may be writing the transcript right now.
    $stream = New-Object IO.FileStream($path, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]'ReadWrite, Delete')
    try {
      if ($stream.Length -le $offset) { continue }
      [void]$stream.Seek($offset, [IO.SeekOrigin]::Begin)
      $bytes = New-Object byte[] ($stream.Length - $offset)
      $read = 0
      while ($read -lt $bytes.Length) {
        $n = $stream.Read($bytes, $read, $bytes.Length - $read)
        if ($n -le 0) { break }
        $read += $n
      }
    } finally { $stream.Dispose() }
    if ($read -le 0) { continue }
    # Complete lines only: a line still being written has no newline yet.
    $end = [Array]::LastIndexOf($bytes, [byte]10, $read - 1)
    if ($end -lt 0) { continue }
    $chunk = [Text.Encoding]::UTF8.GetString($bytes, 0, $end + 1)
    $events = [ordered]@{}
    foreach ($line in $chunk.Split("`n")) {
      if ($line.IndexOf('"assistant"') -lt 0) { continue }
      try { $o = $line | ConvertFrom-Json } catch { continue }
      if ($o.type -cne 'assistant' -or -not $o.message -or -not $o.message.usage) { continue }
      $id = "" + $o.message.id; $model = "" + $o.message.model; $at = Format-Time $o.timestamp
      if ($id -cnotmatch '^[A-Za-z0-9_-]{1,200}\z' -or $model -cnotmatch '^[A-Za-z0-9][A-Za-z0-9._:@\[\]-]{0,99}\z') { continue }
      if ($at -cnotmatch '^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?(Z|[+-]\d{2}:\d{2})\z') { continue }
      $u = $o.message.usage
      $split = $u.cache_creation
      if ($split -and ($null -ne $split.ephemeral_5m_input_tokens -or $null -ne $split.ephemeral_1h_input_tokens)) {
        $w5 = [long]$split.ephemeral_5m_input_tokens; $w1 = [long]$split.ephemeral_1h_input_tokens
      } else {
        $w5 = [long]$u.cache_creation_input_tokens; $w1 = 0
      }
      $e = [ordered]@{
        id = $id; agent = $agent; model = $model; at = $at
        input = [long]$u.input_tokens; output = [long]$u.output_tokens; cache_read = [long]$u.cache_read_input_tokens
        cache_write_5m = $w5; cache_write_1h = $w1
      }
      if ($e.input + $e.output + $e.cache_read + $w5 + $w1 -eq 0) { continue }
      $prev = $events[$id]
      if ($prev) {
        foreach ($k in 'input', 'output', 'cache_read', 'cache_write_5m', 'cache_write_1h') { $prev[$k] = [Math]::Max($prev[$k], $e[$k]) }
      } else { $events[$id] = $e }
    }
    if (-not (Send-Events @($events.Values))) { break }
    [IO.File]::WriteAllLines($st.FullName, [string[]]@($agent, [string]($offset + $end + 1), $path))
  }

  # Forget sessions untouched for 30 days.
  $limit = (Get-Date).AddDays(-30)
  Get-ChildItem -LiteralPath (Join-Path $data 'kullanim') -Filter '*.pst' -File -Recurse -ErrorAction SilentlyContinue |
    Where-Object { $_.LastWriteTime -lt $limit } | Remove-Item -Force -ErrorAction SilentlyContinue
} catch {
  # Counting must never get in the member's way.
  return
}
