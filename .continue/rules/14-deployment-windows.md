---
name: Deployment — Windows PowerShell
globs: "**/DEPLOYMENT-windows.md"
alwaysApply: false
description: Zip-based deployment standard for PowerShell scripts on Windows systems
---

Reference DEPLOYMENT-checklist.md for change control and credential requirements.
Do not duplicate checklist content here.
All steps must be copy-paste ready and executable by someone with no scripting background.

## Required Sections

### What Gets Deployed
- Exact zip contents — list every file included and every file excluded
- Zip naming: `scriptname-v1.2.0-YYYYMMDD.zip`
- Zip source location before deployment: ___
- Exclusions: logs, local config, secrets, .git directory

### Target Environment
| Item | Dev | Prod |
|---|---|---|
| Target path | | |
| Run-as account | | |
| Directory permissions | | |
| Credential vault safe | | |
| Privileged session required | No | Yes |

### Package Steps
```powershell
Compress-Archive -Path ".\scriptname\*" `
  -Exclude "*.log","local.config.ps1" `
  -DestinationPath ".\releases\scriptname-v1.2.0-20240315.zip"
$zip = [System.IO.Compression.ZipFile]::OpenRead(".\releases\scriptname-v1.2.0-20240315.zip")
$zip.Entries.Name
$zip.Dispose()
```

### Deploy Steps
```powershell
Copy-Item ".\releases\scriptname-v1.2.0-20240315.zip" `
  -Destination "\\targetserver\deployments\"
Rename-Item "C:\scripts\scriptname" "C:\scripts\scriptname-backup-20240315"
Expand-Archive `
  -Path "\\targetserver\deployments\scriptname-v1.2.0-20240315.zip" `
  -DestinationPath "C:\scripts\scriptname"
Get-ChildItem "C:\scripts\scriptname"
C:\scripts\scriptname\scriptname.ps1 -WhatIf
```

### Rollback
```powershell
Remove-Item "C:\scripts\scriptname" -Recurse -Force
Rename-Item "C:\scripts\scriptname-backup-20240315" "C:\scripts\scriptname"
C:\scripts\scriptname\scriptname.ps1 -WhatIf
```

### Post-Deployment Verification
- [ ] Expected files present in target directory
- [ ] Smoke test output matched expected
- [ ] No errors in Windows Event Log
- [ ] Log file created in expected location (if applicable)

### Version Record
| Field | Value |
|---|---|
| Version | |
| Deployed by | |
| Deployment date | |
| Change request | |
| Backup location | |
| MR/PR | |
