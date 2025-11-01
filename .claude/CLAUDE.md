# CLAUDE.md - Project Configuration for Claude Code

This file configures Claude Code for the 1:1:1:1 microgrinding workflow.

## 🎯 PROJECT WORKFLOW: 1:1:1:1 MICROGRINDING

**EVERY task follows**: 1 Task → 1 Agent → 1 File → 1 Execution

## 🚀 QUICK START

When I request a feature, follow this workflow:

### 1. Create PRD (if needed)
```
Load: ai-dev-tasks/create-prd.md
Ask me 5-10 discovery questions to understand the real need
Save to: tasks/PRD-[date]-[feature].md
```

### 2. Generate Tasks
```
Load: ai-dev-tasks/generate-tasks.md
Reference the PRD, match patterns, score complexity
Save to: tasks/tasks-[date]-[feature].md
```

### 3. Implement with Microgrinding
```
Load: ai-dev-tasks/process-task-list.md
Break EVERY task into 2-10 micro-tasks
Execute with 1:1:1:1 pattern (one file at a time)
```

## 🤖 USE THESE NANO-AGENTS

Located in `.claude/agents/`:
- `micro-task-breaker` - Breaks tasks into 1:1:1:1 units
- `code-implementer` - Executes single micro-task
- `test-writer` - Creates focused tests
- `validator` - Validates implementation
- `orchestrator` - Coordinates workflow

Use with: `Task tool, subagent_type: "[agent-name]"`

## 📋 MICRO-TASK RULES

- **Simple (1-2)**: 2-3 micro-tasks
- **Moderate (3)**: 4-6 micro-tasks
- **Complex (4+)**: 6-10 micro-tasks
- **Context limit**: <500 lines per micro-task
- **File limit**: 1 file per micro-task

## ⚡ PARALLEL EXECUTION

Launch independent micro-tasks simultaneously:
```
Task 1: Schema creation (db file)
Task 2: UI component (component file)
Task 3: Test setup (test file)
[All in one message for parallel execution]
```

## 🔍 VALIDATION

Before completing ANY micro-task:
- [ ] Single file modified
- [ ] Context <500 lines
- [ ] Code compiles
- [ ] No `any` types
- [ ] Tests pass
- [ ] TodoWrite updated

## 📊 PROJECT TECH STACK

- **Frontend**: Next.js 15, TypeScript, React, shadcn/ui
- **Backend**: tRPC, PostgreSQL 18, Drizzle ORM
- **Auth**: Better Auth v1
- **Testing**: Vitest, Testing Library

## 🔗 REFERENCES (Load as Needed)

- `/references/patterns/crud-operations.md`
- `/references/patterns/form-handling.md`
- `/references/testing/test-templates.md`
- `/references/security/security-checklist.md`

## 💡 MY PREFERENCES

1. **ALWAYS** break tasks into micro-tasks first
2. **NEVER** work on multiple files at once
3. **ALWAYS** use TodoWrite for tracking
4. **PREFER** parallel execution when possible
5. **ALWAYS** validate after each micro-task

---

**Remember**: 1:1:1:1 pattern is MANDATORY - no exceptions!