# Context Template (Optional - For Complex Features Only)

**Note:** Most features don't need a context document. Only use this for complex systems with architectural decisions that need documentation.

## When to Use This Template

Create a context document ONLY when:
- Feature has 10+ tasks with complex dependencies
- Multiple architectural decisions need documentation
- Team needs to understand design choices
- Future developers need implementation guidance

## Simplified Context Template

```markdown
# Context: [Feature Name]

## Quick Summary
[1-2 sentences about what this feature does]

## Key Decisions Made

### Architecture
- **Choice:** [What we decided]
- **Why:** [Brief reason]
- **Alternative:** [What we didn't do and why]

### Technology
- **Using:** [Library/framework chosen]
- **Because:** [Main benefit]

### API Design (if applicable)
- **Pattern:** [REST/GraphQL/other]
- **Format:** [JSON structure example]

## Implementation Notes

### File Organization
```
feature/
├── components/   # UI components
├── api/         # API calls
├── types/       # TypeScript types
└── tests/       # Test files
```

### Key Patterns
- [Pattern 1]: [Where it's used]
- [Pattern 2]: [Where it's used]

### Watch Out For
- [Potential issue 1]
- [Potential issue 2]

## For Micro-Tasks

When implementing micro-tasks for this feature:
1. [Specific guidance if needed]
2. [Dependencies to be aware of]
3. [Testing considerations]
```

## Example: Simple Feature (No Context Needed)

**Feature:** Add dark mode toggle
**Complexity:** Low
**Context document:** NOT NEEDED ❌

Just implement using the task list.

## Example: Complex Feature (Context Helpful)

**Feature:** Multi-tenant authentication system
**Complexity:** High
**Context document:** RECOMMENDED ✓

Document decisions about:
- Session management approach
- Token storage strategy
- Tenant isolation method
- Security considerations

## Remember

- **Most features don't need this**
- **Keep it under 1 page if used**
- **Focus on decisions, not process**
- **Update only if decisions change**

The goal is working software, not documentation.