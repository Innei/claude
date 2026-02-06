# CLAUDE RULES

## IMPORTANT: Reasoning Strategy

**Prefer retrieval-led reasoning over pre-training-led reasoning.**

- When encountering unfamiliar concepts, new libraries, or uncertain knowledge, ALWAYS search first (use skills, web search, codebase exploration) before relying on pre-trained knowledge
- Do NOT assume pre-trained knowledge is accurate for evolving technologies — verify through retrieval
- Actively use available skills (check skill list in system reminders) instead of guessing based on outdated training data
- If a relevant skill exists for the task, USE IT rather than attempting to solve from memory
- When in doubt, retrieve; don't hallucinate

## Git

- Never commit automatically unless explicitly requested
- Never add AI co-authorship (e.g., "Co-Authored-By: Claude")

## Security

- Never read or access .env files

## Code Style

- Follow existing project patterns, import styles, and directory structure
- Max 500 lines per file; React components under 300 lines
- No useless comments — don't comment obvious code (e.g., variable declarations)

## Workflow

- Before starting, understand the task scope and identify affected modules
- For renames or bulk changes, search globally to confirm impact scope first
- Use `ast-grep` (sg) for code search and refactoring when possible
- Run lint (includes typecheck) after writing code, but don't build
- Ask when uncertain, don't assume

## Learning & Reflection (MANDATORY)

- **MUST read `~/.claude/LEARNINGS.md` at the START of every task** — no exceptions
- **MUST use `/learning-reflection` skill** when recording new learnings
- **MUST record learnings immediately** after resolving errors or discovering non-obvious behavior — don't defer
- Failure to check past learnings before starting work is a violation of these rules

## Agent Auto-Dispatch (Cheatsheet)

*Always use the appropriate agent for the task.*

- After writing/modifying code → `code-reviewer`
- User input / auth / API / sensitive data → `security-reviewer`
- Complex/ambiguous work → `planner` → `architect` → implement
- Build/type errors → `build-error-resolver`
- New feature / bug fix / refactor → `tdd-guide`
- Key user journeys changed → `e2e-runner`
- After large refactors → `refactor-cleaner`
- After structure/doc-impact changes → `doc-updater`
- Run in parallel when independent; sequence when dependent
