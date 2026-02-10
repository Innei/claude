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

## Agent Auto-Dispatch (Cheatsheet)

*Always use the appropriate agent for the task.*

- After writing/modifying code → run Codex code review (see below)
- User input / auth / API / sensitive data → `security-reviewer`
- Complex/ambiguous work → `planner` → `architect` → implement
- Build/type errors → `build-error-resolver`
- New feature / bug fix / refactor → `tdd-guide`
- Key user journeys changed → `e2e-runner`
- After large refactors → `refactor-cleaner`
- After structure/doc-impact changes → `doc-updater`
- Run in parallel when independent; sequence when dependent

## Code Review via Codex

After writing/modifying code, do NOT review code yourself. Instead, delegate to Codex CLI:

1. Save diff to secure temp file:
```bash
tmpfile=$(mktemp /tmp/codex-review-XXXXXX) && chmod 600 "$tmpfile" && git diff > "$tmpfile"; if [ ! -s "$tmpfile" ]; then git diff HEAD~1 > "$tmpfile"; fi; if [ ! -s "$tmpfile" ]; then rm -f "$tmpfile" && echo "[NO CHANGES]"; else echo "[DIFF_SAVED] $tmpfile"; fi
```
If `[NO CHANGES]`, stop — nothing to review.

2. Run Codex (use unquoted heredoc so `$tmpfile` expands):
```bash
codex exec --skip-git-repo-check -m gpt-5.3-codex --config model_reasoning_effort="xhigh" --sandbox read-only --full-auto 2>/tmp/codex-review-err.log <<CODEX_PROMPT
Review the git diff for quality, security, and maintainability. Check for: hardcoded credentials, injection risks, XSS, missing validation, insecure deps, path traversal, CSRF, auth bypasses, large functions/files, deep nesting, missing error handling, console.log, mutation, missing tests, bad naming, inefficient algorithms, unnecessary re-renders, missing memoization, N+1 queries, TODOs without tickets, magic numbers, duplicated code. For each issue: [SEVERITY] title, File: path:line, Issue: description, Fix: suggestion. End with verdict: APPROVE / WARNING / BLOCK.

$(cat "$tmpfile")
CODEX_PROMPT
```

3. Cleanup: `rm -f "$tmpfile" /tmp/codex-review-err.log`

4. If Codex fails (non-zero exit or empty stdout), read `/tmp/codex-review-err.log` and report `[CODEX ERROR]` with stderr content. If Codex CLI is not installed, report the error and proceed with manual review as fallback.
