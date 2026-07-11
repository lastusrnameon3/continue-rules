# STATE — continue-rules

---

## 2026-07-10 — v2 Migration Initiated

### Built
- GitHub repo `lastusrnameon3/continue-rules` — 15 files, 15 commits
- Rules 01–11 in `.continue/rules/` (v1 format — JSON-era, Frank-specific)
- Notion doc tree under Infrastructure Engineering → Continue Rules
- 18 slash commands defined in JSON `slashCommands` array (Notion only, never in repo)
- 4 files created never pushed: `.vscode/settings.json`, `.vscode/powershell.code-snippets`, `scripts/new-project-setup.ps1`, `scripts/new-project-setup.sh`
- 7 adapted skills (from caveman/cavecrew) — source of truth: `adapted-skills.zip`

### Decisions + Reason
- Full migration to current Continue format (YAML + prompt files) — JSON config deprecated per Continue docs
- Layered rules model (universal / domain / project) — enables non-work use (hobby, fantasy football, random projects)
- Skill mapping: tool-delegation → rule; other 6 → prompts; code-review replaces /gitready; quick-reference replaces planned 98-cheatsheet
- STATE.md loop: /state reads at session start, /eod writes at session end
- config template stays out of repo (contains endpoint/key refs) — Notion only
- Session summaries stay human-readable; /jira separate from /eod
- GitHub username canonical: `lastusrnameon3`
- Continue is EOL (final 2.0.0 release) — format is stable, no future changes expected

### Unresolved
- Private endpoint model string — not yet supplied by user
- 4 `[DELETE]` duplicate pages in Notion — API cannot trash, manual action pending

### Constraints
- Continue is EOL (final 2.0.0) — no future format changes, build against current spec
- No agents at work — all summaries and state files are human-readable, not agent logs
- config.yaml stays in Notion only — contains endpoint/key references, never enters repo

### Next Slice Queued
- Slice 7: config.yaml template in Notion (blocked on model string)
- Slice 8: docs, URL audit, release

---

## 2026-07-10 — Slices 1–6 Executed

### Built
- Repo restructured: `.continue/rules/`, `.continue/prompts/`, `.continue/session/`, `scripts/`, `.vscode/`, `STATE.md`
- Universal rules layer: 00-project-context, 01-me, 02-thinking, 03-writing, 04-tool-delegation (5 rules, alwaysApply: true)
- Domain rules layer: 10-code, 11-security, 12-git-workflow, 13–16 deployment family (7 rules, glob/regex-scoped)
- v1 rules 01–11 deleted
- 18 prompts migrated from JSON slashCommands to `.continue/prompts/*.md` files
- 7 adapted skills integrated: tool-delegation (rule), terse/normal/commit/compress/usage/help/review (prompts)
- review.md merges code-review terse format with security/audit auto-clarity override from old 05-diff-review
- help.md lists all 25 prompts + 12 rules
- STATE.md loop: /state reads state, /eod writes state + session summary, /pickup reads STATE.md directly (no paste)

### Decisions + Reason
- frank-* prompts renamed to role-based (infra-review, teamlead-review, etc.) — generalizes away from one person's name
- /gitready removed — superseded by /review with integrated security/audit override
- 05-diff-review not migrated — content folded into review.md auto-clarity section
- 06-readme and 07-session merged into 03-writing.md — avoids duplication between universal and domain layers
- Tool-delegation is a rule (always-on), not a prompt — it's a background decision framework
- help.md replaces planned 98-cheatsheet — same purpose, already written as adapted skill
- /pickup no longer requires manual paste — reads STATE.md at repo root directly

### Unresolved
- Private endpoint model string — still pending from user
- 4 `[DELETE]` duplicate pages in Notion — still pending manual deletion
- Notion pages not yet updated to reflect v2 structure

### Constraints
- Same as above — no changes

### Next Slice Queued
- Slice 7: config.yaml template in Notion (parallel, blocked on model string — can complete with placeholder)
- Slice 8: docs, URL audit, merge v2-migration to main, tag v2.0.0

---

## 2026-07-10 — v2 Migration Complete (Slice 8)

### Built
- URL audit: all instances of `lastusrnamein3` fixed to `lastusrnameon3` in repo and Notion
- Quickstart scripts updated: create `.continue/prompts/` and `STATE.md` stub on project init
- README expanded: layered rules model, full 26-prompt list, config note
- Notion hub page: v2 structure summary added, old URLs fixed
- config.yaml page created in Notion (14 models, `MODEL_STRING_TBD` placeholder)
- config.json page retitled "(deprecated)"
- v2-migration merged to main, tagged v2.0.0

### Decisions + Reason
- config.yaml stays in Notion only — contains endpoint/key references
- Old Notion pages (v1 structure, adversarial frameworks, daily workflow, VS Code settings) left in place as reference — not deleted
- 4 `[DELETE]` duplicate pages still pending manual deletion by user

### Unresolved
- Private endpoint model string — still TBD, find-and-replace `MODEL_STRING_TBD` in Notion when ready
- 4 `[DELETE]` duplicate pages in Notion — manual action

### Constraints
- Continue is EOL (final 2.0.0) — format is stable
- No agents at work — all summaries human-readable

### Next Slice Queued
- None — v2 migration complete. Next work is project-specific usage.
