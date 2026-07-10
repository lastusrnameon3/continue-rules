---
name: Jira Card Updates
description: Generate Jira-ready card updates from today's work
invokable: true
---

Based on our session today, generate Jira card updates.

For each piece of work that belongs in a Jira card, produce this exact block:

---
CARD: [ticket number if known, or NEW CARD]
SUMMARY: [one line — what was done or decided]
DETAIL:
[2-3 sentences max. What changed, what it does now, what was decided.]
NEXT ACTION:
[One specific task. Who does it. What done looks like.]
BLOCKER:
[If none, omit this field entirely. If blocked: what is blocking and who unblocks it.]
---

Rules:
- No engineering jargon a PM could not read
- Next Action must be specific enough to assign to a person
- Skip work that is purely internal with no Jira relevance
- If ticket number is unknown write: UNKNOWN — check [description]
