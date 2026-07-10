---
name: Context Compress
description: Compress a reference file or page to reduce token cost
invokable: true
---

Compress the specified file or page's prose to reduce the tokens it costs when read into context.

## Guardrail — read first

**Never compress these without explicit confirmation:**
- STATE.md — project state file, read by session-start prompts
- 00-project-context.md — project context rule, always loaded
- Session summaries in .continue/session/ — human-readable by design
- Any file or page other people or other AI sessions treat as a source of truth

If asked to compress something that looks like a control surface, say so and ask for confirmation before proceeding.

## Rules

**Remove:** articles, filler ("just," "basically," "essentially"), pleasantries, hedging, redundant phrasing ("in order to" → "to"), connective fluff.

**Preserve exactly, never touch:** code blocks and inline code, URLs, file paths, commands, tables (compress cell text if prose, keep structure), numbers, dates, version strings, proper nouns, Markdown headings (compress body below, not the heading).

**Compress:** short synonyms, fragments over full sentences, merge bullets that repeat the same point, keep one example where several show the same pattern.

## Process

**Local file:**
1. Read the file
2. Compress prose sections only
3. Save a `<name>.original.<ext>` backup before overwriting
4. Report before/after size

**Notion page:**
1. Fetch the page
2. Compress prose blocks only, leave tables/code/properties untouched
3. Ask before writing back — offer to write to a duplicate page instead of overwriting

## Boundaries
- Only compress .md, .txt, and similar prose formats, or prose blocks of a Notion page
- Never modify code files (.py, .js, .json, .yaml, etc.)
- If unsure whether a block is code or prose, leave it unchanged
- Always leave a way back to the original before any destructive rewrite
