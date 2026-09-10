# DEPRECATED 2026-09-10 — the git-subtree distribution this script uses never worked.
# 'git subtree add --prefix .continue/rules' places the REPO ROOT at that prefix, so rules landed
# at .continue/rules/.continue/rules/*.md and prompts were never distributed at all.
# Superseded by scripts/Setup-Machine.* plus a copy into ~/.claude/. Kept for reference only.

#!/bin/bash
# new-project-setup.sh
# Initialises a new project with shared Continue rules.
#
# Usage:
#   # Corporate network (GitLab)
#   ./new-project-setup.sh /path/to/project
#
#   # Outside corporate network (GitHub)
#   ./new-project-setup.sh /path/to/project \
#     "git@github.com:lastusrnameon3/Clause-Skillz.git"
#
# Parameters:
#   $1 - Project path (required)
#   $2 - Rules repo URL (optional, defaults to internal GitLab)
#        Replace COMPANY with your domain when using internally.

set -e

PROJECT_PATH="${1:?Usage: $0 <project-path> [rules-repo-url]}"
RULES_REPO="${2:-git@gitlab.COMPANY.com:infra/Clause-Skillz.git}"

cd "$PROJECT_PATH"

echo "Pulling shared Continue rules from $RULES_REPO..."

git subtree add \
  --prefix .continue/rules \
  "$RULES_REPO" \
  main --squash

# Create session and prompts folders
mkdir -p .continue/session
touch .continue/session/.gitkeep
mkdir -p .continue/prompts

# Create STATE.md stub
if [ ! -f "STATE.md" ]; then
cat > "STATE.md" << STATEEOF
# STATE — ${PROJECT_NAME}

---

## $(date +%Y-%m-%d) — Project Initialized

### Built
- Continue rules loaded via subtree

### Decisions + Reason
- [Fill in as decisions are made]

### Unresolved
- None.

### Constraints
- [Fill in project constraints]

### Next Slice Queued
- [First task]
STATEEOF
fi

# Create local overrides placeholder
OVERRIDE=".continue/rules/99-local-overrides.md"
PROJECT_NAME=$(basename "$PROJECT_PATH")

if [ ! -f "$OVERRIDE" ]; then
cat > "$OVERRIDE" << EOF
---
name: Local Overrides — ${PROJECT_NAME}
alwaysApply: true
---

# Project-specific rules go here
# Do not duplicate content from shared rules
EOF
fi

git add .
git commit -m "chore: initialise continue rules for project"

echo "Done. Shared rules loaded at .continue/rules/"
echo "STATE.md created at repo root — update it with /eod"
echo "Add project-specific rules to 99-local-overrides.md"
