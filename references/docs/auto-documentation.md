# Documentation Automation System

## Overview
Automatically generate and update documentation from code changes, task completions, and implementations.

## Auto-Generated Documentation Types

### 1. Changelog Generation

#### From Completed Tasks
```typescript
// Generate from task list
function generateChangelog(tasks: CompletedTask[]) {
  const grouped = groupByType(tasks);

  return `
## [Unreleased] - ${new Date().toISOString().split('T')[0]}

### Added
${grouped.feature?.map(t => `- ${t.description}`).join('\n')}

### Changed
${grouped.update?.map(t => `- ${t.description}`).join('\n')}

### Fixed
${grouped.fix?.map(t => `- ${t.description}`).join('\n')}
  `;
}
```

#### Template
```markdown
# CHANGELOG.md

## [Unreleased]

## [1.2.0] - 2025-11-01

### Added
- User profile editing (from task 2.1)
- Dark mode toggle (from task 3.2)
- Email notifications (from task 4.1)

### Changed
- Improved form validation (from task 2.3)
- Updated API response format (from task 3.1)

### Fixed
- Memory leak in data fetcher (from task 1.1)
- Authentication timeout issue (from task 1.2)

### Security
- Added input sanitization (from task 5.1)
- Updated dependencies (from task 5.2)
```

### 2. API Documentation

#### From tRPC Routers
```typescript
// Auto-generate from tRPC definitions
function generateAPIDocs(router: AppRouter) {
  const endpoints = extractEndpoints(router);

  return endpoints.map(endpoint => `
### ${endpoint.method} ${endpoint.path}

**Description**: ${endpoint.description}

**Input Schema**:
\`\`\`json
${JSON.stringify(endpoint.input, null, 2)}
\`\`\`

**Response**:
\`\`\`json
${JSON.stringify(endpoint.output, null, 2)}
\`\`\`

**Authorization**: ${endpoint.protected ? 'Required' : 'Public'}
  `).join('\n');
}
```

#### Generated Output
```markdown
# API Documentation

## Endpoints

### POST /api/users.create

**Description**: Create a new user

**Input Schema**:
```json
{
  "name": "string (required)",
  "email": "string (required)",
  "role": "enum: user | admin"
}
```

**Response**:
```json
{
  "id": "string",
  "name": "string",
  "email": "string",
  "createdAt": "datetime"
}
```

**Authorization**: Required
```

### 3. README Updates

#### Auto-Update Sections
```typescript
// Update README with new features
function updateREADME(features: Feature[]) {
  const readme = fs.readFileSync('README.md', 'utf-8');

  // Find features section
  const featuresSection = features.map(f =>
    `- ✨ ${f.name}: ${f.description}`
  ).join('\n');

  // Replace between markers
  return readme.replace(
    /<!-- FEATURES-START -->.*<!-- FEATURES-END -->/s,
    `<!-- FEATURES-START -->\n${featuresSection}\n<!-- FEATURES-END -->`
  );
}
```

#### README Template with Markers
```markdown
# Project Name

## Features

<!-- FEATURES-START -->
- ✨ User Authentication: Secure login with JWT
- ✨ Dark Mode: Toggle between light/dark themes
- ✨ Real-time Updates: WebSocket notifications
<!-- FEATURES-END -->

## Installation

<!-- INSTALL-START -->
npm install
npm run setup
<!-- INSTALL-END -->

## API Endpoints

<!-- API-START -->
- POST /api/users - Create user
- GET /api/users - List users
- PUT /api/users/:id - Update user
<!-- API-END -->
```

### 4. Component Documentation

#### From JSDoc Comments
```typescript
/**
 * UserProfile Component
 *
 * @description Displays and allows editing of user profile information
 * @param {UserProfileProps} props - Component props
 * @param {User} props.user - User object
 * @param {Function} props.onSave - Save callback
 * @returns {JSX.Element} User profile component
 *
 * @example
 * <UserProfile
 *   user={currentUser}
 *   onSave={handleSave}
 * />
 */
export function UserProfile({ user, onSave }: UserProfileProps) {
  // Component implementation
}
```

#### Generated Component Docs
```markdown
## Component: UserProfile

**Description**: Displays and allows editing of user profile information

**Props**:
| Prop | Type | Required | Description |
|------|------|----------|-------------|
| user | User | Yes | User object |
| onSave | Function | Yes | Save callback |

**Usage**:
```tsx
<UserProfile
  user={currentUser}
  onSave={handleSave}
/>
```
```

### 5. Database Schema Documentation

#### From Drizzle Schema
```typescript
// Auto-generate from schema
function generateSchemaDocs(schema: Schema) {
  return Object.entries(schema).map(([table, def]) => `
## Table: ${table}

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
${def.columns.map(col =>
  `| ${col.name} | ${col.type} | ${col.nullable} | ${col.default} | ${col.comment} |`
).join('\n')}

**Indexes**:
${def.indexes.map(idx => `- ${idx.name}: ${idx.columns.join(', ')}`).join('\n')}

**Relations**:
${def.relations.map(rel => `- ${rel.type}: ${rel.target}`).join('\n')}
  `).join('\n');
}
```

## Automation Scripts

### 1. Post-Task Documentation
```bash
#!/bin/bash
# Run after completing a task

# Update changelog
node scripts/update-changelog.js --task "$1"

# Update README features
node scripts/update-readme.js --scan-features

# Generate API docs if API changed
if git diff --name-only | grep -q "api/"; then
  node scripts/generate-api-docs.js
fi

# Commit documentation
git add docs/ README.md CHANGELOG.md
git commit -m "docs: auto-update documentation"
```

### 2. Pre-Commit Documentation
```javascript
// .git/hooks/pre-commit
const { generateDocs } = require('./scripts/auto-docs');

// Check for code changes
const changedFiles = getChangedFiles();

// Generate appropriate docs
if (hasAPIChanges(changedFiles)) {
  generateAPIDocs();
}

if (hasComponentChanges(changedFiles)) {
  generateComponentDocs();
}

if (hasSchemaChanges(changedFiles)) {
  generateSchemaDocs();
}

// Stage generated docs
exec('git add docs/');
```

### 3. CI/CD Documentation
```yaml
# .github/workflows/docs.yml
name: Auto Documentation
on:
  push:
    branches: [main]

jobs:
  generate-docs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Generate Documentation
        run: |
          npm run docs:generate
          npm run docs:api
          npm run docs:components

      - name: Deploy to GitHub Pages
        if: github.ref == 'refs/heads/main'
        run: npm run docs:deploy
```

## Documentation Templates

### Task Completion Template
```markdown
## Task Completed: ${taskId}

**Description**: ${taskDescription}
**Complexity**: ${complexity}
**Time Taken**: ${actualTime} (estimated: ${estimatedTime})

### Changes Made
${changes.map(c => `- ${c.file}: ${c.description}`)}

### Files Modified
${files.map(f => `- ${f}`)}

### Tests Added
${tests.map(t => `- ${t}`)}

### Next Steps
${nextSteps.map(s => `- ${s}`)}
```

### Feature Documentation Template
```markdown
# Feature: ${featureName}

## Overview
${featureDescription}

## Implementation Details
- **Added in**: Version ${version}
- **Task References**: ${taskIds.join(', ')}
- **Primary Files**: ${mainFiles.join(', ')}

## Usage
${usageExample}

## Configuration
${configOptions}

## API Reference
${apiEndpoints}

## Testing
${testingInstructions}
```

## Inline Documentation

### Code Comments for Auto-Generation
```typescript
// @autodoc
// @category: Authentication
// @description: Validates user credentials and returns JWT token
// @param: email - User email address
// @param: password - User password
// @returns: JWT token and user profile
// @throws: InvalidCredentials, UserNotFound
export async function login(email: string, password: string) {
  // Implementation
}
```

### Generated from Comments
```markdown
## Function: login

**Category**: Authentication
**Description**: Validates user credentials and returns JWT token

**Parameters**:
- `email` (string): User email address
- `password` (string): User password

**Returns**: JWT token and user profile

**Throws**:
- `InvalidCredentials`: When credentials don't match
- `UserNotFound`: When user doesn't exist
```

## Documentation Maintenance

### Keeping Docs Current
```typescript
// Monitor for outdated docs
function checkDocumentationFreshness() {
  const lastCodeChange = getLastCodeChangeDate();
  const lastDocUpdate = getLastDocUpdateDate();

  const daysSinceUpdate =
    (lastCodeChange - lastDocUpdate) / (1000 * 60 * 60 * 24);

  if (daysSinceUpdate > 7) {
    console.warn('⚠️  Documentation may be outdated');
    return false;
  }
  return true;
}
```

### Documentation Coverage
```typescript
// Check documentation coverage
function getDocCoverage() {
  const functions = findAllFunctions();
  const documented = functions.filter(hasJSDoc);

  return {
    total: functions.length,
    documented: documented.length,
    coverage: (documented.length / functions.length) * 100,
    missing: functions.filter(f => !hasJSDoc(f))
  };
}
```

## Quick Documentation Commands

```bash
# Generate all documentation
npm run docs:all

# Generate specific types
npm run docs:api
npm run docs:components
npm run docs:schema
npm run docs:changelog

# Check documentation coverage
npm run docs:coverage

# Validate documentation
npm run docs:validate

# Deploy documentation
npm run docs:deploy
```

## Integration with Task Workflow

### Automatic Updates on Task Completion
1. Mark task as complete in task list
2. Auto-generate changelog entry
3. Update README if feature added
4. Generate API docs if endpoints changed
5. Create component docs if UI added
6. Commit documentation changes

### Example Workflow
```bash
# Complete a task
npm run task:complete "2.1"

# This automatically:
# 1. Updates task list status
# 2. Adds to changelog
# 3. Updates relevant docs
# 4. Creates commit

# Result:
# - tasks/tasks-*.md updated
# - CHANGELOG.md updated
# - README.md updated (if needed)
# - docs/api.md updated (if needed)
```