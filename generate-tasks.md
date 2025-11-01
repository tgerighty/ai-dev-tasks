# Generating Tasks from PRD - Pattern-Based Approach

**Version:** 2.0
**Last Updated:** 2025-10-31
**Previous Version:** Archived in `/archive/generate-tasks-v1.0-20251031.md`

## Goal
Guide AI assistants in generating appropriately-sized, actionable task lists from PRDs using pattern recognition, smart complexity scoring, and practical testing guidance.

## Core Philosophy
- **Right-sized output** - Match task list complexity to PRD complexity
- **Pattern recognition** - Apply templates for common development patterns
- **AI-driven scoring** - Let AI analyze and estimate complexity
- **Inherited risk** - Don't repeat risk assessment from PRD phase
- **Practical testing** - Focus on what to test, not coverage percentages

## The Task Generation Process

### Step 1: Analyze PRD Type

First, determine what type of PRD you're working with:

```
Micro PRD (1 page) → Generate Micro Task List
Standard PRD (2-3 pages) → Generate Standard Task List
Full PRD (5+ pages) → Generate Full Task List
```

### Step 2: Pattern Recognition

Before creating custom tasks, check if this matches common patterns:

#### CRUD Operations Pattern
If the PRD involves Create/Read/Update/Delete operations:
```
Standard Tasks:
1. Data model/schema
2. API endpoints (CREATE, GET, UPDATE, DELETE)
3. Input validation
4. Business logic
5. UI components
6. Error handling
7. Tests
```

#### Form Handling Pattern
If the PRD involves forms and user input:
```
Standard Tasks:
1. Form UI component
2. Field validation rules
3. Submit handler
4. Success/error feedback
5. Data persistence
6. Tests
```

#### API Integration Pattern
If the PRD involves external API integration:
```
Standard Tasks:
1. API client setup
2. Authentication/authorization
3. Request/response handling
4. Error handling and retries
5. Rate limiting
6. Caching strategy
7. Tests
```

#### Report/Analytics Pattern
If the PRD involves data visualization or reporting:
```
Standard Tasks:
1. Data query/aggregation
2. Data transformation
3. Visualization components
4. Export functionality
5. Performance optimization
6. Tests
```

#### Authentication Pattern
If the PRD involves user authentication:
```
Standard Tasks:
1. Auth flow design
2. Credential validation
3. Session management
4. Security measures
5. Password reset flow
6. Tests
```

### Step 3: AI-Driven Complexity Analysis

For each major task, let AI analyze and suggest complexity:

```
"Analyzing task complexity...

Task: Implement user profile update
Estimated Complexity: 3
Reasoning:
- Touches 4 files (component, API, database, tests)
- Requires validation logic
- Needs error handling
- Has image upload (moderate complexity)
- Similar to previous profile features (high confidence)

This can be completed as a single task."
```

#### Complexity Factors to Consider:
- **File Count:** How many files need modification?
- **Dependencies:** External services or internal systems involved?
- **Data Changes:** Database schema or data transformation needed?
- **UI Complexity:** Simple form or complex interaction?
- **Business Logic:** Straightforward or complex rules?
- **Integration Points:** How many systems need to connect?

#### Complexity Scale:
- **1-2:** Single file, straightforward logic (30 min - 2 hours)
- **3:** Multiple files, moderate logic (2-4 hours)
- **4:** Many files, complex logic (4-8 hours)
- **5+:** Needs breakdown into subtasks

### Step 4: Risk Inheritance from PRD

Don't re-assess risk. Simply inherit from the PRD:

```
PRD Risk Level: High (authentication feature)
↓
Task List Testing Approach: Comprehensive
- Test all success paths
- Test all error paths
- Test edge cases
- Security testing
- Performance testing
```

#### Risk to Testing Mapping:
- **High Risk** → Comprehensive testing (all paths, security, performance)
- **Medium Risk** → Standard testing (happy path + main errors)
- **Low Risk** → Basic testing (happy path works)

### Step 5: Generate Right-Sized Task List

Based on PRD type, generate appropriate documentation:

#### Micro Task List (For Micro PRDs)
```markdown
# Tasks: [Feature Name]

## Quick Summary
[1-2 sentences of what needs to be built]

## Tasks (Est. [X-Y] hours)
- [ ] 1. [Main task] - Complexity: [1-4] - [1-2 hours]
  - [ ] 1.1 [Subtask if needed]
  - [ ] 1.2 [Subtask if needed]
- [ ] 2. [Second task] - Complexity: [1-4] - [1-2 hours]
- [ ] 3. Add tests - [30 min - 1 hour]

## Dependencies
[Any blocking dependencies or parallel execution notes]

## Testing Focus
[Based on risk: Basic/Standard/Comprehensive]
- [Specific things to test]
```

#### Standard Task List (For Standard PRDs)
```markdown
# Task List: [Feature Name]

## Overview
Generated from: [PRD reference]
Estimated effort: [X-Y hours/days]
Risk level: [Inherited from PRD]

## User Stories Breakdown
- **US-001:** [User story] → Tasks: 1.0, 2.0
- **US-002:** [User story] → Tasks: 3.0

## Implementation Tasks

### Phase 1: Foundation
- [ ] 1.0 [Task name] - **Complexity:** [score] - **Est:** [time]
  - What: [Brief description]
  - Why: [Why this is needed]
  - Dependencies: [What must be done first]
  - [ ] 1.1 [Subtask if complexity > 4]
  - [ ] 1.2 [Subtask if complexity > 4]

### Phase 2: Core Features
- [ ] 2.0 [Task name] - **Complexity:** [score] - **Est:** [time]
  - What: [Brief description]
  - Can run parallel with: [Task numbers]

### Phase 3: Polish & Testing
- [ ] 3.0 Complete testing - **Est:** [time]
  - [ ] Unit tests
  - [ ] Integration tests
  - [ ] [Additional based on risk]

## Execution Strategy
```
Start: Task 1.0
Parallel: Tasks 2.0 and 2.1 (can run simultaneously)
Sequential: Task 3.0 requires 1.0 and 2.0 complete
Total estimated time: [X-Y hours/days]
```

## Testing Requirements
Based on [Risk Level] risk:
- [Specific testing requirements]
- [What scenarios must be tested]
- [Any performance requirements]
```

#### Full Task List (For Complex PRDs)
[Includes all sections from Standard plus:]
```markdown
## Complexity Analysis Details
[Detailed breakdown of why each task received its complexity score]

## Risk Considerations
[Any specific risks identified during task analysis]

## Architecture Decisions Needed
[Decisions that need to be made during implementation]

## Detailed Task Breakdown
[More granular subtasks with individual complexity scores]

## Integration Points
[Detailed mapping of how tasks integrate with existing systems]

## Rollback Plan
[How to rollback if deployment issues occur]
```

### Step 6: Smart Dependency Detection

AI identifies and documents task dependencies:

```
## Task Dependencies

Direct Dependencies:
- Task 2.0 requires Task 1.0 (needs data model)
- Task 3.0 requires Task 2.0 (needs API endpoints)

Parallel Execution Opportunities:
- Tasks 2.1 and 2.2 can run in parallel
- UI tasks (4.x) can start after Task 1.0

Critical Path:
1.0 → 2.0 → 3.0 → 5.0 (minimum 8 hours sequential)
```

### Step 7: Time Estimation

Provide realistic time ranges based on complexity:

```
## Time Estimates

Individual Tasks:
- Simple (Complexity 1-2): 30 min - 2 hours
- Moderate (Complexity 3): 2-4 hours
- Complex (Complexity 4): 4-8 hours
- Very Complex (5+): Break down required

Total Estimate:
- Optimistic: [sum of low estimates]
- Realistic: [sum of average estimates]
- Pessimistic: [sum of high estimates]

Confidence: [High/Medium/Low] based on:
- Similar features completed previously
- Team familiarity with tech stack
- External dependency risks
```

## Pattern Templates

### Quick Templates for Common Tasks

#### Basic CRUD Task Set
```markdown
- [ ] 1.0 Create data model - Complexity: 2 - Est: 1-2 hours
- [ ] 2.0 Implement API endpoints - Complexity: 3 - Est: 2-4 hours
  - [ ] 2.1 CREATE endpoint with validation
  - [ ] 2.2 READ endpoints (list and detail)
  - [ ] 2.3 UPDATE endpoint with validation
  - [ ] 2.4 DELETE endpoint with cascade handling
- [ ] 3.0 Create UI components - Complexity: 3 - Est: 2-4 hours
- [ ] 4.0 Add error handling - Complexity: 2 - Est: 1-2 hours
- [ ] 5.0 Write tests - Complexity: 2 - Est: 1-2 hours
```

#### Form Handling Task Set
```markdown
- [ ] 1.0 Design form schema - Complexity: 1 - Est: 30 min
- [ ] 2.0 Build form component - Complexity: 2 - Est: 1-2 hours
- [ ] 3.0 Implement validation - Complexity: 2 - Est: 1-2 hours
- [ ] 4.0 Handle submission - Complexity: 2 - Est: 1-2 hours
- [ ] 5.0 Add user feedback - Complexity: 1 - Est: 30 min
- [ ] 6.0 Test form flows - Complexity: 2 - Est: 1-2 hours
```

#### API Integration Task Set
```markdown
- [ ] 1.0 Set up API client - Complexity: 2 - Est: 1-2 hours
- [ ] 2.0 Implement auth flow - Complexity: 3 - Est: 2-4 hours
- [ ] 3.0 Create service wrapper - Complexity: 2 - Est: 1-2 hours
- [ ] 4.0 Add retry logic - Complexity: 2 - Est: 1-2 hours
- [ ] 5.0 Implement caching - Complexity: 3 - Est: 2-4 hours
- [ ] 6.0 Error handling - Complexity: 2 - Est: 1-2 hours
- [ ] 7.0 Write integration tests - Complexity: 3 - Est: 2-4 hours
```

## AI Complexity Analysis Examples

### Example 1: Simple UI Change
```
Task: "Add dark mode toggle to settings"
AI Analysis:
- Complexity: 2
- Files affected: ~3 (settings component, theme context, storage)
- Dependencies: None external
- Pattern match: Settings toggle pattern
- Confidence: High
- Estimated time: 1-2 hours
```

### Example 2: API Endpoint
```
Task: "Create endpoint to export user data"
AI Analysis:
- Complexity: 3
- Files affected: ~5 (controller, service, auth, formatter, tests)
- Dependencies: Auth system, database
- Pattern match: Data export pattern
- Considerations: Large data handling, format options
- Confidence: High
- Estimated time: 2-4 hours
```

### Example 3: Complex Integration
```
Task: "Integrate with payment provider"
AI Analysis:
- Complexity: 5+ (needs breakdown)
- Files affected: 10+
- Dependencies: External API, webhooks, database
- Pattern match: Payment integration pattern
- Risk: High (financial data)
- Suggested breakdown:
  - Payment provider setup (complexity: 2)
  - Payment flow implementation (complexity: 4)
  - Webhook handling (complexity: 3)
  - Error recovery (complexity: 3)
  - Testing suite (complexity: 3)
- Confidence: Medium (external dependency)
- Estimated time: 2-3 days total
```

## Practical Testing Guidance

### Instead of Coverage Percentages

#### High Risk Testing
```
What to test:
✓ All happy paths work correctly
✓ All error paths handle gracefully
✓ Edge cases (empty data, max limits, special characters)
✓ Security scenarios (injection, auth bypass attempts)
✓ Performance under load
✓ Rollback procedures work

How to verify:
- Manual testing checklist completed
- Automated tests for critical paths
- Security scan results clean
- Performance benchmarks met
```

#### Medium Risk Testing
```
What to test:
✓ Main happy path works
✓ Common error cases handled
✓ Basic validation works
✓ Integration points verified

How to verify:
- Key user journeys tested
- Error handling demonstrated
- Basic automated tests pass
```

#### Low Risk Testing
```
What to test:
✓ Feature works as intended
✓ Doesn't break existing functionality

How to verify:
- Quick manual test
- One automated test proving it works
```

## Quality Checklist for Task Generation

Before finalizing the task list:

### Analysis Quality
- [ ] PRD type identified (Micro/Standard/Full)
- [ ] Pattern matching attempted
- [ ] Complexity estimated with reasoning
- [ ] Risk inherited from PRD (not re-assessed)
- [ ] Dependencies identified

### Task Quality
- [ ] Tasks are concrete and actionable
- [ ] Complex tasks (5+) are broken down
- [ ] Time estimates provided as ranges
- [ ] Parallel execution opportunities noted
- [ ] Testing approach is practical

### Documentation Quality
- [ ] Right-sized for PRD type
- [ ] Clear execution strategy
- [ ] Dependencies mapped
- [ ] Testing focused on "what" not "%"

## Common Patterns to Recognize

### UI Patterns
- **List/Table View:** Fetch, display, sort, filter, paginate
- **Detail View:** Fetch, display, edit, delete
- **Form:** Input, validate, submit, feedback
- **Dashboard:** Aggregate, visualize, refresh
- **Settings:** Load, modify, persist, apply

### Backend Patterns
- **CRUD API:** Create, read, update, delete with validation
- **Search/Filter:** Query building, pagination, sorting
- **File Upload:** Receive, validate, store, serve
- **Notification:** Trigger, format, send, track
- **Batch Process:** Queue, process, report

### Integration Patterns
- **Webhook:** Receive, validate, process, respond
- **API Client:** Auth, request, retry, cache
- **Data Sync:** Fetch, transform, merge, persist
- **Event Stream:** Subscribe, process, acknowledge

## Tips for AI Task Generation

1. **Start with pattern matching** - Don't recreate common patterns
2. **Show your reasoning** - Explain complexity scores
3. **Be realistic with time** - Ranges are better than false precision
4. **Identify quick wins** - Note tasks that can be done in parallel
5. **Flag decisions needed** - Don't guess at architectural choices
6. **Keep it actionable** - Each task should be clearly doable
7. **Consider the developer** - What would actually help someone implement this?

## Integration with Workflow

This task generation feeds into:
1. **Implementation** (`process-task-list.md`) - Developer executes tasks
2. **Testing** - Based on inherited risk level
3. **Progress Tracking** - Tasks checked off as completed

## File Naming Convention

Save task lists using format matching PRDs:
- Simple: `tasks-[YYYY-MM-DD]-[feature-name].md`
- Complex: `tasks-[number]-[feature-name].md`
- From PRD: `tasks-[matching-PRD-identifier].md`

## Version History

- **v2.0 (2025-10-31):** Pattern-based approach with AI complexity scoring
- **v1.0 (Original):** Manual complexity scoring with extensive risk assessment