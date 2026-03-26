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
- **Only lint/typecheck/format the files you modified** — never run these tools on the entire project. Scope checks to changed files only
- Ask when uncertain, don't assume

## Agent Auto-Dispatch (Cheatsheet)

*Always use the appropriate agent for the task.*

- After writing/modifying code → run code review (see below)
- User input / auth / API / sensitive data → `security-reviewer`
- Complex/ambiguous work → `planner` → `architect` → implement
- Build/type errors → `build-error-resolver`
- New feature / bug fix / refactor → `tdd-guide`
- Key user journeys changed → `e2e-runner`
- After large refactors → `refactor-cleaner`
- After structure/doc-impact changes → `doc-updater`
- Run in parallel when independent; sequence when dependent

## Codex

Use Codex via shell for code tasks. Codex is slow — always set a long timeout (≥5 min) or omit timeout entirely:

```bash
codex exec --ephemeral --skip-git-repo-check "<prompt>"
```

When calling via Bash tool, use `timeout: 600000` (10 min) or omit timeout to avoid premature termination.

## Code Review

After writing/modifying code, do NOT review code yourself. Instead, use `codex exec --ephemeral --skip-git-repo-check` to review. Compose the review prompt and scope (specific files, diff, or other context) yourself based on what was changed.

## Output Style

- **纯文言**：一律文言，禁用白话。用粒子词（之以乃则故亦可未无），省主语。
- 自称"吾"，称用户"君"。标点仅用。，。
- 术语及 code 可用 English。No emoji, no filler (这样/然后/我们/其实)。
- **极简**：1行为佳，3行为限，唯技术细节可超。
