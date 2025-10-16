# Rule: Generating a Task List from a PRD with User Stories, Risk Assessment, and Complexity Analysis

## Goal

To guide an AI assistant in creating a **single** comprehensive task list in Markdown format based on an existing Product Requirements Document (PRD). The task list includes user stories, risk-based prioritization, high-level tasks, subtasks, complexity ratings, and testing requirements with automatic breakdown for complex items.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `tasks-[prd-file-name].md` (e.g., `tasks-0001-prd-user-profile-editing.md`)
- **Important:** This creates ONE task list file that contains everything (PRD content, user stories, risk assessment, tasks, complexity, and testing requirements)

## Process

1. **Receive PRD Reference:** The user points the AI to a specific PRD file
2. **Analyze PRD:** Read and analyze functional requirements, user stories, risk assessment, and technical requirements
3. **Map User Stories to High-Level Tasks:** For each user story, create a corresponding high-level task
4. **Apply Risk Assessment:** Use the risk assessment from the PRD to prioritize tasks and determine testing requirements
5. **Generate Subtasks:** Break down each high-level task into specific implementation subtasks
6. **Assess Complexity:** Rate each subtask using the complexity rubric (1-10 scale)
7. **Break Down Complex Tasks:** Automatically break down any subtask with complexity > 4 into smaller subtasks (≤ 4)
8. **Assign Testing Requirements:** Based on risk level, assign appropriate testing requirements to each task
9. **Generate Final Output:** Create one comprehensive file with all content organized by risk priority

## Complexity Rubric (1-10 overall; leaf ≤4)

**Purpose:**
- Provide consistent scoring for task sizing
- Enable automatic decomposition for items scored >4 into leaf tasks ≤4

**Scoring Dimensions:**
- **Implementation difficulty:** algorithmic complexity, edge cases, data model impact
- **Time required:** estimated effort in hours/days for a typical contributor
- **Dependencies/integration:** external services, cross-module coupling, sequencing
- **Uncertainty/novelty:** unfamiliar tech, unclear requirements, experimentation needed

**Scale Definitions:**

**1: Trivial change**
- Examples: typo, copy change, toggle config flag, add constant
- Scope: single line/file, negligible risk

**2: Small, localized change**
- Examples: new small util, simple form validation, basic UI element, simple API endpoint
- Scope: single file or couple files, low risk

**3: Medium change**
- Examples: modify data flow across component + service, non-trivial validation, integrate library
- Scope: multiple files/modules, moderate risk, requires tests

**4: Large but bounded change**
- Examples: new self-contained component/service, external API integration with retries
- Scope: multiple modules, notable risk, tests + docs updates required

**5-10: Epic/high-level items (must decompose)**
- Examples: "Implement SSO", "Build PRD engine", "Create DMS with versioning"
- Action: Break down until all leaf tasks are ≤4

**Time Required Estimates:**
- **1:** 1-2 hours (same day)
- **2:** 2-4 hours (same day)
- **3:** 4-6 hours (1-2 days)
- **4:** 6-8 hours (1-2 days)
- **5:** 8-12 hours (2-3 days)
- **6:** 12-16 hours (2-3 days)
- **7:** 16-24 hours (3-4 days)
- **8:** 24-32 hours (4-5 days)
- **9:** 32-40 hours (1 week)
- **10:** 40+ hours (1+ weeks)

## Automated Breakdown Rules

- **Assign 1-10 at ideation; decompose anything >4 into smaller subtasks**
- **Only leaf tasks carry complexity; parents are containers (no scores)**
- **Use the same rubric across frontend, backend, data, and ops tasks**
- **Re-evaluate scores after decomposition; adjust if scope changes**

### Decomposition Triggers
- Any single step needs >1 integration or cross-cutting change
- Touches >3 modules/files in separate areas
- Requires both UI and backend changes together

## Risk-Based Task Prioritization

Tasks must be prioritized based on the risk assessment from the PRD. This ensures high-risk items receive appropriate attention, resources, and testing.

### Risk-Based Priority Matrix

| Risk Score | Risk Level | Priority | Testing Required | Evidence Required | Review Process | Timeline Impact |
|------------|------------|----------|------------------|---------------------|----------------|
| 4.5-5.0 | Critical | P0 - Immediate | Unit + Integration + E2E + Security + Performance + Accessibility | All test reports + security audit + performance metrics | Security + Performance + Code Review | +50% |
| 3.6-4.4 | High | P1 - High | Unit + Integration + E2E + Performance | All test reports + performance metrics | Code + Architectural Review | +30% |
| 2.1-3.5 | Medium | P2 - Medium | Unit + Integration | Unit and integration test reports | Code Review | +15% |
| 0.0-2.0 | Low | P3 - Low | Unit Tests Only | Unit test reports | Basic Validation | Standard |

### Risk Assessment Integration

1. **Extract Risk Assessment**: Read risk assessment from the PRD
2. **Apply Risk Levels**: Assign risk levels based on functional area
3. **Prioritize by Risk**: Organize tasks by risk level (Critical → High → Medium → Low)
4. **Assign Testing**: Include specific testing requirements based on risk level
5. **Determine Evidence**: Specify evidence collection requirements

### Task Template with Risk Assessment

```markdown
## [PRIORITY] - [TASK TITLE]
**Risk Level:** [Critical/High/Medium/Low] (Risk Score: X.X/5.0)
**User Story:** As a [user type], I want to [action] so that [benefit]
**Complexity:** [1-10]

### Subtasks

#### [Subtask 1] - [Complexity: X]
- **Risk Level:** [Based on parent]
- **Testing Requirements:** [Based on risk level]
- **Evidence Required:** [Based on risk level]
- **Estimated Hours:** [Based on complexity]
- **Acceptance Criteria:** [Risk-specific criteria]

#### [Subtask 2] - [Complexity: X]
- **Risk Level:** [Based on parent]
- **Testing Requirements:** [Based on risk level]
- **Evidence Required:** [Based on risk level]
- **Estimated Hours:** [Based on complexity]
- **Acceptance Criteria:** [Risk-specific criteria]

### Risk Mitigation Strategies
- **Risk:** [Description]
- **Mitigation:** [Approach]
- **Contingency:** [Backup plan]
- **Monitoring:** [How to monitor]
```

### Risk-Based Testing Matrix

#### Critical Risk (4.5-5.0)
- **Testing:** Unit + Integration + E2E + Security + Performance + Accessibility (95%+ coverage)
- **Evidence:** All test reports + security audit + performance benchmarks
- **Reviews:** Security + Performance + Code + Architectural reviews
- **Timeline:** +50% buffer

#### High Risk (3.6-4.4)
- **Testing:** Unit + Integration + E2E + Performance (90%+ coverage)
- **Evidence:** All test reports + performance benchmarks
- **Reviews:** Performance + Code + Architectural reviews
- **Timeline:** +30% buffer

#### Medium Risk (2.1-3.5)
- **Testing:** Unit + Integration (80%+ coverage)
- **Evidence:** Unit + Integration test reports
- **Reviews:** Code review
- **Timeline:** +15% buffer

#### Low Risk (0.0-2.0)
- **Testing:** Unit Tests (70%+ coverage)
- **Evidence:** Unit test reports
- **Reviews:** Basic validation
- **Timeline:** Standard

### Risk-Based Progress Tracking

Track progress by risk level with specific metrics:

```markdown
### Progress Tracking by Risk Level

#### Critical Risk Tasks
- **Status:** [Not Started/In Progress/Testing/Review/Completed]
- **Testing Progress:** [0-100%] - All test types required
- **Evidence Collected:** [List of evidence]
- **Reviews Completed:** [List of reviews]
- **Risk Indicators:** [Monitoring status]

#### High Risk Tasks  
- **Status:** [Not Started/In Progress/Testing/Review/Completed]
- **Testing Progress:** [0-100%] - Required test types required
- **Evidence Collected:** [List of evidence]
- **Reviews Completed:** [List of reviews]

#### Medium Risk Tasks
- **Status:** [Not Started/In Progress/Testing/Completed]
- **Testing Progress:** [0-100%] - Unit and integration tests
- **Evidence Collected:** [Test reports]

#### Low Risk Tasks
- **Status:** [Not Started/In Progress/Completed]
- **Testing Progress:** [0-100%] - Unit tests only
```
- Unclear acceptance criteria or high uncertainty

### Breakdown Rules
- **Any task with complexity > 4 must be broken down**
- **Break down into 2-4 smaller subtasks with complexity ≤ 4**
- **Each breakdown subtask should be logically distinct and actionable**
- **Maintain the parent task as a summary/overview task**
- **Size Appropriately:** Each subtask should be completable in 1-3 days

## Quick Assessment Matrix

**Score 1-2 (Trivial/Simple):**
- Single file change
- No external dependencies
- Well-established patterns
- Minimal testing needed

**Score 3-4 (Medium):**
- Multiple files in same module
- Simple API integration
- Follows existing patterns
- Unit + some integration tests

**Score 5-6 (Complex → Breakdown Required):**
- Cross-module changes
- New API endpoints or database changes
- Requires research
- Comprehensive testing needed

**Score 7-8 (Very Complex → Breakdown Required):**
- Major architectural changes
- Performance/security implementation
- New technologies required
- Full testing suite

**Score 9-10 (Epic → Breakdown Required):**
- System-wide changes
- Multiple external systems
- High-risk security/compliance
- Extensive testing and monitoring

## Output Format

The generated task list **must** follow this structure:

```markdown
# Task List: [Feature Name]

## Relevant Files

- `path/to/potential/file1.ts` - Brief description of relevance
- `path/to/file1.test.ts` - Unit tests for file1.ts
- `path/to/another/file.tsx` - Brief description
- `path/to/another/file.test.tsx` - Unit tests
- `lib/utils/helpers.ts` - Utility functions needed
- `lib/utils/helpers.test.ts` - Unit tests for helpers

### Notes
- Unit tests should be placed alongside code files they test
- Use `npx jest [optional/path/to/test/file]` to run tests

## User Stories

- **US-001:** As a [type of user], I want to [perform an action] so that [benefit].
  - **Complexity:** [Overall complexity rating 1-10]
  - **Mapped to Task:** [Task number this story maps to]

- **US-002:** As a [type of user], I want to [perform an action] so that [benefit].
  - **Complexity:** [Overall complexity rating 1-10]
  - **Mapped to Task:** [Task number this story maps to]

## Tasks

- [ ] 1.0 Parent Task Title (Maps to US-001)
  - [ ] 1.1 [Sub-task description 1.1] - **Complexity:** [1-10]
  - [ ] 1.2 [Sub-task description 1.2] - **Complexity:** [1-10]
  - [ ] 1.3 [Sub-task description 1.3] - **Complexity:** [5] → *[Complex task - see breakdown below]*
    - [ ] 1.3.1 [Breakdown sub-task 1.3.1] - **Complexity:** [3]
    - [ ] 1.3.2 [Breakdown sub-task 1.3.2] - **Complexity:** [2]

- [ ] 2.0 Parent Task Title (Maps to US-002)
  - [ ] 2.1 [Sub-task description 2.1] - **Complexity:** [1-10]
  - [ ] 2.2 [Sub-task description 2.2] - **Complexity:** [1-10]

## Complexity Assessment Summary

### Total Tasks: [number] high-level tasks
### Total Subtasks: [number] (including breakdown subtasks)
### Average Complexity: [number]
### Complex Tasks (>4): [number] subtasks requiring breakdown
### Simple Tasks (≤4): [number] subtasks

### Complexity Distribution:
- **1-2 (Simple):** [number] subtasks
- **3-4 (Moderate):** [number] subtasks
- **5-6 (Complex):** [number] subtasks
- **7-8 (Very Complex):** [number] subtasks
- **9-10 (Extremely Complex):** [number] subtasks

### Automated Breakdown Applied:
- [number] complex subtasks were automatically broken down into [number] smaller, manageable subtasks
- All breakdown subtasks have complexity ≤ 4
- Parent tasks retained as summary/overview tasks
```

## Example Output

```markdown
# Task List: User Profile Creation System

## Relevant Files

- `src/components/UserProfile.tsx` - Main user profile component
- `src/components/UserProfile.test.tsx` - Unit tests for UserProfile
- `src/api/user.ts` - User API endpoints
- `src/api/user.test.ts` - Unit tests for user API
- `lib/utils/validation.ts` - Form validation utilities
- `lib/utils/validation.test.ts` - Tests for validation utilities

### Notes
- Unit tests should be placed alongside code files they test
- Use `npx jest [optional/path/to/test/file]` to run tests

## User Stories

- **US-001:** As a user, I want to create a profile so that I can personalize my experience.
  - **Complexity:** 6
  - **Mapped to Task:** 1.0

- **US-002:** As a user, I want to upload a profile picture so that others can recognize me.
  - **Complexity:** 4
  - **Mapped to Task:** 2.0

## Tasks

- [ ] 1.0 Implement User Profile Creation System (Maps to US-001)
  - [ ] 1.1 Create user profile database schema - **Complexity:** 3
  - [ ] 1.2 Implement profile creation API endpoint - **Complexity:** 4
  - [ ] 1.3 Build profile creation UI components - **Complexity:** 5 → *[Complex task - see breakdown below]*
    - [ ] 1.3.1 Create profile form component - **Complexity:** 3
    - [ ] 1.3.2 Implement form validation logic - **Complexity:** 2
  - [ ] 1.4 Add profile editing functionality - **Complexity:** 4

- [ ] 2.0 Implement Profile Picture Upload (Maps to US-002)
  - [ ] 2.1 Set up file upload infrastructure - **Complexity:** 4
  - [ ] 2.2 Create image upload API endpoint - **Complexity:** 3
  - [ ] 2.3 Build file upload UI component - **Complexity:** 2

## Complexity Assessment Summary

### Total Tasks: 2 high-level tasks
### Total Subtasks: 6 (including breakdown subtasks)
### Average Complexity: 3.5
### Complex Tasks (>4): 1 subtask requiring breakdown
### Simple Tasks (≤4): 5 subtasks

### Complexity Distribution:
- **1-2 (Simple):** 1 subtask
- **3-4 (Moderate):** 4 subtasks
- **5-6 (Complex):** 1 subtask
- **7-8 (Very Complex):** 0 subtasks
- **9-10 (Extremely Complex):** 0 subtasks

### Automated Breakdown Applied:
- 1 complex subtask was automatically broken down into 2 smaller, manageable subtasks
- All breakdown subtasks have complexity ≤ 4
- Parent task retained as summary/overview task
```

## Task Generation Process

### Step 1: User Story Analysis
1. Extract all user stories from the PRD
2. For each user story, identify core functionality required
3. Assign user story ID (US-001, US-002, etc.)

### Step 2: High-Level Task Creation
1. Create one high-level task per user story
2. Ensure task titles clearly reflect the user story goal
3. Map each task to its corresponding user story

### Step 3: Subtask Generation
1. Break down each high-level task into specific implementation steps
2. Consider existing codebase patterns and conventions
3. Ensure subtasks are specific, measurable, and actionable

### Step 4: Complexity Assessment
1. Rate each subtask using the 1-10 scale rubric
2. Document reasoning for high-complexity ratings
3. Apply automated breakdown for tasks rated > 4

### Step 5: Quality Review
1. Verify all user stories are covered by tasks
2. Check that complex tasks are properly broken down
3. Ensure the task list follows the specified format
4. Generate complexity assessment summary
