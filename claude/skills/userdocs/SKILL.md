---
name: userdocs
description: Generate a README for a script or project, written for a reader with no prior context. Use when documentation is requested or a README is missing or stale.
disable-model-invocation: true
---

Generate a README following the README Standard in `03-writing`.

Primary reader: a competent professional with **no scripting background and no prior context** on
this project. Pass/fail: can they run it correctly without asking the author? If no, the README
failed — not the reader.

## Required sections
- **What This Does** — one paragraph, plain English, what problem it solves
- **Before You Start** — every prerequisite: language version, access, network, vault permissions.
  If one is missing, the tool must say which.
- **Parameters** — table: name, required, default, plain-English description, realistic example value
- **How to Run It** — exact copy-paste commands, most common case first, and what success looks like
- **What the Output Means** — every column, field, or file produced, in plain English
- **Errors and What to Do** — likely errors, plain-English cause and fix. No stack traces.
- **Ownership** — owner, last validated date, where to raise questions

## Rules
- Realistic example values only. Never `<your-value-here>` or `foo`.
- Never document behavior you have not confirmed in the code.
- **Flag, do not guess.** Anything ambiguous enough that you cannot document it accurately gets
  listed at the end under "Could not document — needs author input", with the file and line.

## Before you finish
- [ ] A reader with zero context can complete a first run from this document alone
- [ ] Every parameter has a realistic example
- [ ] Every common error has a plain-English fix
- [ ] Document matches what the code does **today**

Plain English throughout — the STE rule governs `DEPLOYMENT-*.md`, not this. Do not apply it here.
