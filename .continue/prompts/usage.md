---
name: Usage Stats
description: Rough estimate of tokens saved by terse mode and compression this session
invokable: true
---

Look back over this conversation for responses given in terse mode and files/pages run through context-compress. Roughly compare terse output length against what normal-toned responses would have run. Report as an estimate range, not a single number.

## Output format

```
USAGE ESTIMATE (approximate — not measured from logs)
Terse-mode replies this session: N
Est. token reduction vs. normal tone: ~X-Y%
Files/pages compressed: N (est. before → after size if known)
```

## Boundaries

Never present this as exact. This is an estimate, not a measurement. If exact numbers are needed, that requires a log-reading tool this environment does not have — say so plainly rather than fabricating precision.
