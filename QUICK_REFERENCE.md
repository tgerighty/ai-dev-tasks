# 🎯 AI Dev Tasks v2 - Quick Reference Card

## The 3-Step Workflow

```
1. Discovery (PRD)     →    2. Planning (Tasks)    →    3. Implementation (Micro-tasks)
   15-30 minutes              10-15 minutes                 Varies by complexity
```

## Step 1: Create PRD
```
@create-prd.md
"I want to build [feature]"
```
AI asks discovery questions → You get right-sized PRD

**Output Types:**
- **Micro PRD** (<1 page): Simple features
- **Standard PRD** (2-3 pages): Medium features
- **Full PRD** (5+ pages): Complex systems

## Step 2: Generate Tasks
```
@generate-tasks.md @[your-prd].md
"Generate tasks from this PRD"
```
AI checks patterns → Scores complexity → Estimates time

**Common Patterns:**
- CRUD Operations
- Form Handling
- API Integration
- Reports/Analytics
- Authentication

## Step 3: Implement with Micro-Tasks
```
@process-task-list.md @[your-tasks].md
"Start with task 1.1"
```
Break into micro-tasks → One file each → Minimal context

**Micro-Task Rules:**
- Target: 1 file
- Context: <500 lines
- Time: 5-30 minutes
- Focus: Surgical changes

## Complexity Guide

| Score | Description | Time | Micro-tasks |
|-------|------------|------|-------------|
| 1-2 | Simple, single file | 30min-2hr | 2-3 |
| 3 | Multiple files, moderate | 2-4hr | 4-6 |
| 4+ | Complex, many files | 4-8hr | 6-10 |

## Testing by Risk Level

| Risk | Inherited From PRD | What to Test |
|------|-------------------|--------------|
| **High** | Auth, payments, data | All paths, errors, security, performance |
| **Medium** | User-facing features | Happy path, main errors |
| **Low** | Internal tools | Basic functionality |

## Quick Patterns

### Add a Button
```
1. Add to UI file → 2. Add handler → 3. Add styles
Time: ~30 minutes
```

### Create Form
```
1. Component → 2. Fields → 3. Validation → 4. Submit → 5. Feedback
Time: ~2 hours
```

### API Endpoint
```
1. Route → 2. Types → 3. Handler → 4. Validation → 5. Tests
Time: ~2-3 hours
```

## Status Markers
- `[ ]` Not started
- `[→]` In progress
- `[x]` Complete
- `[⚠]` Blocked

## Common Commands

### Cursor
```
@create-prd.md
@generate-tasks.md @PRD-file.md
@process-task-list.md @tasks-file.md
```

### Claude Code
```
/create-prd
/generate-tasks
/process-tasks
```

## Tips for Success

1. **Start simple** - Micro PRD for simple features
2. **Use patterns** - 70% match common patterns
3. **Small context** - Better accuracy
4. **Test practically** - "Does it work?"
5. **Track progress** - Use status markers

## When Things Go Wrong

**AI confused?**
→ Reduce context, be more specific

**Task too big?**
→ Break into more micro-tasks

**Pattern not working?**
→ Fall back to custom tasks

**Blocked?**
→ Note it, move to next task

## Remember

✅ Working software > Perfect process
✅ Discovery > Specification
✅ Patterns > Custom work
✅ Small context > Big context
✅ Practical > Theoretical

---

*Full docs: README.md | What's new: WHATS_NEW_V2.md*