---
name: learning-reflection
description: Record learnings and reflections from errors, debugging sessions, or task completion. Use this skill when encountering errors, completing complex tasks, or when insights should be preserved for future reference.
user-invocable: true
---

# Learning & Reflection

Manage learnings in `~/.claude/LEARNINGS.md` to avoid repeating past mistakes and accumulate knowledge over time.

## When to Trigger

- **Before starting any task**: Read `~/.claude/LEARNINGS.md` to check for relevant past learnings
- **After encountering and resolving an error**: Record root cause and fix
- **After debugging a tricky issue**: Record the investigation process and solution
- **After discovering a non-obvious behavior**: Record the gotcha for future reference
- **When a task reveals a pattern worth remembering**: Record the pattern

## Recording Format

Append to `~/.claude/LEARNINGS.md` using this format:

```markdown
## [YYYY-MM-DD] - [Short Topic Title]

- **Context**: What was being done
- **Problem**: What went wrong or was discovered
- **Root Cause**: Why it happened
- **Solution**: How it was fixed
- **Lesson**: How to avoid this next time
```

## Rules

- MUST read `~/.claude/LEARNINGS.md` at the start of every task session
- MUST record learnings immediately when an error is resolved — don't wait until the end
- MUST focus on actionable insights, not obvious information
- MUST keep entries concise — bullet points, not paragraphs
- MUST include the date for every entry
- SHOULD group related learnings under the same date/topic heading
- SHOULD reference specific files, commands, or error messages when relevant
- NEVER record sensitive information (secrets, credentials, personal data)
- NEVER duplicate existing entries — check before writing

## Reading Learnings

When starting a task, read `~/.claude/LEARNINGS.md` and look for entries related to:

1. The technology stack being used
2. The specific files or modules being modified
3. Similar error patterns or task types
4. Project-specific gotchas

If relevant learnings are found, apply them proactively to avoid known pitfalls.
