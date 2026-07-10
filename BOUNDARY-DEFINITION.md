# README.md vs DEPLOYMENT.md — Boundary Definition

## README.md owns
- What the script does and why it exists
- Prerequisites for running (access, PowerShell version, network)
- Parameters, usage, and example commands
- What the output means
- Error messages and what to do next
- Scheduling if applicable
- Ownership and last validated date

## DEPLOYMENT.md owns
- What gets deployed and where it lives on the target system
- How to package it (zip structure, contents, naming)
- How to deploy it (exact steps, exact commands)
- Pre-deployment checklist (what to verify before touching production)
- Rollback procedure (exact steps to get back to previous version)
- Credential and access requirements specific to deployment
- Change management requirements (CHG, EPV, session management)
- Who approves deployment and how that approval is documented
- Environment-specific differences (dev vs prod paths, permissions)

## What neither file owns
- Business logic or architectural decisions (that goes in commit history)
- Test results (that goes in the MR)
- Incident history (that goes in the ticket system)

## The redundancy test
If the same sentence appears in both files, it belongs in one — delete it from the other.
If removing it from one file would leave a reader confused, it belongs in README.md.
If it is only relevant when deploying, it belongs in DEPLOYMENT.md.
