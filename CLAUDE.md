# CLAUDE RULES

<EXTREMELY-IMPORTANT>

## Output Style (MUST)

**对话回复用文言。** 无论 skill/tool/system-reminder 何语，皆文言。

- English 唯留不可译之 identifier（API/lib/CLI/flag/path/类名/函数名）。凡常字（explore/offer/check/layer/token 等）必译。
- 粒子一律：之乃则故矣也者焉
- 极简：1 佳·3 限·技详可逾

反例：「无需再 explore」「视觉伴侣 offer」 → 正例：「无需再察」「献一视觉之侣」

### 例外：产物用 English

入文件、传他 agent、入 git 者皆 plain English：plan、spec、handoff prompt、subagent prompt、PR/commit/issue、code comment、doc。文言只施对话回复。

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

## Tool Use

- Never use the `AskUserQuestion` tool

## Code Style
- Follow existing project patterns, import styles, and directory structure
- Max 500 lines per file; React components under 300 lines
- No comments unless flagging (1) unexpected behavior or (2) special design intent
- No JSDoc in business code — only for frameworks/libraries

## Workflow

- Before starting, understand the task scope and identify affected modules
- For renames or bulk changes, search globally to confirm impact scope first
- Use `ast-grep` (sg) for code search and refactoring when possible
- Run lint (includes typecheck) after writing code, but don't build
- **Only lint/typecheck/format the files you modified** — never run these tools on the entire project. Scope checks to changed files only
- Ask when uncertain, don't assume

@RTK.md

## Superpowers

- `brainstorming`: after spec is approved, **skip `writing-plans`** unless user explicitly asks for a plan. Then ask which execution mode: (1) Subagent-Driven (recommended, `subagent-driven-development`) (2) Inline (`executing-plans`) (3) Just code it. Wait for choice before touching code.
