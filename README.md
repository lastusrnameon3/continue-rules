# continue-rules

Continue AI coding assistant rules, prompts, and workflow standards.

## Structure

```
continue-rules/
  .continue/
    rules/          ← Auto-loaded rules (universal + domain layers)
    prompts/        ← Invokable slash commands
    session/        ← End-of-day session summaries
  .vscode/          ← Shared editor settings and snippets
  scripts/          ← Project initialization scripts
  STATE.md          ← Project state file (session continuity)
  BOUNDARY-DEFINITION.md
  POWERSHELL-COMMUNITY-REVIEWER.md
  README.md
```

## Add to a Project — GitHub

```bash
git subtree add \
  --prefix .continue/rules \
  git@github.com:lastusrnameon3/continue-rules.git \
  main --squash
```

## Add to a Project — GitLab (corporate)

```bash
git subtree add \
  --prefix .continue/rules \
  git@gitlab.COMPANY.com:infra/continue-rules.git \
  main --squash
```

## Pull Updates

```bash
git subtree pull \
  --prefix .continue/rules \
  git@github.com:lastusrnameon3/continue-rules.git \
  main --squash
```

## Daily Workflow

```
Session start:  /state    → reads STATE.md, reports where you left off
                /pickup   → reads STATE.md + last session summary, confirms next action

During:         /review /challenge /breakit /premortem — as needed

Session end:    /eod      → writes session summary + appends STATE.md entry
                /jira     → generates Jira card updates (when needed)
```

STATE.md is the project's memory. `/eod` writes to it. `/state` and `/pickup` read from it. No manual paste required.

Run `/help` for the full list of 26 commands.

## Rules — Layered Model

Rules auto-load based on their frontmatter. No manual invocation needed.

**Universal (always active — any project type):**
- `00-project-context` — reads STATE.md, project template stub
- `01-me` — personal defaults (audit-first, direct feedback, simpler option)
- `02-thinking` — adversarial defaults (challenge before building)
- `03-writing` — README standard + session summary format
- `04-tool-delegation` — context-efficient tool output handling

**Domain (active only when matching files are in context):**
- `10-code` — code standards (.ps1, .py, .sh, .js, .ts)
- `11-security` — credential/cert/secret handling (keyword-triggered)
- `12-git-workflow` — commit format, MR/PR standards
- `13–16` — deployment checklists (Windows, Linux, Python)
- `17-documentation-ste` — Simplified Technical English for `DEPLOYMENT-*.md` (also invokable as `@ste`)

## Prompts — 26 Commands

Invoke with `/name` in Continue chat.

**Daily:** state, eod, pickup, jira
**Review:** review, commit, challenge, breakit, tradeoff
**Writing:** simplify, comment, userdocs
**Personas:** infra-review, teamlead-review, security-review, architect-review, blindspot-review, sidebiz-review
**Decisions:** premortem, steelman
**Community:** community-review
**Mode/Utility:** terse, normal, compress, usage, help

## Where Things Live — Notion vs This Repo

| | Owns | Answers |
|---|---|---|
| **Notion** (Infrastructure Engineering → ⚙️ Continue Rules) | Intent, rationale, rejected options, design discussion, `config.yaml` template | **What and why** |
| **This repo** | Rule files, prompt files, scripts, `STATE.md` | **How — the working artifacts** |

If a rule's behavior is in question, the file in `.continue/` is authoritative. If the question is
*why* a rule exists or what was rejected on the way to it, Notion is authoritative. Content that is
purely operational belongs here, not in Notion; content that is purely rationale belongs in Notion,
not here. Where both need it, this repo carries the dense operational subset and links out.

`STATE.md` records what changed and why at the commit level. Notion holds the longer-form reasoning
that outlives any single change.

## Configuration

`config.yaml` is NOT in this repo — it contains endpoint URLs and API keys. The template lives in Notion under Infrastructure Engineering → Continue Rules → config.yaml (current). Copy it, fill in your values locally, do not commit it.

## Format Note

This system uses the current Continue format: YAML config + markdown rules and prompt files. JSON config (`config.json`, `slashCommands` array) is deprecated and not used here.
