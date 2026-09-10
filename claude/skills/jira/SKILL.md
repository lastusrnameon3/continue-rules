---
name: jira
description: Turn this session's work into Jira-ready card updates. Use at end of day or when work needs writing up for a tracker.
disable-model-invocation: true
---

From this session's work, produce card updates. One block per piece of work that belongs in a card:

```
---
CARD: [ticket number if known, or NEW CARD]
SUMMARY: [one line — what was done or decided]
DETAIL:
[2-3 sentences max. What changed, what it does now, what was decided.]
NEXT ACTION:
[One specific task. Who does it. What done looks like.]
BLOCKER:
[Omit this field entirely if none. If blocked: what is blocking and who unblocks it.]
---
```

Rules:
- No engineering jargon a PM could not read
- NEXT ACTION must be specific enough to assign to a person
- Skip purely internal work with no tracker relevance
- Unknown ticket number: write `UNKNOWN — check [description]`
- Do not invent ticket numbers
