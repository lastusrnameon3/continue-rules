#!/usr/bin/env bash
# PreToolUse Edit|Write — replaces Continue 11-security's regex: trigger.
# Continue could only advise. This blocks.
set -uo pipefail
IN=$(cat)
PAYLOAD=$(printf '%s' "$IN" | jq -r '[.tool_input.content?, .tool_input.new_string?, .tool_input.file_text?] | map(select(.)) | join("\n")')
[ -n "$PAYLOAD" ] || exit 0

# Value-shaped secrets only. A bare keyword is what the 11-security context rule is for.
ASSIGN='(?i)(api[_-]?key|secret|password|passwd|token|client[_-]?secret)[[:space:]]*[:=][[:space:]]*["'"'"']?[A-Za-z0-9/+_.-]{16,}'
PEM='BEGIN [A-Z ]*PRIVATE KEY'

HIT=""
if printf '%s' "$PAYLOAD" | grep -Pq -e "$ASSIGN"; then
  HIT="credential assigned a literal value"
elif printf '%s' "$PAYLOAD" | grep -q -e "$PEM"; then
  HIT="private key block"
fi

if [ -z "$HIT" ]; then exit 0; fi
jq -n --arg r "Blocked: $HIT in file content. Retrieve at runtime from the vault; never commit the value." '{
  hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "deny",
    permissionDecisionReason: $r
  }
}'
exit 0
