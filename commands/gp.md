---
argument-hint: [commit-message]
description: Commit all changes and push to current branch
---

# Claude Command: GP

Commit all changes and push to the current branch.

## Usage

```
/gp [commit-message]
```

Examples:
```
/gp
/gp fix: resolve login issue
/gp "feat: add user profile page"
```

## What This Command Does

### Step 1: Check Repository Status

1. Verify we're in a git repository
2. Check if there are staged changes
3. Check if there are unstaged changes

### Step 2: Stage Changes

1. **If no staged changes:**
   - Ask user if they want to stage all changes (`git add .`)
   - Or stage specific files (ask user which files)

### Step 3: Learn Project Commit Style

1. Check recent commit history: `git log -5 --oneline`
2. Analyze the project's commit message format and style
3. Note common patterns (prefixes, language, structure)

### Step 4: Create Commit

1. **If commit-message provided:**
   - Create commit with `git commit -m "<message>"`
2. **If no message provided:**
   - Generate message from staged changes following the project's observed style
   - Use conventional commit format if project follows that pattern

### Step 5: Push to Remote

1. Get current branch name
2. Push with `git push` (if upstream is set) or `git push -u origin <branch>`

### Step 6: Return Result

Display commit hash and push result to user.

## Notes

- If no commit message is provided, Git will open the default editor
- Use conventional commit format for automatic changelog generation
- Consider using `git status` before committing to review changes
