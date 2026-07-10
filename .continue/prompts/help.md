---
name: Help
description: List all available commands and what they do
invokable: true
---

Display this reference card. Do not activate or change anything.

## Prompts (invoke with `/name`)

### Daily Workflow
| Command | What it does |
|---|---|
| `/eod` | End-of-day session summary |
| `/pickup` | Resume from yesterday's session summary + STATE.md |
| `/jira` | Generate Jira card updates from today's work |

### Code Review
| Command | What it does |
|---|---|
| `/review` | Terse one-line-per-finding code review with severity prefixes |
| `/commit` | Generate a Conventional Commits message from the diff |
| `/challenge` | Argue against this approach before writing code |
| `/breakit` | Find failure modes as a hostile non-technical user |
| `/tradeoff` | Compare current approach against one alternative |

### Writing
| Command | What it does |
|---|---|
| `/simplify` | Rename variables for non-technical readers |
| `/comment` | Add plain-English inline comments |
| `/userdocs` | Generate README following Writing Standards |

### Persona Reviews
| Command | What it does |
|---|---|
| `/infra-review` | Review as a senior infrastructure engineer |
| `/teamlead-review` | Review for non-technical team usability |
| `/security-review` | Review in security operator mode |
| `/architect-review` | Review as automation architect checking operability |
| `/blindspot-review` | Check for the author's known blind spots |
| `/sidebiz-review` | Review material for a small business audience |

### Decision Making
| Command | What it does |
|---|---|
| `/premortem` | Assume this fails in three weeks — find the cause |
| `/steelman` | Make the strongest case for both options, then pick |

### Community
| Command | What it does |
|---|---|
| `/community-review` | Audit PowerShell session content as a community member |

### Mode & Utilities
| Command | What it does |
|---|---|
| `/terse` | Activate compressed communication style |
| `/normal` | Return to standard communication style |
| `/compress` | Shrink a reference file or page to save tokens |
| `/usage` | Estimate tokens saved by terse mode and compression |
| `/help` | Show this reference card |

## Rules (auto-loaded)

### Universal (always active)
| Rule | What it does |
|---|---|
| 00-project-context | Reads STATE.md, holds project template |
| 01-me | Personal defaults — audit first, simpler option, direct feedback |
| 02-thinking | Adversarial defaults — challenge before building |
| 03-writing | README standard + session summary format |
| 04-tool-delegation | Context-efficient tool output handling |

### Domain (active on matching files)
| Rule | Fires on |
|---|---|
| 10-code | .ps1, .py, .sh, .js, .ts |
| 11-security | Files containing credential/cert/secret keywords |
| 12-git-workflow | CI configs, markdown, changelogs |
| 13-deployment-checklist | DEPLOYMENT-checklist.md |
| 14-deployment-windows | DEPLOYMENT-windows.md |
| 15-deployment-linux | DEPLOYMENT-linux.md |
| 16-deployment-python | DEPLOYMENT-python.md |
