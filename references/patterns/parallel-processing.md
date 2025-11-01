# Parallel Processing for Micro-Tasks

## Overview
Execute independent micro-tasks simultaneously to reduce total implementation time by 40-60%.

## Identifying Parallel Tasks

### Independent Tasks (Can Run in Parallel)
- **Different files**: Tasks touching separate files
- **Different layers**: UI, API, and database tasks
- **Different features**: Unrelated functionality
- **Read-only operations**: Multiple reads/searches
- **Test creation**: Tests for different components

### Sequential Tasks (Must Run in Order)
- **Same file modifications**: Multiple edits to one file
- **Dependencies**: Task B needs output from Task A
- **Database migrations**: Schema changes before queries
- **API before UI**: Endpoint needed for component
- **Build dependencies**: Compile before test

## Parallel Execution Patterns

### Pattern 1: Layer Parallelization
```
PARALLEL:
├── MT 1.1: Create database schema (db layer)
├── MT 1.2: Create UI component shell (ui layer)
└── MT 1.3: Set up test structure (test layer)

THEN SEQUENTIAL:
├── MT 2.1: Create API endpoint (needs schema)
├── MT 2.2: Connect UI to API (needs endpoint)
└── MT 2.3: Write integration tests (needs both)
```

### Pattern 2: Feature Parallelization
```
PARALLEL:
├── Feature A:
│   ├── MT 1.1: User profile schema
│   └── MT 1.2: Profile API endpoint
└── Feature B:
    ├── MT 2.1: Settings schema
    └── MT 2.2: Settings API endpoint
```

### Pattern 3: CRUD Parallelization
```
PARALLEL (different operations):
├── MT 1.1: Create operation
├── MT 1.2: Read operations (list + get)
├── MT 1.3: Update operation
└── MT 1.4: Delete operation
```

## Implementation with AI Tools

### Claude Code (using Task tool)
```
// Launch multiple agents in parallel
Task 1: Implement database schema (subagent: code-implementer)
Task 2: Create UI components (subagent: code-implementer)
Task 3: Set up test files (subagent: test-writer)
[All launched in same message]
```

### Cursor (using multiple composers)
```
Composer 1: @micro-executor implement MT 1.1 database schema
Composer 2: @micro-executor implement MT 1.2 UI component
Composer 3: @test-creator write MT 1.3 test structure
```

### Manual Coordination
```markdown
## Parallel Batch 1 (Start all simultaneously)
- [ ] MT 1.1: Database schema (15 min)
- [ ] MT 1.2: UI component shell (10 min)
- [ ] MT 1.3: Test structure (10 min)

## Sequential Batch 2 (After Batch 1 completes)
- [ ] MT 2.1: API endpoint (20 min)
- [ ] MT 2.2: Connect UI to API (15 min)
- [ ] MT 2.3: Integration tests (20 min)
```

## Micro-Task Dependencies

### Dependency Matrix Example
```
Task        | Depends On      | Can Parallelize With
------------|----------------|----------------------
Schema      | None           | UI shell, test setup
API Create  | Schema         | API Read, API Update
API Read    | Schema         | API Create, API Update
UI List     | API Read       | UI Create, UI Edit
UI Create   | API Create     | UI List, UI Edit
Tests       | All API + UI   | Documentation
```

### Dependency Notation
```markdown
MT 1.1: Create user schema
  Dependencies: None
  Parallel with: 1.2, 1.3

MT 1.2: Create user UI component
  Dependencies: None
  Parallel with: 1.1, 1.3

MT 1.3: Set up user tests
  Dependencies: None
  Parallel with: 1.1, 1.2

MT 2.1: Create user API
  Dependencies: 1.1 (schema)
  Parallel with: 2.2

MT 2.2: Create settings API
  Dependencies: 1.1 (schema)
  Parallel with: 2.1

MT 3.1: Connect UI to API
  Dependencies: 1.2 (UI), 2.1 (API)
  Parallel with: None
```

## Queue Management

### Priority Queue
```typescript
interface MicroTask {
  id: string;
  priority: number; // 1 (highest) to 5 (lowest)
  dependencies: string[];
  estimatedTime: number;
  status: 'pending' | 'in_progress' | 'completed' | 'blocked';
}

// High priority: Core functionality, blocking tasks
// Medium priority: Features, enhancements
// Low priority: Nice-to-have, documentation
```

### Batch Processing
```typescript
// Group similar tasks for efficiency
const batches = {
  database: ['MT 1.1', 'MT 1.2', 'MT 1.3'], // All schema changes
  api: ['MT 2.1', 'MT 2.2', 'MT 2.3'],      // All endpoints
  ui: ['MT 3.1', 'MT 3.2', 'MT 3.3'],       // All components
  tests: ['MT 4.1', 'MT 4.2', 'MT 4.3'],    // All tests
};
```

## Progress Tracking

### Visual Progress Indicator
```
[████████░░░░░░░░░░░░] 40% (4/10 tasks)

Completed:
✓ MT 1.1: Schema (10 min)
✓ MT 1.2: UI shell (8 min)

In Progress (Parallel):
→ MT 1.3: API Create (5/15 min)
→ MT 1.4: API Read (3/10 min)

Queued:
○ MT 2.1: Connect UI
○ MT 2.2: Tests
```

### Time Savings Calculation
```
Sequential Time: Sum of all task times
Parallel Time: Max time in each parallel group + sequential tasks

Example:
Sequential: 120 minutes total
Parallel: 45 min (batch 1) + 30 min (batch 2) = 75 minutes
Savings: 45 minutes (37.5%)
```

## Best Practices

### 1. Always Verify Independence
Before parallel execution, confirm:
- No shared file modifications
- No data dependencies
- No execution order requirements

### 2. Group by Similarity
- Database tasks together (same context)
- UI tasks together (same patterns)
- Test tasks together (same framework)

### 3. Monitor for Conflicts
Watch for:
- Git merge conflicts
- Import/export mismatches
- Type definition conflicts
- Test interference

### 4. Fallback to Sequential
If parallel execution causes issues:
1. Complete current parallel tasks
2. Switch to sequential for remaining
3. Document the conflict for future

## Example: Full CRUD Parallel Plan

```markdown
## Phase 1: Foundation (Parallel - 20 min)
PARALLEL:
- MT 1.1: Create database schema (15 min)
- MT 1.2: Create TypeScript types (10 min)
- MT 1.3: Set up test fixtures (10 min)
- MT 1.4: Create UI layout (15 min)
Estimated: 20 min (longest task)

## Phase 2: API Layer (Parallel - 25 min)
PARALLEL:
- MT 2.1: Create endpoint (20 min)
- MT 2.2: Read endpoints (15 min)
- MT 2.3: Update endpoint (20 min)
- MT 2.4: Delete endpoint (15 min)
Estimated: 25 min (with 2 developers/agents)

## Phase 3: UI Components (Parallel - 20 min)
PARALLEL:
- MT 3.1: List component (20 min)
- MT 3.2: Create form (20 min)
- MT 3.3: Edit form (15 min)
- MT 3.4: Delete confirmation (10 min)
Estimated: 20 min (with 2 developers/agents)

## Phase 4: Integration (Sequential - 30 min)
SEQUENTIAL:
- MT 4.1: Connect UI to API (15 min)
- MT 4.2: Add error handling (10 min)
- MT 4.3: Write integration tests (15 min)
Estimated: 40 min

Total Time: 105 min parallel vs 175 min sequential (40% savings)
```