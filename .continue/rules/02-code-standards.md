---
name: Code Standards
globs: "**/*.{ps1,py,sh}"
alwaysApply: false
---

## Naming
- Names must be self-explanatory to a non-scripter on first read
- No abbreviations unless industry-standard (PKI, TPP, SSL)
- Booleans read as statements: `$IsRenewalRequired` not `$renew`
- Parameters communicate what they expect, not just what they hold

## Functions
- One function, one job — describable in one sentence
- Max 3 parameters before using a hashtable/object
- Max 40 lines without documented justification
- Every function needs: purpose, inputs, outputs, example in comment block
- Return early — no deep nesting

## Error Handling
- No silent failures — every catch block outputs an actionable message
- Error messages answer: what happened, why, what to do next
- Never expose raw exception dumps to end users or logs
- Validate all inputs at entry point — do not trust upstream data
- Fail loud and early

## Readability
- Written for the person who inherits it with no documentation
- Inline comments required above any non-obvious step
- Max 120 character line length
- Group related logic with whitespace

## Structure
- One file, one purpose
- Config values at the top or in a separate config file
- Hardcoded values that could change belong in parameters with defaults
- Separate data retrieval, processing, and output

## Before Committing
- Can a non-scripter follow this line by line?
- Does every error tell the user what to do next?
- Does anything break when the environment changes?
- Does anything work only because Frank knows something undocumented?
