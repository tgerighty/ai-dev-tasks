# Validation Checklist System

## Pre-Implementation Validation

### File & Dependency Check
- [ ] **Target file exists** (or confirm creating new)
- [ ] **Dependencies installed** (check package.json)
- [ ] **Imports available** (verify module paths)
- [ ] **Type definitions exist** (for TypeScript)
- [ ] **Database migrations run** (if schema changes)

### Context Validation
- [ ] **Context size <500 lines** (ideal for micro-tasks)
- [ ] **Single file focus** (one file per micro-task)
- [ ] **Clear requirements** (from PRD/task list)
- [ ] **Pattern identified** (CRUD, form, API, etc.)
- [ ] **No conflicting changes** (check git status)

## During Implementation Validation

### Code Quality Gates
```typescript
// Check before proceeding
const validationChecks = {
  noAnyTypes: !code.includes(': any'),
  functionSize: lines <= 50,
  fileSize: totalLines <= 300,
  hasTypes: allVariablesTyped,
  parametersOk: paramCount <= 5,
};
```

### Security Validation
- [ ] **Input validation** - All user inputs validated
- [ ] **No hardcoded secrets** - Use environment variables
- [ ] **SQL parameterized** - No string concatenation
- [ ] **Output encoded** - Prevent XSS
- [ ] **Auth checked** - Protected routes verified

### Style Validation
- [ ] **Naming conventions** - Consistent with codebase
- [ ] **Code formatted** - Prettier/ESLint rules
- [ ] **Comments added** - For complex logic
- [ ] **No console.log** - Remove debug statements
- [ ] **Imports organized** - Grouped and sorted

## Post-Implementation Validation

### Compilation Check
```bash
# TypeScript compilation
npm run type-check || tsc --noEmit

# Build verification
npm run build

# Lint check
npm run lint
```

### Test Validation
```bash
# Run related tests
npm test -- [test-file]

# Run all tests
npm test

# Check coverage (if applicable)
npm run test:coverage
```

### Functionality Verification
- [ ] **Feature works** - Manual test if needed
- [ ] **No regressions** - Existing features still work
- [ ] **Error handling** - Errors caught and handled
- [ ] **Edge cases** - Handles empty/null/invalid
- [ ] **Performance** - No obvious slowdowns

## Quality Scoring System

### Score Calculation
Each micro-task gets a quality score (0-100):

```typescript
interface QualityScore {
  compilation: number;    // 0-25 points
  tests: number;         // 0-25 points
  security: number;      // 0-20 points
  codeQuality: number;   // 0-20 points
  documentation: number; // 0-10 points
}

// Scoring rubric
const scoring = {
  compilation: {
    compiles: 15,
    noWarnings: 5,
    noTypeErrors: 5,
  },
  tests: {
    hasTests: 10,
    testsPass: 10,
    goodCoverage: 5,
  },
  security: {
    inputValidation: 10,
    noSecrets: 5,
    authChecked: 5,
  },
  codeQuality: {
    noAny: 5,
    smallFunctions: 5,
    goodNaming: 5,
    formatted: 5,
  },
  documentation: {
    hasComments: 5,
    readmeUpdated: 5,
  },
};
```

### Quality Thresholds
- **90-100**: Excellent - Ready for production
- **75-89**: Good - Minor improvements needed
- **60-74**: Acceptable - Review recommended
- **<60**: Needs Work - Must fix issues

## Automated Validation Script

```bash
#!/bin/bash
# validate.sh - Run all validations

echo "🔍 Running Validation Suite..."

# 1. Compilation
echo "📦 Checking compilation..."
if npm run build > /dev/null 2>&1; then
  echo "✅ Compilation successful"
else
  echo "❌ Compilation failed"
  exit 1
fi

# 2. Types
echo "📝 Checking types..."
if npx tsc --noEmit; then
  echo "✅ Type checking passed"
else
  echo "❌ Type errors found"
  exit 1
fi

# 3. Linting
echo "🎨 Checking code style..."
if npm run lint > /dev/null 2>&1; then
  echo "✅ Linting passed"
else
  echo "⚠️  Linting warnings"
fi

# 4. Tests
echo "🧪 Running tests..."
if npm test > /dev/null 2>&1; then
  echo "✅ Tests passed"
else
  echo "❌ Tests failed"
  exit 1
fi

# 5. Security
echo "🔒 Security check..."
if ! grep -r "console.log" src/ > /dev/null; then
  echo "✅ No console.logs found"
else
  echo "⚠️  Console.logs found"
fi

echo "✨ Validation complete!"
```

## Validation by Task Type

### UI Component Validation
- [ ] Renders without errors
- [ ] Props validated
- [ ] Accessibility attributes
- [ ] Responsive design
- [ ] Event handlers work

### API Endpoint Validation
- [ ] Input validation schema
- [ ] Authorization checked
- [ ] Error responses defined
- [ ] Rate limiting (if needed)
- [ ] Documentation updated

### Database Change Validation
- [ ] Migration runs cleanly
- [ ] Rollback works
- [ ] Indexes appropriate
- [ ] Constraints defined
- [ ] Performance acceptable

### State Management Validation
- [ ] State updates correctly
- [ ] No mutations
- [ ] Selectors efficient
- [ ] Actions typed
- [ ] Reducers pure

## Continuous Validation

### Git Hooks (optional)
```bash
# .git/hooks/pre-commit
#!/bin/sh

# Run validation before commit
npm run validate || {
  echo "❌ Validation failed. Fix issues before committing."
  exit 1
}
```

### CI/CD Integration
```yaml
# .github/workflows/validate.yml
name: Validation
on: [push, pull_request]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: npm install
      - run: npm run build
      - run: npm run type-check
      - run: npm run lint
      - run: npm test
      - run: npm run validate
```

## Validation Report Template

```markdown
## Micro-Task Validation Report

**Task**: MT 1.2 - Add user avatar to header
**File**: src/components/header.tsx
**Date**: 2025-11-01

### ✅ Passed Checks
- Compilation successful
- TypeScript types valid
- No security issues
- Tests passing
- Code formatted

### ⚠️ Warnings
- Function slightly long (48 lines)
- Missing JSDoc comment

### 📊 Quality Score: 85/100
- Compilation: 25/25
- Tests: 20/25 (missing edge case test)
- Security: 20/20
- Code Quality: 15/20
- Documentation: 5/10

### 📋 Recommendations
1. Add test for empty avatar URL
2. Add JSDoc for main function
3. Consider splitting into smaller functions

**Status**: APPROVED WITH MINOR SUGGESTIONS
```

## Quick Validation Commands

```bash
# Quick compile check
npm run build --quiet && echo "✅ Builds" || echo "❌ Build failed"

# Quick type check
npx tsc --noEmit && echo "✅ Types OK" || echo "❌ Type errors"

# Quick test of specific file
npm test -- --testPathPattern=header && echo "✅ Tests pass"

# Quick security check
grep -r "console.log\|any\|@ts-ignore" src/ && echo "⚠️ Issues found" || echo "✅ Clean"

# Full validation
npm run validate
```