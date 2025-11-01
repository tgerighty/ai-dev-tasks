# Git Commit Guidelines

## Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

## Types
- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation only
- **style**: Formatting, missing semicolons, etc
- **refactor**: Code change that neither fixes a bug nor adds a feature
- **perf**: Performance improvement
- **test**: Adding missing tests
- **chore**: Changes to build process or auxiliary tools
- **revert**: Reverting a previous commit

## Examples

### Simple Commits
```bash
feat: add dark mode toggle to settings
fix: resolve memory leak in data fetcher
docs: update README with new API endpoints
style: format code with prettier
refactor: extract validation logic to utils
perf: optimize image loading with lazy loading
test: add unit tests for auth middleware
chore: update dependencies to latest versions
```

### Detailed Commits
```bash
feat(auth): implement OAuth2 integration

- Add Google OAuth provider
- Create callback handling
- Store tokens securely
- Add user profile sync

Closes #123
```

### Breaking Changes
```bash
feat(api)!: change response format for /users endpoint

BREAKING CHANGE: The /users endpoint now returns data in a
different format. The 'user_name' field is now 'username'.

Migration guide:
- Update client code to use 'username' instead of 'user_name'
- Run migration script: npm run migrate:v2
```

## Scope Examples
- **auth**: Authentication related
- **api**: API endpoints
- **ui**: User interface
- **db**: Database changes
- **deps**: Dependencies
- **config**: Configuration files
- **test**: Testing related

## Best Practices

### 1. Subject Line Rules
- Use imperative mood ("add" not "added" or "adds")
- Don't capitalize first letter
- No period at the end
- Maximum 50 characters

### 2. Body Guidelines
- Wrap at 72 characters
- Explain what and why, not how
- Include motivation for change
- Contrast with previous behavior

### 3. Footer References
- Reference issues: `Closes #123`, `Fixes #456`
- Reference PRs: `Related to #789`
- Breaking changes: `BREAKING CHANGE: description`
- Co-authors: `Co-authored-by: Name <email>`

## Commit Workflow

### 1. Stage Changes Selectively
```bash
# Stage specific files
git add src/components/Button.tsx
git add tests/Button.test.tsx

# Stage parts of files
git add -p

# Review staged changes
git diff --staged
```

### 2. Write Meaningful Commits
```bash
# Good: Clear and specific
git commit -m "fix(auth): prevent session timeout during active use"

# Bad: Vague and uninformative
git commit -m "fix bug"
git commit -m "update stuff"
```

### 3. Amend Recent Commits
```bash
# Add forgotten file to last commit
git add forgotten-file.ts
git commit --amend --no-edit

# Change last commit message
git commit --amend -m "feat: better commit message"
```

### 4. Interactive Rebase (Before Pushing)
```bash
# Squash last 3 commits
git rebase -i HEAD~3

# In editor, mark commits to squash
pick abc123 feat: add user profile
squash def456 fix: typo in profile
squash ghi789 style: format profile code
```

## Branch Naming Conventions

### Format
```
<type>/<ticket>-<description>
```

### Examples
```bash
feature/ABC-123-user-authentication
fix/ABC-456-memory-leak
chore/update-dependencies
hotfix/critical-security-patch
release/v2.0.0
```

## PR Guidelines

### PR Title
- Follow same format as commits
- Be descriptive but concise
- Include ticket number if applicable

### PR Description Template
```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No new warnings generated

## Screenshots (if applicable)
[Add screenshots here]

## Related Issues
Closes #123
```

## Git Hooks (Optional)

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit

# Run tests
npm test || exit 1

# Run linter
npm run lint || exit 1

# Check for console.logs
if git diff --cached --name-only | xargs grep -H "console.log" ; then
  echo "Remove console.log statements"
  exit 1
fi
```

### Commit Message Hook
```bash
#!/bin/sh
# .git/hooks/commit-msg

# Check commit message format
commit_regex='^(feat|fix|docs|style|refactor|perf|test|chore|revert)(\(.+\))?: .{1,50}'

if ! grep -qE "$commit_regex" "$1"; then
  echo "Invalid commit message format!"
  echo "Format: <type>(<scope>): <subject>"
  exit 1
fi
```

## Conventional Commits Specification
For full specification, see: https://www.conventionalcommits.org/