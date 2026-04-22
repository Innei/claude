---
argument-hint: "[optional: task summary or constraints]"
description: Code directly — skip brainstorm, design doc, spec, and planning gates
---

# CC (Code Direct)

Explicit fast-path mode. Overrides `brainstorming` and `using-superpowers` design-first flows.

## Rules

1. **No** full brainstorm checklists, **no** spec/docs, **no** gated "shall we design?" prompts.
2. **No** standalone Visual Companion invites; use browser only when actually needed.
3. May ask 1–2 clarifying questions, then read code and edit.
4. Edit, add tests, and verify per project conventions / `CLAUDE.md`. Report changes when done.

## If too large

Split into sub-tasks or suggest multiple `/cc` calls. **No** long superpowers flow.

If no `argument-hint`, use the task described in conversation context.
