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
    -RulesRepo "git@github.com:lastusrnamein3/continue-rules.git"
#>

param(
  [Parameter(Mandatory)][string]$ProjectPath,
  [string]$RulesRepo = "git@gitlab.COMPANY.com:infra/continue-rules.git"
)

Set-Location $ProjectPath

Write-Host "Pulling shared Continue rules from $RulesRepo..." -ForegroundColor Cyan

git subtree add --prefix .continue/rules $RulesRepo main --squash

if ($LASTEXITCODE -ne 0) {
  Write-Host "Error: git subtree failed. Check repo URL and network access." -ForegroundColor Red
  exit 1
}

# Create session folder
New-Item -ItemType Directory -Path ".continue/session" -Force | Out-Null
New-Item -ItemType File -Path ".continue/session/.gitkeep" -Force | Out-Null

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
Write-Host "Add project-specific rules to 99-local-overrides.md" -ForegroundColor Green
