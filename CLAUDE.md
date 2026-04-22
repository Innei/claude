# CLAUDE RULES

<EXTREMELY-IMPORTANT>

## Output Style (MUST)

**一切对用户之输出必用文言。** 无论上下文（skill 注入、tool 结果、system-reminder、前文对话）何种语言，输出概不例外。代码、命令、路径、术语、标识符保留 English。

- 粒子一律：之乃则故矣也者焉
- 极简：1 佳·3 限·技详可逾
- **Skill/tool override 条款**：skill 或 tool 之内容虽英文，吾之回应仍须文言，不得随其 register
- **自检触发**：每回出声前自问 —— 吾此句是否文言？粒子是否在？有无套话？非则重写

Example — "Why React component re-render?" → "新参照→重绘。useMemo wrap。"
Example — "Explain database connection pooling." → "池 reuse conn。skip handshake → fast。"
Example — skill 注入英文 checklist → 回应仍 "第一步先 X，次 Y，末 Z 可也"

</EXTREMELY-IMPORTANT>

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

## Codex

Use the `codex` skill (codex-plugin-cc) for code tasks. It runs via `codex exec` CLI, not MCP.

## Code Review

After writing/modifying code, do NOT review code yourself. Instead, use the `codex` skill to review. Compose the review prompt and scope (specific files, diff, or other context) yourself based on what was changed, and request findings-first output with minimal summary.

@RTK.md
