# DEPRECATED 2026-09-10 — the git-subtree distribution this script uses never worked.
# 'git subtree add --prefix .continue/rules' places the REPO ROOT at that prefix, so rules landed
# at .continue/rules/.continue/rules/*.md and prompts were never distributed at all.
# Superseded by scripts/Setup-Machine.* plus a copy into ~/.claude/. Kept for reference only.

<#
.SYNOPSIS
  Initialises a new project with shared Continue rules.

.DESCRIPTION
  Pulls the continue-rules repo into .continue/rules via git subtree.
  Sets up the session folder and local overrides placeholder.

.PARAMETER ProjectPath
  Full path to the project repo root.

.PARAMETER RulesRepo
  Git URL of the continue-rules repo.
  Defaults to internal GitLab — replace COMPANY with your domain.
  Use GitHub URL if working outside corporate network.

.EXAMPLE
  # Corporate network (GitLab)
  .\new-project-setup.ps1 -ProjectPath "C:\repos\my-project"

  # Outside corporate network (GitHub)
  .\new-project-setup.ps1 -ProjectPath "C:\repos\my-project" `
    -RulesRepo "git@github.com:lastusrnameon3/Clause-Skillz.git"
#>

param(
  [Parameter(Mandatory)][string]$ProjectPath,
  [string]$RulesRepo = "git@gitlab.COMPANY.com:infra/Clause-Skillz.git"
)

Set-Location $ProjectPath

Write-Host "Pulling shared Continue rules from $RulesRepo..." -ForegroundColor Cyan

git subtree add --prefix .continue/rules $RulesRepo main --squash

if ($LASTEXITCODE -ne 0) {
  Write-Host "Error: git subtree failed. Check repo URL and network access." -ForegroundColor Red
  exit 1
}

# Create session and prompts folders
New-Item -ItemType Directory -Path ".continue/session" -Force | Out-Null
New-Item -ItemType File -Path ".continue/session/.gitkeep" -Force | Out-Null
New-Item -ItemType Directory -Path ".continue/prompts" -Force | Out-Null

# Create STATE.md stub
$StatePath = "STATE.md"
if (-not (Test-Path $StatePath)) {
  $ProjectName = (Get-Item $ProjectPath).Name
@"
# STATE — $ProjectName

---

## $(Get-Date -Format "yyyy-MM-dd") — Project Initialized

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
"@ | Set-Content $StatePath
}

# Create local overrides placeholder
$OverridePath = ".continue/rules/99-local-overrides.md"
if (-not (Test-Path $OverridePath)) {
  $ProjectName = (Get-Item $ProjectPath).Name
@"
---
name: Local Overrides — $ProjectName
alwaysApply: true
---

# Project-specific rules go here
# Do not duplicate content from shared rules
"@ | Set-Content $OverridePath
}

git add .
git commit -m "chore: initialise continue rules for project"

Write-Host "Done. Shared rules loaded at .continue/rules/" -ForegroundColor Green
Write-Host "STATE.md created at repo root — update it with /eod" -ForegroundColor Green
Write-Host "Add project-specific rules to 99-local-overrides.md" -ForegroundColor Green
