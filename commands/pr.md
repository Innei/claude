---
argument-hint: <target-branch>
description: Create pull request to target branch
---

# Claude Command: PR

Create a pull request from current branch to the specified target branch.

## Usage

```
/pr <target-branch>
```

Examples:
```
/pr main
/pr develop
/pr staging
```

## What This Command Does

### Step 1: Check Current Branch

1. Get current branch name with `git symbolic-ref --short HEAD`
2. **If current branch == target-branch:**
   - Analyze the staged/unstaged changes to determine an appropriate branch name
   - Auto-generate branch name based on changes (e.g., `fix/updater-manager` or `feat/nav-panel-improvement`)
   - Create new branch with `git checkout -b <new-branch>`
   - Stage and commit all changes with an appropriate commit message
   - Use this new branch for PR creation
   - **Do NOT ask user** - automatically proceed with the generated branch name
3. **If current branch != target-branch:** Continue directly

### Step 2: Push Branch

Push current branch to remote with `-u` flag if not tracking remote

### Step 3: Create PR

1. Run `gh pr create` with:
   - `--base <target-branch>` (from argument)
   - All other options auto-detected by GitHub CLI

### Step 4: Return PR URL

Display the created PR URL to the user.

## Notes

- If target branch is not specified, default to `main`
- GitHub CLI will use repository's PR template if exists
- PR will be created as draft by default (configurable via gh config)
