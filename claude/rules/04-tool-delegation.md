---
name: Tool Delegation
---

Raw tool output costs conversation space every time it enters context. Before pulling something in wholesale, ask: do I need the full thing, or a short structured summary?

## Decision Guide

| Task | Approach |
|---|---|
| Locating a definition or call site | Search, then report only `path:line — symbol — short note` |
| Editing 1-2 files, scope obvious | View the exact range, edit, verify — do not dump full files |
| New feature / 3+ files / cross-cutting | Work step by step in the thread; do not compress into one pass |
| Reviewing a diff or file | Use the terse code-review format for findings, not prose |
| Reading a large doc to answer one question | Fetch it, report only the relevant section |
| One-line answer already known | Just answer — no tool call needed |

Rule of thumb: if a tool call's raw output would be 10x longer than the answer needs, summarize before presenting.

## Output Contract

Lookups:
```
<path:line> — <finding, ≤10 words>
```
No match: `No match.`

Edits:
```
<path:line-range> — <change, ≤10 words>
verified: <re-read OK | mismatch @ path:line>
```

## Boundaries
- Never summarize away exact line numbers, symbol names, or error text — those stay verbatim
- Do not refuse a large task to save context — break it into sub-steps and do them
