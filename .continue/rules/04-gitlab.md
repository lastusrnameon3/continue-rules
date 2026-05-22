---
name: GitLab — Commits and Pipelines
globs: ["**/.gitlab-ci.yml", ".gitlab/ci/**/*.yml", "**/*.md", "CHANGELOG*"]
alwaysApply: false
---

## Commits and MRs
- Format: `type(scope): short description`
- MR body includes: what changed, why, and what was explicitly not done
- "Not done" section prevents future teams relitigating decided tradeoffs
- Breaking changes called out in first line
- Flag any MR with no documented design decision

## Pipeline Jobs
- Every job has explicit failure conditions — no silent success on real failure
- Secrets from GitLab CI variables only — never hardcoded
- MR-only jobs scoped with `only: merge_requests`
- Jobs touching PKI or PAM need an explicit audit step
- Flag credentials passed as plaintext arguments to scripts
- Flag jobs where credential variables could pass between stages via artifact or env inheritance
