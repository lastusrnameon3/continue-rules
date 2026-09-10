#!/usr/bin/env bash
# Stop — non-blocking. `if:` is tool-events-only, so filter here.
set -euo pipefail
IN=$(cat)
CWD=$(printf '%s' "$IN" | jq -r '.cwd // "."')
cd "$CWD" 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0
[ -n "$(git status --porcelain 2>/dev/null)" ] || exit 0
grep -q "$(date +%Y-%m-%d)" STATE.md 2>/dev/null && exit 0
jq -n '{systemMessage: "Uncommitted changes and no STATE.md entry for today. Run /eod before you stop."}'
