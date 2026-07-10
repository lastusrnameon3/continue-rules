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
#     "git@github.com:lastusrnamein3/continue-rules.git"
#
# Parameters:
#   $1 - Project path (required)
#   $2 - Rules repo URL (optional, defaults to internal GitLab)
#        Replace COMPANY with your domain when using internally.

set -e

PROJECT_PATH="${1:?Usage: $0 <project-path> [rules-repo-url]}"
RULES_REPO="${2:-git@gitlab.COMPANY.com:infra/continue-rules.git}"

cd "$PROJECT_PATH"

echo "Pulling shared Continue rules from $RULES_REPO..."

git subtree add \
  --prefix .continue/rules \
  "$RULES_REPO" \
  main --squash

# Create session folder
mkdir -p .continue/session
touch .continue/session/.gitkeep

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
echo "Add project-specific rules to 99-local-overrides.md"
