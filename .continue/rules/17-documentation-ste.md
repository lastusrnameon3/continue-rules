---
name: ste
globs: "**/DEPLOYMENT-*.md"
alwaysApply: false
description: ASD-STE100 Simplified Technical English for deployment documentation. Auto-fires on DEPLOYMENT-*.md. Invoke elsewhere with @ste.
---

Apply to prose only. Never touch code blocks, command strings, file paths, error messages, quoted UI text, or proper nouns.

Classify text first: **procedural** (instructions someone follows) or **descriptive** (explanation/background). Every limit below depends on which. Mixed documents: classify section by section.

Deliberately not applied to `README.md` — README targets a non-scripting reader per `03-writing`, and full STE rigor fights plain-English prose. Do not "fix" that seam.

## Compliance

The official ASD-STE100 specification and dictionary are copyright ASD. This rule encodes paraphrased rules and a publicly sourced word list — **not** the official dictionary. Certified aerospace/defense deliverables require the free official spec (asd-ste100.org) plus human sign-off. **Never claim certified compliance.**

## Sentences
- Procedural: max **20 words**. Descriptive: max **25 words**.
- Max 6 sentences per paragraph, one topic per paragraph.
- One instruction per sentence — two actions only if simultaneous.
- Condition before command: "If the pressure decreases, close the valve."
- Never drop articles, subjects, or verbs to save words. "Ensure file exists" is wrong; "Make sure that the file exists" is correct.
- Numbers, units, abbreviations, quoted strings, code identifiers, proper nouns each count as one word.

## Verbs
- Allowed forms only: infinitive, imperative, simple present/past/future, past participle as adjective.
- No present perfect, no continuous. "We have received" → "We received." No `-ing` as a verb (allowed only inside a technical name — "the mounting bracket").
- Active voice. Passive only in descriptive text when the agent is unknown or unimportant.
- Imperative for instructions: "Open the panel," not "You must open the panel."
- Verbs, not nominalizations: "compress the file," not "perform compression of the file."
- Modals: **can** (possibility), **will** (future), **must** (requirement). Never should/would/could/may/might.
- No phrasal verbs: "go down" → decrease, "set up" → install, "carry out" → do.

## Words
- One word, one meaning, one part of speech — never rotate synonyms.
- Domain nouns/verbs (part, tool, product, UI labels) are technical terms — keep as-is, use consistently, do not verb a noun or noun a verb.
- Noun clusters: max **3 words**. Longer clusters get hyphenated or decomposed with prepositions.
- American English. No Latin abbreviations: "e.g." → "for example," "i.e." → "that is," delete "etc."

Highest-frequency substitutions — use the right column:

| Do not use | Use |
|---|---|
| utilize, leverage, employ | use |
| commence, initiate, begin | start |
| terminate, cease, conclude | stop, end |
| ensure, verify, confirm, validate, check | make sure (that), examine |
| perform, conduct, execute, carry out, accomplish | do |
| obtain, acquire, procure | get |
| prior to / subsequent to | before / after |
| in order to | to |
| via, by means of | through, with |
| due to, owing to | because of |
| in the event of/that | if |
| require, necessitate | need, must |
| indicate, signify, demonstrate | show |
| modify, alter | change |
| approximately | about |
| sufficient, adequate | enough |
| additional, supplementary | more |
| depress (a button) | push, press |
| above / below (quantities) | more than / less than |

One meaning, one part of speech: **close** = verb only (adjective sense → near) · **test** = noun only ("do a test") · **check** ≠ verify → "make sure that" · **follow** = "come after" only; for rules use **obey** · **right** = direction only, never "correct" · **help** = verb only, noun is **aid** · **level** = approved as noun and adjective (documented exception).

Delete hedges: any/appropriate/applicable/relevant used vaguely — name the specific thing. Rewrite "there is/there are" openers with a real subject.

## Warnings, cautions, notes
- **WARNING** = risk of injury or death. **CAUTION** = risk of damage. **NOTE** = information only, never an instruction.
- Command or condition first, risk second: "WARNING: Do not touch the terminal. The terminal has a dangerous voltage."
- Notes obey the 25-word descriptive limit.

## Self-check pass
After drafting, scan once for each and fix every hit before finishing:

1. Any sentence over the 20/25-word limit for its type
2. Contractions, semicolons
3. should / would / could / may / might
4. has been / have been / had been / is being / was being
5. `-ing` words used as verbs
6. Missing articles (a/an/the/this) before nouns
7. Synonym rotation — same object, two names
8. Any word in the left column above
9. Warnings that state the risk before the command

Full substitution set, worked examples, and the procedural-rewrite walkthrough live in Notion → Continue Rules → Documentation → 17 — STE Technical Writing. This file is the dense operational subset.
