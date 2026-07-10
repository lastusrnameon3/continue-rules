---
name: Git Workflow
globs: ["**/.gitlab-ci.yml", "**/.github/workflows/*.yml", ".gitlab/ci/**/*.yml", "**/*.md", "CHANGELOG*"]
alwaysApply: false
---

## Commits and Merge Requests
- Format: `type(scope): short description`
- MR/PR body includes: what changed, why, and what was explicitly not done
- "Not done" section prevents future teams relitigating decided tradeoffs
- Breaking changes called out in first line
- Flag any MR/PR with no documented design decision

## Pipeline Jobs
- Every job has explicit failure conditions — no silent success on real failure
- Secrets from CI platform variables only — never hardcoded
- MR/PR-only jobs scoped appropriately
- Jobs touching credentials or privileged systems need an explicit audit step
- Flag credentials passed as plaintext arguments to scripts
- Flag jobs where credential variables could pass between stages via artifact or env inheritance
