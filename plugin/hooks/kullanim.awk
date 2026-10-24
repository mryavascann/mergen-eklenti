# Mergen usage counter: a small JSON reader for kullanim.sh (POSIX awk; no
# jq/node/python needed). It tracks key paths, so keys nested inside message
# content or arrays (tool inputs, usage.iterations) are never mistaken for the
# fields it wants. Only identifiers and counts leave this program.
#
#   awk -v mode=hook -f kullanim.awk < hook-input.json
#       prints 5 lines: hook_event_name, session_id, transcript_path,
#       agent_type, agent_transcript_path (Windows paths with "/")
#   awk -v mode=usage -v agent=NAME -v from=N -v to=M -f kullanim.awk transcript.jsonl
#       reads lines N+1..M and prints one JSON object per assistant message:
#       {"id","agent","model","at","input","output","cache_read","cache_write_5m","cache_write_1h"}

# Splits a JSON line on quotes into tokens: TT[i] "o" (outside strings) or "s"
# (string content, still escaped). Returns the token count.
function tokenize(line,    n, raw, k, p, cur, inside, ntok) {
  n = split(line, raw, "\"")
  ntok = 0; inside = 0; cur = ""
  for (k = 1; k <= n; k++) {
    p = raw[k]
    if (!inside) {
      ntok++; TT[ntok] = "o"; TV[ntok] = p
      if (k < n) inside = 1
      continue
    }
    cur = cur p
    # An odd run of backslashes before this quote escapes it: the string goes on.
    if (match(p, /\\+$/) && RLENGTH % 2 == 1) { cur = cur "\""; continue }
    ntok++; TT[ntok] = "s"; TV[ntok] = cur
    cur = ""; inside = 0
  }
  return ntok
}

# Value at the current path. Only object paths up to depth 4 outside arrays matter.
function scalar(v, isstr,    d, path) {
  if (arrays > 0 || depth < 1 || depth > 4) return
  path = ckey[1]
  for (d = 2; d <= depth; d++) path = path "." ckey[d]
  if (mode == "hook") {
    if (depth == 1 && isstr) H[path] = v
    return
  }
  if (path == "type" && isstr) L_type = v
  else if (path == "timestamp" && isstr) L_ts = v
  else if (path == "message.id" && isstr) L_id = v
  else if (path == "message.model" && isstr) L_model = v
  else if (isstr) return
  else if (path == "message.usage.input_tokens") L_in = v + 0
  else if (path == "message.usage.output_tokens") L_out = v + 0
  else if (path == "message.usage.cache_read_input_tokens") L_cr = v + 0
  else if (path == "message.usage.cache_creation_input_tokens") L_cc = v + 0
  else if (path == "message.usage.cache_creation.ephemeral_5m_input_tokens") { L_c5 = v + 0; L_split = 1 }
  else if (path == "message.usage.cache_creation.ephemeral_1h_input_tokens") { L_c1 = v + 0; L_split = 1 }
}

function walk(ntok,    t, s, i, c, len, rest) {
  depth = 0; arrays = 0
  for (t = 1; t <= ntok; t++) {
    if (TT[t] == "s") {
      if (depth > 0 && ctype[depth] == "o" && cstate[depth] == "k") { ckey[depth] = TV[t]; cstate[depth] = "c" }
      else scalar(TV[t], 1)
      continue
    }
    s = TV[t]; len = length(s); i = 1
    while (i <= len) {
      c = substr(s, i, 1)
      if (c == "{") { depth++; ctype[depth] = "o"; cstate[depth] = "k"; ckey[depth] = ""; i++ }
      else if (c == "[") { depth++; ctype[depth] = "a"; arrays++; i++ }
      else if (c == "}" || c == "]") { if (ctype[depth] == "a") arrays--; depth--; i++ }
      else if (c == ":") { cstate[depth] = "v"; i++ }
      else if (c == ",") { if (ctype[depth] == "o") cstate[depth] = "k"; i++ }
      else if (c ~ /[-0-9tfn]/) {
        rest = substr(s, i)
        if (!match(rest, /^[-+0-9.eEtruefalsn]+/)) { i++; continue }
        scalar(substr(rest, 1, RLENGTH), 0); i += RLENGTH
      }
      else i++
    }
  }
}

function unescape_path(s) {
  gsub(/\\\\/, "/", s)
  gsub(/\\\//, "/", s)
  gsub(/\\"/, "\"", s)
  return s
}

function max(a, b) { return a > b ? a : b }

BEGIN {
  if (mode == "") mode = "usage"
  from += 0; to += 0
  nid = 0; buf = ""
}

mode == "hook" { buf = buf " " $0; next }

mode == "usage" {
  if (NR <= from) next
  if (to > 0 && NR > to) exit
  if (index($0, "\"assistant\"") == 0) next
  L_type = ""; L_ts = ""; L_id = ""; L_model = ""
  L_in = 0; L_out = 0; L_cr = 0; L_cc = 0; L_c5 = 0; L_c1 = 0; L_split = 0
  walk(tokenize($0))
  if (L_type != "assistant") next
  if (L_id !~ /^[A-Za-z0-9_-]+$/ || length(L_id) > 200) next
  if (L_model !~ /^[A-Za-z0-9][A-Za-z0-9._:@\[\]-]*$/ || length(L_model) > 100) next
  if (L_ts !~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]T[0-9][0-9]:[0-9][0-9]:[0-9][0-9](\.[0-9]+)?(Z|[+-][0-9][0-9]:[0-9][0-9])$/) next
  w5 = L_split ? L_c5 : L_cc
  w1 = L_split ? L_c1 : 0
  if (L_in + L_out + L_cr + w5 + w1 == 0) next
  if (!(L_id in SEEN)) { SEEN[L_id] = 1; ORDER[++nid] = L_id; MODEL[L_id] = L_model; AT[L_id] = L_ts }
  IN[L_id] = max(IN[L_id], L_in); OUT[L_id] = max(OUT[L_id], L_out); CR[L_id] = max(CR[L_id], L_cr)
  W5[L_id] = max(W5[L_id], w5); W1[L_id] = max(W1[L_id], w1)
}

END {
  if (mode == "hook") {
    walk(tokenize(buf))
    print H["hook_event_name"]
    print H["session_id"]
    print unescape_path(H["transcript_path"])
    print H["agent_type"]
    print unescape_path(H["agent_transcript_path"])
    exit
  }
  for (k = 1; k <= nid; k++) {
    id = ORDER[k]
    printf "{\"id\":\"%s\",\"agent\":\"%s\",\"model\":\"%s\",\"at\":\"%s\",\"input\":%.0f,\"output\":%.0f,\"cache_read\":%.0f,\"cache_write_5m\":%.0f,\"cache_write_1h\":%.0f}\n", \
      id, agent, MODEL[id], AT[id], IN[id], OUT[id], CR[id], W5[id], W1[id]
  }
}
