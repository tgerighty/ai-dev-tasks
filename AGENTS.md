# UNIFIED AGENTS GUIDE - AI DEV TASKS WITH MICROGRINDING

**Version**: 3.0.0 - Unified Microgrinding + AI Dev Tasks
**Target**: All AI coding assistants (Claude Code, Factory.ai, Cursor, Windsurf)
**Token Count**: ~8K optimized
**Last Updated**: 2025-11-01

---

## 🎯 CORE PHILOSOPHY: 1:1:1:1 MICROGRINDING

**The Foundation**: Every task follows the 1:1:1:1 pattern
```
1 Task → 1 Agent/Droid → 1 File → 1 Execution
```

This is NON-NEGOTIABLE. All work must be broken into atomic, surgical micro-tasks.

---

## 🚫 ABSOLUTE REQUIREMENTS

| Category | Rule | Details |
|----------|------|---------|
| **Microgrinding** | 1:1:1:1 Pattern | 1 task, 1 agent, 1 file, 1 execution ALWAYS |
| **Reading** | Read thoroughly | Full files + all references before any changes |
| **Context** | <500 lines | Ideal <200 lines per micro-task |
| **Size** | Keep small | File ≤300 LOC, Function ≤50 LOC, Params ≤5 |
| **Security** | No secrets | Never commit/log secrets; validate all inputs |
| **Testing** | Test everything | New code = tests; bugs = regression tests first |
| **Types** | No `any` | Explicit types always; prefer strict TypeScript |
| **Organization** | Tests separate | ALL tests in `tests/`, `__tests__/`, or `test/` folders |
| **Validation** | Parameterized queries | Never concatenate SQL; use schemas (Zod/yup) |

---

## 📊 AI DEV TASKS WORKFLOW

### Phase 1: Discovery-Driven PRD Creation
```
User Intent → Assign Feature ID → Discovery Questions → Problem Understanding → Right-Sized PRD
```
- **FIRST: Assign next sequential ID** (0001, 0002, 0003...)
- Use `create-prd.md` guide
- Progressive questioning: 5 Whys, Day in Life, Magic Wand
- Output: Micro (<1 page), Standard (2-3), or Full (5+) PRD
- **File naming**: PRD-[ID]-[feature-name].md
- **Example**: PRD-0001-authentication.md, PRD-0002-payments.md

### Phase 2: Pattern-Based Task Generation
```
PRD-[ID] → Pattern Recognition → Task Generation → Complexity Scoring → Dependency Mapping
```
- Use `generate-tasks.md` guide with SAME ID
- Match patterns: CRUD, Forms, APIs, Reports, Auth (~70% match common patterns)
- AI complexity scoring with reasoning (1-5 scale)
- Time estimates with ranges
- **File naming**: tasks-[ID]-[feature-name].md (MUST match PRD ID)
- **Example**: PRD-0001-auth.md → tasks-0001-auth.md

### Phase 3: Universal Micro-Task Implementation
```
Task Selection → Micro-Task Breakdown → 1:1:1:1 Execution → Validation → Next
```
- Use `process-task-list.md` guide
- EVERY task broken into micro-tasks:
  - Complexity 1-2: 2-3 micro-tasks
  - Complexity 3: 4-6 micro-tasks
  - Complexity 4+: 6-10 micro-tasks

---

## 🔧 1:1:1:1 MICROGRINDING IMPLEMENTATION

### The Pattern Explained

```javascript
// CORRECT: 1:1:1:1 Pattern
const microTask = {
  task: "Add email validation",        // 1 specific task
  agent: "validator",                  // 1 focused agent
  file: "validators/email.ts",         // 1 target file
  execution: "single focused change"   // 1 atomic operation
};

// WRONG: Multiple concerns
const badTask = {
  task: "Add validation and UI and tests",  // Multiple tasks!
  agent: "general",                         // Unfocused agent!
  files: ["multiple", "files"],             // Multiple files!
  execution: "complex multi-step"           // Not atomic!
};
```

### Micro-Task Breakdown Examples

#### Simple Task (Complexity 1-2) → 2-3 Micro-tasks
```markdown
Task: "Add dark mode toggle"
├── MT 1.1: Add toggle component (settings.tsx) - 15 min
├── MT 1.2: Connect to theme context (theme.ts) - 10 min
└── MT 1.3: Add localStorage (storage.ts) - 10 min
```

#### Moderate Task (Complexity 3) → 4-6 Micro-tasks
```markdown
Task: "Implement form validation"
├── MT 1.1: Create validation schema (schemas/form.ts) - 15 min
├── MT 1.2: Add to form component (form.tsx) - 20 min
├── MT 1.3: Create error component (errors.tsx) - 15 min
├── MT 1.4: Add validation triggers (handlers.ts) - 15 min
├── MT 1.5: Style error states (form.css) - 10 min
└── MT 1.6: Add unit tests (form.test.ts) - 20 min
```

#### Complex Task (Complexity 4+) → 6-10 Micro-tasks
```markdown
Task: "Add authentication system"
├── MT 1.1: Create auth types (types/auth.ts) - 15 min
├── MT 1.2: Add auth context (contexts/auth.tsx) - 20 min
├── MT 1.3: Create login component (login.tsx) - 25 min
├── MT 1.4: Add auth API calls (api/auth.ts) - 20 min
├── MT 1.5: Create middleware (middleware/auth.ts) - 20 min
├── MT 1.6: Add protected routes (routes/protected.tsx) - 15 min
├── MT 1.7: Update app router (app.tsx) - 10 min
├── MT 1.8: Add auth utils (utils/auth.ts) - 15 min
├── MT 1.9: Create auth tests (auth.test.ts) - 25 min
└── MT 1.10: Update layout (layout.tsx) - 10 min
```

### Parallel Execution Strategy

**Launch multiple agents simultaneously for independent tasks:**

```javascript
// PARALLEL EXECUTION (40% faster)
await Promise.all([
  launchAgent('code-implementer', 'MT 1.1: Schema creation'),
  launchAgent('code-implementer', 'MT 1.2: UI component'),
  launchAgent('test-writer', 'MT 1.3: Test structure')
]);

// Then SEQUENTIAL for dependencies
await launchAgent('code-implementer', 'MT 2.1: Connect UI to API');
```

---

## 🤖 NANO-AGENTS FOR MICROGRINDING

### Claude Code Agents (.claude/agents/)
| Agent | Purpose | Tokens |
|-------|---------|--------|
| `prd-discovery` | Progressive PRD creation | ~300 |
| `task-generator` | Pattern-based task generation | ~400 |
| `micro-task-breaker` | Break tasks into 1:1:1:1 units | ~250 |
| `code-implementer` | Execute single micro-task | ~350 |
| `test-writer` | Create focused tests | ~300 |
| `validator` | Validate implementation | ~250 |
| `documenter` | Auto-generate docs | ~300 |
| `orchestrator` | Coordinate workflow | ~500 |

### Factory.ai Droids (.factory/droids/)
Equivalent droids with same 1:1:1:1 focus

### Using Nano-Agents
```bash
# Claude Code
Task tool with subagent_type: "micro-task-breaker"

# Cursor
@micro-task-breaker.md implement MT 1.1

# Direct
Load: .claude/agents/code-implementer.md
```

---

## 📋 QUICK REFERENCE

### Tech Stack
**Frontend**: Next.js 15, TypeScript, React, shadcn/ui, Tailwind
**Backend**: tRPC, PostgreSQL 18, Drizzle ORM, Valkey 8
**Auth**: Better Auth v1
**Test**: `npm test` | **Build**: `npm run build` | **Dev**: `npm run dev`

### Code Limits
| Item | Max | Ideal |
|------|-----|-------|
| File | 300 lines | <200 |
| Function | 50 lines | <30 |
| Params | 5 | ≤3 |
| Context | 500 lines | <200 |
| Micro-task | 30 min | 5-15 min |

### Project Structure
```
src/
├── app/           # Next.js app router
├── components/    # React components
├── server/
│   ├── api/      # tRPC routers
│   ├── db/       # Drizzle schema
│   └── auth/     # Better Auth
tests/            # ALL tests here
├── unit/
├── integration/
└── e2e/
```

---

## 🔍 VALIDATION CHECKLIST

Before marking any micro-task complete:

### Pre-Implementation
- [ ] Target file exists (or confirm creating)
- [ ] Dependencies installed
- [ ] Context <500 lines
- [ ] Single file focus (1:1:1:1)
- [ ] Pattern identified

### During Implementation
- [ ] No `any` types
- [ ] Function <50 lines
- [ ] Inputs validated
- [ ] No hardcoded secrets
- [ ] Following existing patterns

### Post-Implementation
- [ ] Code compiles
- [ ] Tests pass
- [ ] Security validated
- [ ] Documentation updated
- [ ] 1:1:1:1 pattern maintained

---

## 🔗 LAZY-LOADING REFERENCES

Load only what you need for the specific micro-task:

### Pattern Libraries (~1-2K tokens each)
- `/references/patterns/crud-operations.md` - Complete CRUD
- `/references/patterns/form-handling.md` - Forms + validation
- `/references/patterns/parallel-processing.md` - Parallel execution
- `/references/security/security-checklist.md` - Security validation
- `/references/testing/test-templates.md` - Test generation
- `/references/checklists/validation-checklist.md` - Quality gates

---

## 📊 MICROGRINDING METRICS

### Success Indicators
- **Context per task**: <500 lines (✓ = success)
- **Files per task**: 1 file (✓ = perfect)
- **Time per task**: 5-30 minutes (✓ = optimal)
- **Parallel tasks**: 2-5 concurrent (✓ = efficient)
- **Test coverage**: Per micro-task (✓ = quality)

### Quality Score Formula
```
Score = (Single_File × 25) + (Small_Context × 25) +
        (Tests_Pass × 25) + (Pattern_Followed × 25)
```

---

## 🚀 EXECUTION COMMANDS

### Start Workflow (with ID System)
```bash
# 1. Assign ID and Create PRD
Next ID: 0003 (if 0001, 0002 exist)
@create-prd.md
Output: PRD-0003-notifications.md

# 2. Generate Tasks (SAME ID)
@generate-tasks.md @PRD-0003-notifications.md
Output: tasks-0003-notifications.md

# 3. Process with Microgrinding (SAME ID)
@process-task-list.md @tasks-0003-notifications.md
Creates: Micro-tasks all tagged with 0003

# Optional: Design Decisions (SAME ID)
If complex: context-0003-notifications.md
```

### Track Progress
```markdown
Task 1.0: Add user profile [→] In Progress
├── MT 1.1: Schema [x] Complete
├── MT 1.2: API [→] In Progress
├── MT 1.3: UI [ ] Pending
└── MT 1.4: Tests [ ] Pending
```

---

## 🎓 CORE PRINCIPLES

### The Microgrinding Manifesto
1. **One task, one focus** - Never mix concerns
2. **Small context wins** - <500 lines prevents drift
3. **Surgical precision** - One file, one change
4. **Parallel when possible** - Independent tasks simultaneously
5. **Validate immediately** - Test each micro-task
6. **Document as you go** - Auto-generate from completions

### Why 1:1:1:1 Works
- **AI performs better** with constrained scope
- **Fewer errors** with focused context
- **Easier validation** of small changes
- **Better parallelization** of independent work
- **Clear progress tracking** with atomic tasks

---

## 📁 PRD & TASK MANAGEMENT - FOUR-DIGIT ID SYSTEM

### PRIMARY RULE: One ID Links Everything
**EVERY feature gets a unique four-digit ID that links ALL related files:**

```
Feature ID: 0001
├── PRD-0001-authentication.md         # Product requirements
├── tasks-0001-authentication.md       # Task breakdown
├── context-0001-authentication.md     # Design decisions (if needed)
└── changelog-0001-authentication.md   # Completion tracking
```

### ID Assignment Rules
- **ALL Features**: Sequential four-digit numbering (0001, 0002, 0003...)
- **Bug Fixes**: Link to feature ID + fix number
  - PRD-0001-FIX-01-login-timeout.md (Fix for feature 0001)
  - PRD-0002-FIX-01-payment-retry.md (Fix for feature 0002)
- **Enhancements**: Use base feature ID + enhancement
  - PRD-0001-ENH-01-sso-support.md (Enhancement to auth feature)

### Why This Matters
- **Traceability**: Can find all related files with one ID
- **Consistency**: PRD decisions flow to tasks to implementation
- **Organization**: Easy to see what belongs together
- **History**: Clear evolution of each feature

### Directory Structure
```
tasks/
├── 0001-authentication/       # All 0001 files together
│   ├── PRD-0001-authentication.md
│   ├── tasks-0001-authentication.md
│   └── context-0001-authentication.md
├── 0002-payment-system/       # All 0002 files together
│   ├── PRD-0002-payment-system.md
│   ├── tasks-0002-payment-system.md
│   └── context-0002-payment-system.md
└── archive/                   # Completed features
```

---

## 📝 CHANGELOG FORMAT

Track micro-task completions:
```markdown
## [Unreleased]
### Added
- MT 1.1: User schema (15 min actual vs 20 min est)
- MT 1.2: Profile API endpoint (18 min actual vs 20 min est)
### Fixed
- MT 2.1: Email validation (10 min actual vs 15 min est)
```

---

## 🔥 REMEMBER

**Every task MUST follow 1:1:1:1 pattern - NO EXCEPTIONS**

This is how we achieve:
- 40% faster development through parallelization
- 60% fewer errors through focused context
- 75% token reduction through nano-agents
- 90% pattern reuse through microgrinding

**The mantra**: Make it small → Make it work → Make it right → Make it fast

---

*For legacy patterns and verbose examples, see `/archive/`*
*For quick reference without examples, use `Nano-AGENTS.md` (2K tokens)*