---
argument-hint: [pr-number]
description: Update existing pull request with latest commits, title, and body (auto-generated from diff)
---

# Claude Command: Update PR

Update an existing pull request with the latest commits from the current branch, and automatically update the PR title and body based on the current diff.

## Usage

```
/update-pr [pr-number]
```

Examples:
```
/update-pr
/update-pr 123
```

## What This Command Does

### Step 1: Check Current Branch

1. Get current branch name with `git symbolic-ref --short HEAD`
2. Verify branch exists and has commits to push

### Step 2: Push Latest Changes

Push current branch to remote with `git push`

### Step 3: Get Current Diff

1. Get the base branch (typically `main` or `master`) using `gh pr view` or git config
2. Generate diff summary: `git diff <base>...HEAD --stat`
3. Generate detailed diff for changed files: `git diff <base>...HEAD`

### Step 4: Detect PR Number

**If PR number is provided:** Use the provided number
**If PR number is NOT provided:**
   - Auto-detect PR for current branch using `gh pr view --json number`

### Step 5: Generate PR Title

Analyze the diff to generate a concise, descriptive title:

1. **Primary approach**: Use the latest commit message (cleaned up)
   - Remove conventional commit prefixes if desired (feat:, fix:, etc.)
   - Keep it under 72 characters

2. **Fallback approach**: Analyze changed files and diff to generate a title
   - Format: `[component/type]: brief description`
   - Examples:
     - "Auth: Add OAuth2 login support"
     - "UI: Fix responsive layout on mobile"
     - "API: Add rate limiting middleware"

### Step 6: Generate PR Body

Generate a comprehensive PR body using the diff:

```markdown
## Summary

[Brief 1-2 sentence description of what this PR does based on the diff analysis]

## Changes

[Automatically generated list of changes based on git diff --stat and code analysis]

### File Changes
- `path/to/file1.ts`: [description of changes]
- `path/to/file2.ts`: [description of changes]

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing

[Describe test coverage based on added/modified test files]

## Checklist

- [ ] Code follows project style guidelines
- [ ] Tests have been added/updated
- [ ] Documentation has been updated
```

### Step 7: Update PR

Use `gh pr edit` to update both title and body:

```bash
gh pr edit <pr-number> --title "<generated title>" --body "<generated body>"
```

### Step 8: Return PR URL

Display the updated PR URL to the user.

## Diff Analysis Guidelines

When analyzing the diff for title and body generation:

1. **Identify the primary change type:**
   - Bug fixes: Look for fixed issues, error handling, corrections
   - New features: Look for added functions, new components, new routes
   - Refactoring: Look for code restructuring, file moves, name changes
   - Dependencies: Look for package.json, requirements.txt changes

2. **Extract key changes:**
   - List modified files with brief descriptions
   - Identify any breaking changes
   - Note added or removed dependencies
   - Highlight configuration changes

3. **Generate clear descriptions:**
   - Use active voice ("Add feature" not "Feature added")
   - Be specific ("Fix login validation" not "Fix bugs")
   - Include technical details when relevant

## Notes

- If PR number is not specified, automatically detects the PR associated with the current branch
- Pushes all unpushed commits to the remote branch
- Title and body are auto-generated from the diff analysis
- Preserves any manual edits by analyzing the actual changes, not commit messages
- Use `gh pr status` to see all PRs for the current repository
