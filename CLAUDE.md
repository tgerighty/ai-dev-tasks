# CLAUDE.md - Claude Code Configuration for 1:1:1:1 Microgrinding

This file is automatically loaded by Claude Code to configure behavior for this project.

## 🎯 CORE DIRECTIVE: 1:1:1:1 MICROGRINDING

**MANDATORY**: Every task MUST follow the 1:1:1:1 pattern:
```
1 Task → 1 Agent → 1 File → 1 Execution
```

This is NON-NEGOTIABLE. Break ALL work into atomic, surgical micro-tasks.

## 🚫 ABSOLUTE RULES FOR THIS PROJECT

1. **ALWAYS use micro-tasks**: Never implement multiple changes at once
2. **ALWAYS read files completely**: No partial reads or assumptions
3. **NEVER use `any` type**: Explicit TypeScript types required
4. **NEVER mix concerns**: One file, one purpose, one change
5. **ALWAYS validate**: Test each micro-task before moving on
6. **ALWAYS use TodoWrite**: Track every micro-task progress

## 📊 WORKFLOW FOR THIS PROJECT

### When User Requests a Feature:

1. **First, assign Feature ID and create PRD**:
   ```
   ASSIGN NEXT SEQUENTIAL ID: 0001, 0002, 0003...
   Load: ai-dev-tasks/create-prd.md
   Use discovery questions (5-10) to understand the real need
   Create NEW PRD for EACH feature with unique ID
   Output: tasks/PRD-[ID]-[feature].md
   Example: PRD-0001-authentication.md
   ```

2. **Then, generate tasks with SAME ID**:
   ```
   Load: ai-dev-tasks/generate-tasks.md with the PRD
   Use SAME ID as PRD (critical for traceability)
   Match patterns (CRUD, Forms, API, etc.)
   Score complexity and estimate time
   Output: tasks/tasks-[ID]-[feature].md
   Example: tasks-0001-authentication.md
   ```

3. **Finally, implement with microgrinding**:
   ```
   Load: ai-dev-tasks/process-task-list.md with task list
   Break EVERY task into 2-10 micro-tasks
   Execute using 1:1:1:1 pattern
   ```

## 🤖 USE NANO-AGENTS FOR MICRO-TASKS

When implementing, use specialized nano-agents from `.claude/agents/`:

```bash
# For breaking tasks
Task tool with subagent_type: "micro-task-breaker"

# For implementation
Task tool with subagent_type: "code-implementer"

# For testing
Task tool with subagent_type: "test-writer"

# For validation
Task tool with subagent_type: "validator"
```

## 📋 MICRO-TASK BREAKDOWN RULES

### Complexity 1-2 → 2-3 Micro-tasks
```
Example: "Add dark mode toggle"
├── MT 1.1: Add toggle component (15 min, 1 file)
├── MT 1.2: Connect to context (10 min, 1 file)
└── MT 1.3: Add persistence (10 min, 1 file)
```

### Complexity 3 → 4-6 Micro-tasks
```
Example: "Implement form validation"
├── MT 1.1: Create schema (15 min, 1 file)
├── MT 1.2: Add to form (20 min, 1 file)
├── MT 1.3: Error display (15 min, 1 file)
├── MT 1.4: Add triggers (15 min, 1 file)
├── MT 1.5: Style errors (10 min, 1 file)
└── MT 1.6: Add tests (20 min, 1 file)
```

### Complexity 4+ → 6-10 Micro-tasks
Break down further into smaller atomic operations

## ⚡ PARALLEL EXECUTION

When micro-tasks are independent, launch them simultaneously:

```javascript
// PARALLEL - Different files
Task 1: MT 1.1 - Create schema (db file)
Task 2: MT 1.2 - Create UI (component file)
Task 3: MT 1.3 - Create tests (test file)
[Launch all three in one message]

// SEQUENTIAL - Dependencies
Then: MT 2.1 - Connect UI to API (needs both)
```

## 📁 PROJECT STRUCTURE

```
src/
├── app/           # Next.js app router
├── components/    # React components
├── server/
│   ├── api/      # tRPC routers
│   ├── db/       # Drizzle schema
│   └── auth/     # Better Auth
tests/            # ALL tests here (never in src/)
├── unit/
├── integration/
└── e2e/
```

## 🔍 VALIDATION CHECKLIST

Before marking ANY micro-task complete:
- [ ] Single file modified (1:1:1:1 rule)
- [ ] Context was <500 lines
- [ ] Code compiles
- [ ] Types explicit (no `any`)
- [ ] Tests pass
- [ ] TodoWrite updated

## 📊 TECH STACK

**Frontend**: Next.js 15, TypeScript, React, shadcn/ui, Tailwind
**Backend**: tRPC, PostgreSQL 18, Drizzle ORM, Valkey 8
**Auth**: Better Auth v1
**Testing**: Vitest, Testing Library, Playwright

## 🔗 LAZY LOADING

Load references ONLY when needed for specific micro-task:
- `/references/patterns/crud-operations.md` - CRUD pattern
- `/references/patterns/form-handling.md` - Forms
- `/references/patterns/parallel-processing.md` - Parallel execution
- `/references/testing/test-templates.md` - Test generation
- `/references/security/security-checklist.md` - Security

## 💡 QUICK COMMANDS

```bash
# Start workflow
Load: ai-dev-tasks/create-prd.md

# With existing PRD
Load: ai-dev-tasks/generate-tasks.md
Reference: tasks/PRD-[date].md

# With task list
Load: ai-dev-tasks/process-task-list.md
Reference: tasks/tasks-[date].md
```

## 📈 SUCCESS METRICS

Track these for every session:
- **Files per task**: Must be 1 (1:1:1:1 rule)
- **Context size**: Must be <500 lines
- **Time per micro-task**: Should be 5-30 minutes
- **Parallel tasks**: 2-5 when possible
- **Test coverage**: Every micro-task tested

## 🎓 THE MICROGRINDING MANIFESTO

1. **One task, one focus** - Never mix concerns
2. **Small context wins** - <500 lines prevents drift
3. **Surgical precision** - One file, one change
4. **Parallel when possible** - Independent tasks simultaneously
5. **Validate immediately** - Test each micro-task
6. **Document as you go** - Auto-generate from completions

## 🚨 CRITICAL REMINDERS

- **NEVER** implement without breaking into micro-tasks first
- **NEVER** work on multiple files in one micro-task
- **NEVER** exceed 500 lines of context
- **NEVER** skip validation between micro-tasks
- **ALWAYS** use TodoWrite to track progress
- **ALWAYS** follow existing patterns in codebase
- **ALWAYS** test after each micro-task

## 📝 WHEN USER ASKS FOR HELP

If user asks "how do I use this?" or "what's the workflow?":

1. Explain the 3-phase process (PRD → Tasks → Microgrinding)
2. Show them the quick commands above
3. Emphasize the 1:1:1:1 pattern is mandatory
4. Point them to `ai-dev-tasks/QUICK_REFERENCE.md` for details

## 🔄 SESSION INITIALIZATION

At the start of each session:
1. Check for incomplete todos from previous session
2. Verify project structure matches expected
3. Confirm tech stack versions
4. Load this CLAUDE.md for reference

---

**Remember**: Every task follows 1:1:1:1 - NO EXCEPTIONS
**Mantra**: Make it small → Make it work → Make it right → Make it fast