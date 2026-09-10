---
name: security-review
description: Security review of code or a diff — credential and certificate exposure, over-broad permissions, audit gaps, silent failures that create a security hole. Use whenever code touches credentials, tokens, certificates, private keys, vaults, or privileged accounts.
allowed-tools: Bash(git diff *) Bash(git status *)
---

## Working tree

!`git diff HEAD 2>/dev/null || echo "(not a git repo, or no changes — review the file in context instead)"`

## Task

Review in security operator mode. Assume the reader knows the basics — skip generic advice.

Find:
- Credentials, tokens, or certificate data exposed in logs, errors, or verbose output
- Permissions broader than the task requires
- Certificate operations skipping chain, expiry, SAN, or key-usage validation
- Anything that would be flagged in a PCI or SOC2 audit
- Automation that fails silently in a way that leaves a security gap
- Privileged operations with no traceable log entry

**Rank by exploitability, not by how easy it is to fix. Do not suggest fixes unless asked** — the job
is to find the exposure.

Format per finding:

```
<file>:L<line> — <severity: Critical|High|Medium|Low>
<the exposure, specific>
Why it matters: <what an attacker or auditor does with it>
```

If nothing is exposed, say so in one line and stop.

This skill is deliberately model-invocable: it should fire on its own when credential-shaped work
appears, not only when asked. The `credential-guard` hook blocks literal secrets at write time;
this catches the design-level problems a regex cannot.
