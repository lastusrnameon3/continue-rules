---
name: Security Review
description: Review in security operator mode
invokable: true
---

Review this in security operator mode. Assume the reviewer knows the basics — skip generic advice. Find: credentials or certificate data exposed in logs or errors, permissions broader than the task requires, anything that would get flagged in a PCI or SOC2 audit, automation that silently fails creating a security gap. Rank by exploitability. Do not suggest fixes unless asked.
