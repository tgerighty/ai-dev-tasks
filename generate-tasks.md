# Rule: Generating a Task List from a PRD with User Stories and Complexity Assessment

## Goal

To guide an AI assistant in creating a detailed, step-by-step task list in Markdown format based on an existing Product Requirements Document (PRD). The task list should guide a developer through implementation with a structured approach that includes user stories, high-level tasks, subtasks, and complexity ratings.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `tasks-[prd-file-name].md` (e.g., `tasks-0001-prd-user-profile-editing.md`)

## Process

1.  **Receive PRD Reference:** The user points the AI to a specific PRD file
2.  **Analyze PRD:** The AI reads and analyzes the functional requirements, user stories, and other sections of the specified PRD.
3.  **Map User Stories to High-Level Tasks:** For each user story in the PRD, create a corresponding high-level task that addresses the story.

**Migration Note for PRDs Without User Stories:**
If the PRD doesn't contain user stories, use this fallback process:

1. **Extract User Stories from Functional Requirements:**
   - Review each functional requirement in the PRD
   - Convert requirements to user story format: "As a [user], I want [action] so that [benefit]"
   - Use the requirement number as user story ID (FR-001 → US-001)

2. **Create User Stories When Requirements Are Vague:**
   - For unclear requirements, create generic user stories based on common user types
   - Example: "As a user, I want to [requirement action] so that [implied benefit]"
   - Document assumptions made during conversion

3. **Fallback User Story Template:**
   ```
   US-FB-001: As a user, I want to [feature name] so that I can [primary benefit].
   ```

4. **Validate Generated User Stories:**
   - Ensure each generated story follows the quality criteria
   - Adjust overly broad stories into smaller, focused ones
   - Document any assumptions made during the conversion process
4.  **Assess Current State:** Review the existing codebase to understand existing infrastructure, architectural patterns and conventions. Also, identify any existing components or features that already exist and could be relevant to the PRD requirements. Then, identify existing related files, components, and utilities that can be leveraged or need modification.
5.  **Phase 1: Generate Parent Tasks:** Based on the PRD analysis and current state assessment, create the file and generate the main, high-level tasks required to implement the feature. Use your judgement on how many high-level tasks to use. It's likely to be about five tasks. Present these tasks to the user in the specified format (without sub-tasks yet). Inform the user: "I have generated the high-level tasks based on the PRD. Ready to generate the sub-tasks? Respond with 'Go' to proceed."
6.  **Wait for Confirmation:** Pause and wait for the user to respond with "Go".
7.  **Phase 2: Generate Sub-Tasks:** Once the user confirms, break down each parent task into smaller, actionable sub-tasks necessary to complete the parent task. Ensure sub-tasks logically follow from the parent task, cover the implementation details implied by the PRD, and consider existing codebase patterns where relevant without being constrained by them.
8.  **Phase 3: Assess Complexity:** For each sub-task, assess and assign a complexity rating from 1 (simple) to 10 (very complex) based on:
    - Implementation difficulty
    - Time required
    - Technical dependencies
    - Risk of breaking existing functionality
9.  **Phase 4: Break Down Complex Tasks:** For any sub-task with a complexity rating higher than 4, automatically break it down into smaller, more manageable subtasks with their own complexity ratings.
10. **Identify Relevant Files:** Based on the tasks and PRD, identify potential files that will need to be created or modified. List these under the `Relevant Files` section, including corresponding test files if applicable.
11. **Generate Final Output:** Combine the parent tasks, sub-tasks, complexity ratings, relevant files, and notes into the final Markdown structure.
12. **Save Task List:** Save the generated document in the `/tasks/` directory with the filename `tasks-[prd-file-name].md`, where `[prd-file-name]` matches the base name of the input PRD file (e.g., if the input was `0001-prd-user-profile-editing.md`, the output is `tasks-0001-prd-user-profile-editing.md`).

## Output Format

The generated task list _must_ follow this structure:

```markdown
## Relevant Files

- `path/to/potential/file1.ts` - Brief description of why this file is relevant (e.g., Contains the main component for this feature).
- `path/to/file1.test.ts` - Unit tests for `file1.ts`.
- `path/to/another/file.tsx` - Brief description (e.g., API route handler for data submission).
- `path/to/another/file.test.tsx` - Unit tests for `another/file.tsx`.
- `lib/utils/helpers.ts` - Brief description (e.g., Utility functions needed for calculations).
- `lib/utils/helpers.test.ts` - Unit tests for `helpers.ts`.

### Notes

- Unit tests should typically be placed alongside the code files they are testing (e.g., `MyComponent.tsx` and `MyComponent.test.tsx` in the same directory).
- Use `npx jest [optional/path/to/test/file]` to run tests. Running without a path executes all tests found by the Jest configuration.

## User Stories

- **US-001:** As a [type of user], I want to [perform an action] so that [benefit].
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

## Complexity Assessment Guidelines

### Rating Scale (1-10)

**Time Required Estimates:**
- **1:** 1-2 hours (single developer, same day)
- **2:** 2-4 hours (single developer, same day)
- **3:** 4-6 hours (single developer, 1-2 days)
- **4:** 6-8 hours (single developer, 1-2 days)
- **5:** 8-12 hours (single developer, 2-3 days)
- **6:** 12-16 hours (single developer, 2-3 days)
- **7:** 16-24 hours (1-2 developers, 3-4 days)
- **8:** 24-32 hours (2 developers, 4-5 days)
- **9:** 32-40 hours (2-3 developers, 1 week)
- **10:** 40+ hours (3+ developers, 1+ weeks)

**Complexity Levels:**
- **1-2 (Simple):** Basic implementation, well-defined requirements, minimal dependencies
  - Single file/component change
  - No external API calls or database changes
  - Well-established patterns in codebase
  - Minimal testing required (unit tests only)
  
- **3-4 (Moderate):** Some complexity, requires integration with existing systems, moderate testing required
  - Multiple files/components but within same module
  - Simple API integration or database query
  - Follows existing patterns with minor modifications
  - Unit tests + some integration testing
  
- **5-6 (Complex):** Significant implementation work, multiple dependencies, requires careful planning
  - Cross-module changes affecting multiple systems
  - New API endpoints or significant database schema changes
  - Requires research into unfamiliar technologies
  - Comprehensive testing (unit, integration, some E2E)
  
- **7-8 (Very Complex):** High technical challenge, may require research, significant risk involved
  - Major architectural changes or new system integration
  - Performance optimization or security implementation
  - Requires learning new frameworks or technologies
  - Full testing suite (unit, integration, E2E, performance)
  
- **9-10 (Extremely Complex):** Major architectural changes, high risk, may require multiple developers
  - System-wide refactoring or migration
  - External service integration with complex contracts
  - High-risk security or compliance requirements
  - Requires extensive testing, monitoring, and rollback plans

### Automated Breakdown Rules
- Any subtask with complexity **> 4** must be broken down
- Break down into 2-4 smaller subtasks with complexity **≤ 4**
- Each breakdown subtask should be logically distinct and actionable
- Maintain the parent task as a summary/overview task

### Breakdown Strategy Guidelines

**Database Tasks (Complexity 5+):**
1. **Schema Design** → **Migration Script** → **API Integration** → **Testing**
   - Schema: Database model design, relationships, constraints
   - Migration: Up/down migration scripts, data handling
   - API: CRUD operations, validation, error handling
   - Testing: Unit tests, integration tests, migration testing

2. **Query Optimization** → **Index Strategy** → **Implementation** → **Validation**
   - Optimization: Query analysis, performance bottleneck identification
   - Index Strategy: Index design, composite indexes, trade-offs
   - Implementation: Index creation, query rewriting
   - Validation: Performance testing, benchmarking

**UI/Component Tasks (Complexity 5+):**
1. **Component Structure** → **State Management** → **Integration** → **Styling**
   - Structure: Component hierarchy, props interface, basic rendering
   - State: State management, hooks, side effects
   - Integration: Event handling, API calls, data flow
   - Styling: CSS/styling, responsive design, accessibility

2. **Complex Form** → **Validation Logic** → **State Management** → **Error Handling** → **Submission**
   - Form: Input fields, layout, basic functionality
   - Validation: Client-side validation, error messages
   - State: Form state, submission state, loading states
   - Error: Network errors, validation errors, retry logic
   - Submission: API integration, success/error handling

**API Tasks (Complexity 5+):**
1. **Endpoint Design** → **Validation** → **Business Logic** → **Error Handling** → **Documentation**
   - Design: API contract, request/response schemas
   - Validation: Input validation, sanitization, security
   - Logic: Business rules, data processing, calculations
   - Error: HTTP status codes, error responses, logging
   - Documentation: API docs, examples, testing

2. **Authentication** → **Token Management** → **Authorization** → **Security** → **Testing**
   - Authentication: Login/logout, token generation/validation
   - Token: JWT creation, refresh, expiration handling
   - Authorization: Role-based access, permissions checking
   - Security: Rate limiting, secure headers, validation
   - Testing: Unit tests, security tests, integration tests

**Integration Tasks (Complexity 5+):**
1. **Research** → **Implementation** → **Configuration** → **Testing** → **Documentation**
   - Research: Third-party service analysis, API documentation
   - Implementation: Client library, wrapper functions
   - Configuration: Environment setup, credentials management
   - Testing: Mock services, integration tests, error scenarios
   - Documentation: Setup guide, usage examples, troubleshooting

2. **Data Migration** → **Transformation** → **Validation** → **Rollback Plan** → **Execution**
   - Migration: Data extraction, transformation logic
   - Transformation: Data mapping, format conversion, validation
   - Validation: Data integrity checks, consistency verification
   - Rollback: Backup strategy, rollback procedures
   - Execution: Migration scripts, monitoring, error handling

**General Breakdown Principles:**
- **Size Appropriately**: Each subtask should be completable in 1-3 days
- **Logical Dependencies**: Breakdown should follow natural work flow
- **Testable Units**: Each subtask should be independently testable
- **Clear Deliverables**: Each subtask should have a clear, measurable outcome
- **Risk Mitigation**: Separate risky elements into distinct subtasks

### Assessment Criteria
When assessing complexity, use these concrete metrics:

1. **Implementation Difficulty:** Count distinct technical concepts required
   - **1-2:** 1-2 concepts (basic React component, simple API call)
   - **3-4:** 3-4 concepts (state management, authentication, form validation)
   - **5-6:** 5-6 concepts (complex state, caching, error handling)
   - **7-8:** 7-8 concepts (performance optimization, security, testing)
   - **9-10:** 9+ concepts (architecture, distributed systems, compliance)

2. **Time Required:** Use concrete estimates from the scale above
   - Match estimated hours to the closest complexity level
   - Consider both coding and testing time
   - Factor in research and learning time

3. **Dependencies:** Count and categorize external integrations
   - **1-2:** 0-1 internal dependencies (same module)
   - **3-4:** 2-3 dependencies (different modules, simple APIs)
   - **5-6:** 4-6 dependencies (external APIs, database changes)
   - **7-8:** 7-10 dependencies (third-party services, complex integrations)
   - **9-10:** 10+ dependencies (multiple external systems, critical path dependencies)

4. **Risk Level:** Assess potential for breaking existing functionality
   - **1-2:** Low risk (isolated feature, no shared state)
   - **3-4:** Medium risk (affects existing functionality, some shared state)
   - **5-6:** High risk (core functionality changes, database migrations)
   - **7-8:** Very high risk (architecture changes, breaking changes)
   - **9-10:** Critical risk (system-wide impact, requires extensive testing)

5. **Testing Required:** Assess testing complexity
   - **1-2:** Unit tests only (simple validation)
   - **3-4:** Unit + integration tests (API testing)
   - **5-6:** Unit + integration + basic E2E tests
   - **7-8:** Full testing suite including performance/security tests
   - **9-10:** Comprehensive testing with load testing, monitoring, rollback plans

6. **Research Needed:** Estimate learning and investigation time
   - **1-2:** Minimal research (existing patterns)
   - **3-4:** Some research (new API or library)
   - **5-6:** Significant research (new technology or domain)
   - **7-8:** Extensive research (unfamiliar architectural patterns)
   - **9-10:** Major research (new paradigm or framework)

**Complexity Calculation Formula:**
Take the highest score from any criterion, then adjust by ±1 based on overall context and team familiarity with the technology stack.

## Task Generation Process

### Step 1: User Story Analysis
1. Extract all user stories from the PRD
2. For each user story, identify the core functionality required
3. Assign a user story ID (US-001, US-002, etc.)

### Step 2: High-Level Task Creation
1. Create one high-level task per user story
2. Ensure task titles clearly reflect the user story goal
3. Map each task to its corresponding user story

### Step 3: Subtask Generation
1. Break down each high-level task into specific implementation steps
2. Consider existing codebase patterns and conventions
3. Ensure subtasks are specific, measurable, and actionable

### Step 4: Complexity Assessment
1. Rate each subtask using the 1-10 scale
2. Document the reasoning for high-complexity ratings
3. Apply automated breakdown for tasks rated > 4

### Step 5: Quality Review
1. Verify all user stories are covered by tasks
2. Check that complex tasks are properly broken down
3. Ensure the task list follows the specified format

## Example Output

```markdown
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
```
```
