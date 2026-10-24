#!/bin/sh
# Mergen usage counter (Stop / SubagentStop hook, macOS, Linux, Git Bash).
#
# Sends the token counts of Mergen's agents to the club server with the
# member's personal key, so /maliyet can show what each agent would cost on
# the API. Sent per assistant message: agent name, model, message id, time
# and token counts. Never prompts, answers, file contents or paths.
#
# Counted: Mergen plugin subagents (SubagentStop) anywhere, and the main
# session only in a Mergen workspace (its .claude/settings.json enables the
# plugin). Turn off with MERGEN_KULLANIM=0 in the environment.
#
# Needs only sh, awk, cksum, wc and curl. State (lines already read per
# transcript) lives in $CLAUDE_PLUGIN_DATA/kullanim/<session>/.

set -u
[ "${MERGEN_KULLANIM:-1}" = "0" ] && exit 0

here=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd) || exit 0
awkprog="$here/kullanim.awk"
# Windows paths arrive with backslashes even under Git Bash.
slashes() { printf '%s' "$1" | tr '\\' '/'; }
plugin_root=$(slashes "${CLAUDE_PLUGIN_ROOT:-$here/..}")
data=$(slashes "${CLAUDE_PLUGIN_DATA:-}")
url=${CLAUDE_PLUGIN_OPTION_MERGEN_URL:-}
url=${url%/}
token=${CLAUDE_PLUGIN_OPTION_MERGEN_TOKEN:-}
dry=${MERGEN_KULLANIM_DRY_RUN:-0}

[ -n "$data" ] || exit 0
if [ "$dry" != "1" ]; then
  # The key only travels over https (plain http only to this machine, for tests).
  case "$url" in https://* | http://127.0.0.1:* | http://localhost:*) ;; *) exit 0 ;; esac
  printf '%s' "$token" | grep -Eq '^mrg_[A-Za-z0-9_-]{43}$' || exit 0
  command -v curl >/dev/null 2>&1 || exit 0
fi

hook_input=$(cat)
# The transcript is written asynchronously; give the last lines a moment.
sleep "${MERGEN_KULLANIM_SLEEP:-2}"

fields=$(printf '%s\n' "$hook_input" | awk -v mode=hook -f "$awkprog") || exit 0
{
  IFS= read -r event
  IFS= read -r session
  IFS= read -r transcript
  IFS= read -r agent_type
  IFS= read -r agent_transcript
} <<EOF
$fields
EOF

case "$session" in '' | *[!A-Za-z0-9_-]*) exit 0 ;; esac
state_dir="$data/kullanim/$session"

# register PATH AGENT: start following a transcript (once per session).
register() {
  [ -n "$1" ] && [ -f "$1" ] || return 0
  mkdir -p "$state_dir" || return 0
  key=$(printf '%s' "$1" | cksum | awk '{ print $1 }')
  [ -f "$state_dir/$key.st" ] || printf '%s\n0\n%s\n' "$2" "$1" > "$state_dir/$key.st"
}

case "$event" in
  SubagentStop)
    name=${agent_type#mergen:}
    case "$name" in '' | *[!a-z0-9_-]*) name='' ;; esac
    # Only the Mergen plugin's own agents (agents/<name>.md), never other subagents.
    if [ -n "$name" ] && [ -f "$plugin_root/agents/$name.md" ]; then
      register "$agent_transcript" "$name"
    fi
    ;;
  Stop)
    project=$(slashes "${CLAUDE_PROJECT_DIR:-}")
    if [ -n "$project" ] && grep -qs 'mergen@mergen-marketplace' "$project/.claude/settings.json" "$project/.claude/settings.local.json"; then
      register "$transcript" mergen
    fi
    ;;
  *) exit 0 ;;
esac

[ -d "$state_dir" ] || exit 0
work=$(mktemp -d 2>/dev/null) || exit 0
trap 'rm -rf "$work"' EXIT HUP INT TERM

# send FILE: posts the events (one JSON object per line) in batches of at most
# 2000 (the server takes 5000). Fails only when a retry could succeed later.
send() {
  [ -s "$1" ] || return 0
  rm -f "$work"/part.*
  split -l 2000 "$1" "$work/part." || return 1
  for part in "$work"/part.*; do
    {
      printf '{"v":1,"events":['
      paste -s -d , "$part" | tr -d '\n'
      printf ']}'
    } > "$work/body"
    if [ "$dry" = "1" ]; then
      cat "$work/body"
      printf '\n'
      continue
    fi
    # The key goes to curl on stdin (--config -), never on the command line.
    status=$(printf 'header = "Authorization: Bearer %s"\n' "$token" |
      curl -sS -m 20 -o /dev/null -w '%{http_code}' --config - \
        -H 'Content-Type: application/json' --data-binary @"$work/body" \
        "$url/api/kullanim" 2>/dev/null) || status=000
    case "$status" in
      200) ;;
      # Rejected for good: sending the same lines again would not help.
      400 | 413) ;;
      *) return 1 ;;
    esac
  done
}

# Read every followed transcript of this session from where we left off; this
# also picks up subagent lines that were not written yet at their own stop.
# Each transcript is marked as read only after its own events were accepted;
# on a failure the rest wait for the next stop (the server ignores repeats).
for st in "$state_dir"/*.st; do
  [ -f "$st" ] || continue
  { IFS= read -r agent; IFS= read -r done_lines; IFS= read -r path; } < "$st"
  [ -f "$path" ] || continue
  case "$done_lines" in '' | *[!0-9]*) done_lines=0 ;; esac
  # Complete lines only: a line still being written has no newline yet.
  total=$(wc -l < "$path" | tr -d ' ')
  [ "$total" -gt "$done_lines" ] 2>/dev/null || continue
  awk -v mode=usage -v agent="$agent" -v from="$done_lines" -v to="$total" -f "$awkprog" "$path" > "$work/events" || continue
  send "$work/events" || break
  printf '%s\n%s\n%s\n' "$agent" "$total" "$path" > "$st.tmp" && mv "$st.tmp" "$st"
done

# Forget sessions untouched for 30 days.
find "$data/kullanim" -type f -name '*.st' -mtime +30 -exec rm -f {} + 2>/dev/null
find "$data/kullanim" -mindepth 1 -type d -empty -exec rmdir {} + 2>/dev/null
exit 0
