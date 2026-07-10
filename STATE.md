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

### Next Slice Queued
- Slice 1 (this commit): repo skeleton restructure — directories only, no content changes
- Slice 2: universal rules layer (00-project-context, 01-me, 02-thinking, 03-writing)
