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
