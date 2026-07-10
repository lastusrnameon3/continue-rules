---
name: Deployment — Linux Bash
globs: "**/DEPLOYMENT-linux.md"
alwaysApply: false
description: Zip-based deployment standard for Bash scripts on Linux systems. SSH via Kerberos. Privilege via dzdo.
---

Reference DEPLOYMENT-checklist.md for change control and credential requirements.
All steps must be copy-paste ready.
SSH access is Kerberos token based — confirm token validity before window opens.
Privilege escalation is via dzdo — not sudo, not root directly.

### Target Environment
| Item | Dev | Prod |
|---|---|---|
| Target path | | |
| Run-as user:group | | |
| SSH host | | |
| Kerberos realm | | |
| dzdo access required | Yes | Yes |

### Pre-Deployment — Kerberos
```bash
klist
# If expired:
kinit username@REALM
```

### Package
```bash
tar --exclude='*.log' --exclude='.env' --exclude='.git' \
    -czf releases/scriptname-v1.2.0-20240315.tar.gz scriptname/
tar -tzf releases/scriptname-v1.2.0-20240315.tar.gz
```

### Deploy
```bash
scp releases/scriptname-v1.2.0-20240315.tar.gz username@targethost:/tmp/
ssh username@targethost
dzdo cp -r /opt/scripts/scriptname /opt/scripts/scriptname-backup-20240315
dzdo tar -xzf /tmp/scriptname-v1.2.0-20240315.tar.gz -C /opt/scripts/
dzdo /opt/scripts/scriptname/deploy-permissions.sh
ls -la /opt/scripts/scriptname/
dzdo /opt/scripts/scriptname/scriptname.sh --dry-run
rm /tmp/scriptname-v1.2.0-20240315.tar.gz
```

### Rollback
```bash
dzdo rm -rf /opt/scripts/scriptname
dzdo mv /opt/scripts/scriptname-backup-20240315 /opt/scripts/scriptname
dzdo /opt/scripts/scriptname/scriptname.sh --dry-run
```

### Kerberos Token Expiry During Deployment
```bash
# Do not close existing SSH session
# Reinitialise in a separate terminal:
kinit username@REALM && klist
```

### Post-Deployment Verification
- [ ] Transfer file cleaned from /tmp
- [ ] Files present at target path
- [ ] Permissions and user:group correct
- [ ] Smoke test matched expected
- [ ] No errors in /var/log/messages or application log

### Version Record
| Field | Value |
|---|---|
| Version | |
| Deployed by | |
| Change request | |
| Kerberos principal used | |
| MR/PR | |
