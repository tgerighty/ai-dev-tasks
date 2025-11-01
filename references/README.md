# References - Load On Demand

This directory contains detailed reference documentation that can be loaded when needed to keep context minimal.

## Available References

### 📊 Pattern Libraries
- **`patterns/crud-operations.md`** - Complete CRUD pattern with tRPC, Drizzle, React
- **`patterns/form-handling.md`** - Form validation with React Hook Form and Zod
- **`patterns/api-integration.md`** - External API integration patterns
- **`patterns/auth-flows.md`** - Authentication and authorization patterns
- **`patterns/real-time.md`** - WebSocket and SSE patterns

### 🔒 Security
- **`security/security-checklist.md`** - Comprehensive security validation checklist
- **`security/owasp-top10.md`** - OWASP Top 10 implementation guide
- **`security/auth-patterns.md`** - Secure authentication patterns

### 🧪 Testing
- **`testing/testing-patterns.md`** - Unit, integration, and E2E testing patterns
- **`testing/test-organization.md`** - How to organize test files
- **`testing/mock-data.md`** - Creating test fixtures and mocks

### 🗄️ Database
- **`db/drizzle-patterns.md`** - Drizzle ORM patterns and queries
- **`db/migrations.md`** - Database migration strategies
- **`db/optimization.md`** - Query optimization techniques

### 🌐 API
- **`api/trpc-patterns.md`** - tRPC router patterns
- **`api/rest-conventions.md`** - RESTful API conventions
- **`api/error-handling.md`** - API error handling patterns

### 📝 Git
- **`git/commit-guidelines.md`** - Commit message conventions
- **`git/branch-strategy.md`** - Branching and merging strategies
- **`git/pr-template.md`** - Pull request templates

### ✅ Checklists
- **`checklists/pre-deployment.md`** - Pre-deployment checklist
- **`checklists/code-review.md`** - Code review checklist
- **`checklists/performance.md`** - Performance optimization checklist

## Usage

When you need specific implementation details, load the relevant reference file:

```
Example: "I need to implement CRUD operations"
Load: references/patterns/crud-operations.md

Example: "I need to validate security"
Load: references/security/security-checklist.md

Example: "I need to write tests"
Load: references/testing/testing-patterns.md
```

## Token Optimization

Each reference file is designed to be:
- **Self-contained** - Complete information for the topic
- **~1-2K tokens** - Optimized for single-load context
- **Example-heavy** - Working code examples over theory
- **Pattern-based** - Reusable templates

## Adding New References

When adding new reference files:
1. Keep under 2K tokens when possible
2. Include working code examples
3. Focus on patterns over explanations
4. Use clear file naming
5. Update this index

## Quick Load Commands

For AI assistants:
```
@references/patterns/crud-operations.md  # Cursor
Load: references/testing/testing-patterns.md  # General
```