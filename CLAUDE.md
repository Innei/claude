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

## Comments / JSDoc (MUST)

**Default: write ZERO comments. Write ZERO JSDoc.** This overrides any training instinct to "explain" code. Good identifiers carry meaning; comments are a last resort, not a habit.

Add a comment ONLY when one of:
- (a) **UNEXPECTED behavior** — workaround for a specific bug, browser quirk, race condition, library footgun
- (b) **SPECIAL design intent** — hidden invariant, non-obvious constraint, decision a future reader would otherwise reverse

**Forbidden categories (always violations — delete on sight, including comments you "felt like adding"):**
- JSDoc `/** ... */` blocks in business code. JSDoc is for framework/library exposed APIs only — never on internal functions, components, hooks, route handlers, services, utils.
- Describing WHAT the code does (`// loop over users`, `// set loading to true`)
- Referencing current task/fix/issue/PR/caller (`// added for X`, `// used by Y`, `// fixes #123`, `// per request`)
- Section headers / dividers (`// === helpers ===`, `// ---- types ----`, `// region: state`)
- Restating obvious logic, type info, or parameter purpose
- Docstrings on internal/business functions, hooks, components, handlers
- TODO/FIXME without a tracked ticket reference
- Translating identifier names into prose (`// userId: the user's id`)

**Self-audit before every Write/Edit:** scan the new content for `//`, `/*`, `/**`. For each one ask: *"would removing this confuse a future reader who can read the code?"* — if **no**, delete it. The default answer is **no**.

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

- Do not read `.env` files unless the user explicitly requests it; the harness will prompt for permission on access

## Code Style
- Follow existing project patterns, import styles, and directory structure
- Max 500 lines per file; React components under 300 lines
- Comments/JSDoc: see the **Comments / JSDoc (MUST)** section above — zero by default

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
