#!/usr/bin/env bash
# SessionStart — inject STATE.md so /state and /pickup are never forgotten.
set -euo pipefail
IN=$(cat)
CWD=$(printf '%s' "$IN" | jq -r '.cwd // "."')
STATE="$CWD/STATE.md"
[ -f "$STATE" ] || exit 0
# Last entry only — STATE.md grows without bound.
BODY=$(awk '/^## /{n++} n<=2' "$STATE" | head -c 6000)
jq -n --arg b "$BODY" '{
  hookSpecificOutput: {
    hookEventName: "SessionStart",
    additionalContext: ("Project STATE.md (most recent entry):\n\n" + $b)
  }
}'
