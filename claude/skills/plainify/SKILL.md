---
name: plainify
description: Make code readable to a non-scripter — rename cryptic variables, add plain-English comments, or both. Use when work will be handed to teammates without a scripting background.
disable-model-invocation: true
arguments: [mode]
argument-hint: names | comments | both (default)
---

Apply `$mode` to the code in context. Default to `both` if empty.

**Never change logic, output, or behavior.** This is a readability pass only. If a rename would
collide with an existing identifier, or a variable is part of a public interface, say so and leave it.

## names
Rename any variable, parameter, or function whose meaning requires scripting knowledge. Targets:
abbreviations, single letters, and anything whose name states its type instead of its purpose.
Booleans read as statements: a name like IsRenewalRequired, not renew.

## comments
Add one inline comment above each step a reader with no scripting background would not recognize.
Under 10 words each. Comment the **why**, not the what — `# skip disabled accounts` beats
`# loop through array`. Do not comment lines that are already obvious.

## both
`names` first, then `comments` on the renamed code.

End with a one-line list of what changed, so the diff is reviewable.
