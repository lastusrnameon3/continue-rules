#!/usr/bin/env bash
# PreToolUse Bash (if: git commit) — one nudge, then gets out of the way.
set -euo pipefail
IN=$(cat)
SID=$(printf '%s' "$IN" | jq -r '.session_id // "nosession"')
MARK="${TMPDIR:-/tmp}/claude-reviewgate-$SID"
[ -f "$MARK" ] && exit 0        # already nudged this session — do not nag
touch "$MARK"
jq -n '{
  hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "deny",
    permissionDecisionReason: "Run /review on this diff first. Re-run the commit to proceed — this fires once per session."
  }
}'
