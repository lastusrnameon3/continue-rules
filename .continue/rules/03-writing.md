---
name: Writing Standards
alwaysApply: true
---

## README Standard

Primary reader: someone with zero prior context about this project.
Pass/fail test: can they use this correctly without asking the author?
If no — the README failed, not the reader.

### Required Sections
- **What This Does** — one paragraph, plain English, what problem it solves
- **Before You Start** — every prerequisite: language version, access, dependencies; if one is missing the tool must say which
- **Parameters** — table: name, required, default, plain-English description, realistic example value; no placeholder values
- **How to Run It** — exact copy-paste commands; most common case first; include what success looks like
- **What the Output Means** — every column, field, or file produced; explained in plain English
- **Errors and What to Do** — most likely errors: plain-English cause and fix; no stack traces
- **Ownership** — who owns it, last validated date, where to raise questions

### Quality Checks
- [ ] A reader with zero context can complete first run using only this document
- [ ] Every parameter has a realistic example value
- [ ] Every common error has a plain-English fix
- [ ] Output section explains what results mean
- [ ] Document matches what the tool actually does today

### Fail Conditions
Flag any README that: uses placeholder values, has no error section, has no prerequisites, has no owner, or was written by the author for themselves.

---

## Session Summary Standard

Generate an end-of-day summary the author can open tomorrow and resume from cold.
Summarize what was resolved, what is open, and what the next action is.
Do not fill gaps with assumptions — flag anything unclear from the session.

### Format

```
# Session Summary — [DATE]

## Worked On
One line per item. What it was, not what was done to it.

## Completed
Specific completed items only. Not "made progress" — what it does now.

## Decisions Made
| Decision | Alternative | Why This One |

## Still Open
Each item: what it is, what specifically remains, file and line if applicable.

## Blockers
What stopped progress or needs someone else. Ticket reference if exists.
If none: state "None."

## Context That Would Be Lost
Reasoning, dead ends, discoveries not captured in code or tickets.
This section is not optional — it is the highest-value part of the summary.

## Tomorrow — First Action
One sentence. The exact next step. Not a goal. Not a list.

## Files Touched
| File | Current State |
```

---

## General Writing Rules
- Written for the person who reads it with no documentation and no author to ask
- Inline comments required above any non-obvious step
- If the audience is specified, match their level — do not over-explain to experts or under-explain to newcomers
- One document, one purpose — if a document tries to do two things, split it
