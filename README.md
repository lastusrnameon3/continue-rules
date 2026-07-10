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

Run `/help` for the full list of 25 commands.

## Format Note

This system uses the current Continue format: YAML config + markdown rules and prompt files. JSON config (`config.json`, `slashCommands` array) is deprecated and not used here.
