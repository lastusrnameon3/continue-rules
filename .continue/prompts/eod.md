---
name: End of Day Summary
description: Generate end-of-day session summary
invokable: true
---

Generate two outputs:

## 1. Session Summary

Generate a session summary using the Writing Standards rule (Session Summary section). Review our entire conversation today. Be specific in every section — no vague progress statements. If something is unclear from our conversation, flag it rather than assume. The Tomorrow section gets one specific action, not a list.

Save to `.continue/session/YYYY-MM-DD-session.md`.

## 2. STATE.md Entry

After the session summary, produce a dated entry to append to STATE.md at the repo root. Use this exact format:

```
## YYYY-MM-DD — [short label for what this session was about]

### Built
[Bullet list — what exists now that did not before this session]

### Decisions + Reason
[Bullet list — each decision and the one-line reason why]

### Unresolved
[Bullet list — open disagreements, blocked items, unanswered questions]
[If none: "None."]

### Constraints
[Anything that limits future work — environment, access, dependencies, timing]
[If none: "None."]

### Next Slice Queued
[One line — the specific next task. Not a goal, not a list.]
```

Append this entry below the most recent entry in STATE.md. Do not overwrite existing entries.
