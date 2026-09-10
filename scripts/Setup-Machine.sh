#!/usr/bin/env bash
# Run once per machine. Idempotent.
set -euo pipefail
EX=$(git config --global core.excludesfile || true)
if [ -z "$EX" ]; then
  EX="$HOME/.gitignore_global"
  git config --global core.excludesfile "$EX"
  echo "set core.excludesfile -> $EX"
else
  echo "core.excludesfile already set -> $EX (appending)"
fi
touch "$EX"
for p in '.claude/' 'CLAUDE.md' 'CLAUDE.local.md'; do
  if grep -qxF "$p" "$EX"; then echo "  present: $p"
  else echo "$p" >> "$EX"; echo "  added:   $p"; fi
done
command -v jq >/dev/null || echo "WARNING: jq not found — hooks require it."
