---
name: Deployment Checklist — All Platforms
description: Shared pre/post deployment requirements. Referenced by all platform-specific deployment docs.
paths:
  - "**/DEPLOYMENT-checklist.md"
---

This document covers what is common to every deployment regardless of platform.
Platform-specific steps live in the corresponding DEPLOYMENT doc.
Do not duplicate content from this file into platform docs — reference it.

## Pre-Deployment — Change Control
- [ ] Change request raised and approved — number: ___
- [ ] Change window confirmed — start: ___ end: ___
- [ ] Rollback window defined — if not rolled back by ___, escalate to: ___
- [ ] Affected teams notified — teams: ___
- [ ] On-call contact available for duration of window — name: ___

## Pre-Deployment — Credential Access
Document this before the window opens. Do not discover access issues during deployment.

- Which credential vault/safe holds deployment credentials: ___
- Is privileged session management required: Yes / No
- If Yes — estimated deployment duration: ___ / session timeout: ___
- If deployment duration exceeds session timeout: document credential re-retrieval plan here
- Is a separate change request required for credential access: Yes / No
- Credentials required — list type, not value:
  - [ ] SSH token/key — confirm valid before window opens
  - [ ] Service account — vault/safe: ___
  - [ ] Any additional: ___

## Session Expiry Risk
This is the most common cause of mid-deployment failure.
If the privileged session expires mid-deployment and credentials become inaccessible:
- Who to call: ___
- Emergency credential access procedure: ___
- Whether rollback is possible without credentials: Yes / No
- If No — document the safe recovery path here before starting

## Post-Deployment — Close Out
- [ ] Deployment verified — see platform doc for specific checks
- [ ] Change request updated with completion status, time, and deploying engineer name
- [ ] Affected teams notified — deployment complete
- [ ] Backup of previous version confirmed retained at: ___
- [ ] Any issues encountered documented in change request notes
