# Rule: Generating a Task List from a PRD with User Stories and Complexity Assessment

## Goal

To guide an AI assistant in creating a **single** comprehensive task list in Markdown format based on an existing Product Requirements Document (PRD). The task list includes user stories, high-level tasks, subtasks, and complexity ratings with automatic breakdown for complex items.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `tasks-[prd-file-name].md` (e.g., `tasks-0001-prd-user-profile-editing.md`)
- **Important:** This creates ONE task list file that contains everything (PRD content, user stories, tasks, and complexity assessment)

## Process

1. **Receive PRD Reference:** The user points the AI to a specific PRD file
2. **Analyze PRD:** Read and analyze functional requirements, user stories, and technical requirements
3. **Map User Stories to High-Level Tasks:** For each user story, create a corresponding high-level task
4. **Generate Subtasks:** Break down each high-level task into specific implementation subtasks
5. **Assess Complexity:** Rate each subtask using the complexity rubric (1-10 scale)
6. **Break Down Complex Tasks:** Automatically break down any subtask with complexity > 4 into smaller subtasks (≤ 4)
7. **Generate Final Output:** Create one comprehensive file with all content

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
