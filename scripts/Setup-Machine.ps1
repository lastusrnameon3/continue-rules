<#  Run once per machine. Idempotent. Use -WhatIf to dry-run.  #>
[CmdletBinding(SupportsShouldProcess)]
param()
$ex = git config --global core.excludesfile
if (-not $ex) {
  $ex = Join-Path $HOME '.gitignore_global'
  if ($PSCmdlet.ShouldProcess($ex,'set core.excludesfile')) {
    git config --global core.excludesfile $ex
  }
  Write-Host "set core.excludesfile -> $ex"
} else {
  Write-Host "core.excludesfile already set -> $ex (appending)"
}
if (-not (Test-Path $ex)) { New-Item -ItemType File -Path $ex -Force | Out-Null }
foreach ($p in '.claude/','CLAUDE.md','CLAUDE.local.md') {
  if (Select-String -Path $ex -Pattern "^$([regex]::Escape($p))$" -Quiet -ErrorAction SilentlyContinue) {
    Write-Host "  present: $p"
  } elseif ($PSCmdlet.ShouldProcess($p,'add to global excludes')) {
    Add-Content -Path $ex -Value $p; Write-Host "  added:   $p"
  }
}
if (-not (Get-Command jq -ErrorAction SilentlyContinue)) {
  Write-Warning "jq not found - hooks require it (winget install jqlang.jq)"
}
