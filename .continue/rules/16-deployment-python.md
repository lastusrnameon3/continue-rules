---
name: Deployment — Python
globs: "**/DEPLOYMENT-python.md"
alwaysApply: false
description: Zip-based deployment for Python scripts. State target platform (Windows or Linux) per project.
---

Reference DEPLOYMENT-checklist.md for change control and credential requirements.
State target platform at the top: Windows or Linux.
If Linux — also follow SSH/Kerberos and dzdo standards from DEPLOYMENT-linux.md.

### What Gets Deployed
- requirements.txt must be included — no exceptions
- All dependencies pinned — no unpinned installs on target
- Exclusions: `__pycache__`, `*.pyc`, `.env`, logs, `.git`

### Target Environment
| Item | Dev | Prod |
|---|---|---|
| Target path | | |
| Platform | Windows / Linux | Windows / Linux |
| Python version required | | |
| Run-as user | | |
| Virtualenv path | | |

### Virtualenv Decision
- **Option A** — included in zip (no internet on target)
- **Option B** — rebuilt on target (pip available; test in dev first)

### Package
```bash
# Option A (with venv)
zip -r releases/scriptname-v1.2.0.zip scriptname/ \
    --exclude "*.pyc" --exclude "*/__pycache__/*" --exclude "*.log" --exclude ".env"
# Option B (without venv)
zip -r releases/scriptname-v1.2.0.zip scriptname/ \
    --exclude "*.pyc" --exclude "*/__pycache__/*" --exclude "*/venv/*" \
    --exclude "*.log" --exclude ".env"
unzip -l releases/scriptname-v1.2.0.zip
```

### Deploy — Linux
```bash
klist
scp releases/scriptname-v1.2.0.zip username@targethost:/tmp/
ssh username@targethost
dzdo cp -r /opt/scripts/scriptname /opt/scripts/scriptname-backup
dzdo unzip /tmp/scriptname-v1.2.0.zip -d /opt/scripts/
# Option B only:
dzdo python3 -m venv /opt/scripts/scriptname/venv
dzdo /opt/scripts/scriptname/venv/bin/pip install \
    -r /opt/scripts/scriptname/requirements.txt --no-cache-dir
dzdo /opt/scripts/scriptname/deploy-permissions.sh
dzdo /opt/scripts/scriptname/venv/bin/python \
    /opt/scripts/scriptname/scriptname.py --dry-run
rm /tmp/scriptname-v1.2.0.zip
```

### Deploy — Windows
```powershell
Copy-Item ".\releases\scriptname-v1.2.0.zip" -Destination "\\targetserver\deployments\"
Rename-Item "C:\scripts\scriptname" "C:\scripts\scriptname-backup"
Expand-Archive -Path "\\targetserver\deployments\scriptname-v1.2.0.zip" `
  -DestinationPath "C:\scripts\scriptname"
# Option B only:
C:\scripts\scriptname\venv\Scripts\pip.exe install `
  -r C:\scripts\scriptname\requirements.txt --no-cache-dir
C:\scripts\scriptname\venv\Scripts\python.exe `
  C:\scripts\scriptname\scriptname.py --dry-run
```

### Post-Deployment Verification
- [ ] Python version matches requirement
- [ ] If Option B: pip install completed with no errors
- [ ] Permissions and ownership correct
- [ ] Smoke test output matched expected
- [ ] Transfer file cleaned

### Version Record
| Field | Value |
|---|---|
| Version | |
| Platform | Windows / Linux |
| Virtualenv method | Included / Rebuilt on target |
| Python version on target | |
| Deployed by | |
| Change request | |
| MR/PR | |
