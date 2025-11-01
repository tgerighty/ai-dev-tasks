# AGENTS GUIDE

**Version**: 2.0.0 - Ultra-Optimized
**Target**: Factory.ai droids and custom coding agents
**Last Updated**: 2025-10-31

---

## 🚫 ABSOLUTE REQUIREMENTS

**These rules are non-negotiable. Violation = task failure.**

| Category | Rule | Details |
|----------|------|---------|
| **Reading** | Read thoroughly | Full files + all references before any changes |
| **Size** | Keep small | File ≤300 LOC, Function ≤50 LOC, Params ≤5 |
| **Security** | No secrets | Never commit/log secrets; validate all inputs |
| **Testing** | Test everything | New code = tests; bugs = regression tests first |
| **Types** | No `any` | Explicit types always; prefer strict TypeScript |
| **Organization** | Tests separate | ALL tests in `tests/`, `__tests__/`, or `test/` folders |
| **Validation** | Parameterized queries | Never concatenate SQL; use schemas (Zod/yup) |

---

## 📋 QUICK REFERENCE

### Code Limits
| Item | Maximum |
|------|---------|
| File | 300 lines |
| Function | 50 lines |
| Parameters | 5 |
| Complexity | 10 |

### Tech Stack
**Framework**: Next.js 15 + TypeScript + tRPC
**Database**: PostgreSQL 18 + Drizzle ORM
**Cache**: Valkey 8
**Auth**: Better Auth
**UI**: shadcn/ui + Tailwind
**Testing**: Jest/Vitest + Playwright

---

## 🔧 CORE RULES

### 1. Development Workflow
```
Problem → Small Change → Review → Refactor → Repeat
```

**Before coding:**
- Write problem 1-pager (Context/Problem/Goal/Constraints)
- Evaluate multiple approaches
- Choose simplest solution

**During coding:**
- Read entire context first
- Search global references
- Document assumptions
- Keep changes minimal

### 2. TypeScript Rules
```typescript
// ✅ DO
import React from 'react';
const items: string[] = [];
const result: User = (() => {
  if (!condition) return null;
  return fetchUser();
})();

// ❌ DON'T
const x: any = something;
let user: User | undefined; // later assigned
const path = baseUrl + '/api'; // use new URL()
```

**Key patterns:**
- Normal imports only (no dynamic/require)
- Arrow functions with `{}` blocks
- IIFE over late assignment
- `new URL()` for path construction
- `obj?.x || ''` over `'x' in obj`

### 3. Database (Drizzle/Prisma)
```typescript
// ✅ Simple authorized query
const user = await db.user.findFirst({
  where: {
    id: userId,
    orgId: currentOrgId
  }
});
if (!user) throw new AppError('Not found');

// ✅ Parallel queries
const [user, posts] = await Promise.all([
  db.user.findUnique({ where: { id } }),
  db.post.findMany({ where: { userId: id } })
]);

// ❌ Deep nesting (>2 levels)
// ❌ Schema mutations (never run push/migrate)
```

**Rules:**
- Read schema first
- Use upsert over update
- Array transactions, not interactive
- No `await` while building operations

### 4. Testing
```typescript
// ✅ Test organization
project/
├── src/          # Source (NO tests here)
├── tests/        # ALL tests here
│   ├── unit/
│   ├── integration/
│   └── e2e/

// ✅ Every function
describe('fetchUser', () => {
  it('returns user on success', () => {});
  it('throws on not found', () => {});
});
```

**Requirements:**
- ≥1 happy path + ≥1 failure per function
- Mock external dependencies
- Deterministic and independent
- Security scanners exclude test folders

**Configuration:**
- `.snyk` → exclude test paths
- `sonar-project.properties` → exclude test paths
- `codeql-config.yml` → exclude test paths

### 5. Security
| Risk | Mitigation |
|------|-----------|
| Secrets | Environment variables only |
| SQL Injection | Parameterized queries |
| XSS | Encode outputs |
| CSRF | Token validation |
| Permissions | Least privilege |

```typescript
// ✅ Input validation
const schema = z.object({
  email: z.string().email(),
  age: z.number().min(0).max(150)
});
const data = schema.parse(input);

// ❌ Never
const query = `SELECT * FROM users WHERE id = ${userId}`;
```

### 6. Styling (Tailwind)
```typescript
// ✅ Preferred patterns
<div className="flex flex-col gap-4">
<Icon className="size-4" /> // not w-4 h-4
<div className={cn('base', isActive && 'active')} />

// Spacing: multiples of 4 (p-4, gap-4, m-4)
// Colors: shadcn theme colors
// Layout: flex/grid with gap (not margin)
```

### 7. Error Handling
```typescript
// Expected errors
throw new AppError('User not found');

// HTTP responses
throw new ResponseError(403, JSON.stringify({
  message: 'Access denied'
}));

// No sensitive data in errors
```

### 8. Clean Code
**Prefer:**
- Guard clauses over nested ifs
- Single responsibility per function
- Intention-revealing names
- Side effects at boundaries
- Symbolic constants (no magic numbers)

**Avoid:**
- Premature abstraction
- Ignoring errors/warnings
- Broad exception types
- Hidden "magic"

---

## 🎯 MICRO-TASK DELEGATION

**For sub-task droids:**
- One specific task per droid
- Limit to 3-5 files maximum
- Provide only relevant context
- Clear, focused objectives
- Avoid scope creep

**Claude Code droids:**
- `frontend-engineer-droid-forge` - React/Next.js/UI
- `backend-security-specialist-droid-forge` - API/security
- `database-specialist-droid-forge` - PostgreSQL/Drizzle
- `testing-droid-forge` - Tests/coverage
- `typescript-specialist-droid-forge` - Type safety
- `code-reviewer-droid-forge` - Quality review

**Pattern:**
```json
{
  "subagent_type": "frontend-engineer-droid-forge",
  "description": "Create component",
  "prompt": "Build responsive profile component with TypeScript interfaces and a11y"
}
```

---

## 📖 REFERENCE FILES

**Load on-demand for detailed examples:**

### Code
- [Component Interface](references/code/typescript-component-interface.ts)
- [Error Patterns](references/patterns/error-handling-patterns.ts)
- [API Response](references/patterns/api-response-patterns.ts)

### Testing
- [Unit Test Template](references/testing/unit-test-template.ts)
- [Testing Patterns](references/testing/testing-patterns-examples.ts)

### Security
- [Input Validation](references/security/input-validation-examples.ts)
- [Security Checklist](references/security/security-checklist.md)
- [Prisma Queries](references/prisma/prisma-query-examples.ts)

### Patterns
- [Naming Conventions](references/patterns/naming-conventions.md)
- [Anti-Patterns](references/clean-code/anti-patterns-examples.ts)

### Templates
- [ADR Template](references/templates/adr-template.md)
- [Project Structure](references/templates/project-structure.md)

### Git & Workflows
- [Commit Guidelines](references/git/commit-message-guidelines.md)
- [Validation Checklist](references/checklists/validation-checklist.md)

---

## 📝 CHANGELOG FORMAT

**Public packages** (have version in package.json):
```markdown
## 0.1.3

### Patch Changes
- fix authentication bug
- improve error messages
```

**Private packages** (`private: true`):
```markdown
# Changelog

## 2025-10-31 14:30
- improve user experience
- fix startup crash
```

**Style:**
- Present tense (fix, improve, add)
- Concise (omit "implement", "added")
- No nesting
- Include code when relevant

---

## 🎓 GUIDING PRINCIPLES

1. **Simplicity** - Choose the simplest solution
2. **Iterative** - MVG first, refine later
3. **Flexible** - Deviate when clearly better (document in ADR)
4. **Clear** - Concrete examples over jargon

---

## 📊 VERSION HISTORY

### v2.0.0 (2025-10-31)
- **Major refactor**: Further 60% token reduction
- **Removed**: Duplication, verbose diagrams, incomplete sections
- **Consolidated**: Related rules into tables
- **Enhanced**: Quick reference format
- Estimated tokens: ~7K (from ~17.5K in v1.1.0)

### v1.1.0 (2025-06-18)
- 85% token reduction (122K → 17.5K)
- Moved mandatory rules first
- Modular reference files

### v1.0.0 (2025-06-17)
- Initial monolithic version
- ~122K tokens