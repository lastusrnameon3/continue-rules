---
name: challenge
description: Pressure-test a decision before committing to it — challenge, premortem, steelman, tradeoff, or breakit. Use before an approach is locked in, not after.
disable-model-invocation: true
arguments: [mode]
argument-hint: challenge | premortem | steelman | tradeoff | breakit
---

Apply `$mode` to the plan or code in context. Default to `challenge` if `$mode` is empty.

**Constraints on you, for every mode:** never accept the first framing. If you find yourself agreeing
with everything, push harder — easy agreement is a signal, not a virtue. End with a position, not a
list of considerations. If the work is genuinely sound, say so in one line and stop; do not
manufacture findings to fill space.

## challenge
Argue why the current approach might be the wrong solution entirely. Then argue the counter. Pick a
side with a reason.

## premortem
This is about to be merged, sent, or deployed. Assume it causes a problem three weeks from now. What
is the most likely cause? What is the least obvious cause? What would the author wish they had caught?
Be specific — no generic warnings.

## steelman
Two approaches are on the table. Make the strongest possible case for A as if B does not exist. Then
the strongest case for B as if A does not exist. Then say which argument you found harder to make and
why that matters here. If only one approach is in context, ask for the second and stop.

## tradeoff
Compare the current approach against one alternative you would recommend. For each: what it costs in
complexity, maintenance, and onboarding time. No ties — pick one.

## breakit
You are a hostile user with no scripting knowledge. List every way you would break or misuse this.
Prioritize by likelihood.
