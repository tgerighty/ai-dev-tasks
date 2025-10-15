# Rule: Generating Tasks from PRD

## Goal
Guide an AI assistant in generating a detailed, actionable task list from a Product Requirements Document (PRD), with appropriate complexity scoring and risk assessment.

## Process
1. **Load PRD:** Read and analyze the PRD file provided by the user
2. **Analyze Requirements:** Break down functional requirements into implementable tasks
3. **Assess Complexity:** Score each task using the complexity rubric
4. **Assign Risk Levels:** Determine risk levels for quality gate planning
5. **Generate Task List:** Create structured task list with subtasks and dependencies
6. **Save Task List:** Save as `tasks-[n]-prd-[feature-name].md` in `/tasks` directory

## Documentation References
- **Complexity Rubric:** Use `docs/complexity-rubric.md` for task scoring
- **Risk Assessment:** Apply `docs/risk-assessment-framework.md` for risk levels
- **Testing Guidelines:** Reference `docs/testing-guidelines.md` for testing requirements
- **Workflow Examples:** See `examples/workflow-integration-example.md` for complete examples

## Task Analysis Framework

### Complexity Assessment
Use the complexity rubric to score each task:
- **1-2:** Small, localized changes
- **3:** Medium changes with moderate risk
- **4:** Large but bounded changes
- **5+:** Must be decomposed into smaller subtasks (≤4)

### Risk Level Determination
Based on task characteristics:
- **Critical (4.5-5.0):** Security-critical, high impact, complex integrations
- **High (3.6-4.4):** Important business functionality, external integrations
- **Medium (2.1-3.5):** Standard functionality, internal integrations
- **Low (0.0-2.0):** Simple functionality, minimal dependencies

## Task Generation Process

### 1. Analyze PRD Structure
- Read functional requirements section
- Identify user stories and acceptance criteria
- Review non-functional requirements
- Consider technical constraints

### 2. Break Down Requirements
For each functional requirement:
- Identify main implementation tasks
- Break down complex tasks into subtasks
- Ensure all subtasks have complexity ≤4
- Identify dependencies between tasks

### 3. Assign Priority Levels
- **P0 (Critical):** Must be done first, high risk
- **P1 (High):** Important, should be done early
- **P2 (Medium):** Standard priority
- **P3 (Low):** Can be done later

### 4. Create Task Structure
```markdown
## Tasks

### Critical Risk Tasks (P0)
- [ ] [Task Number].[Subtask] [Task Title] (Maps to US-[Number])
  - [ ] [Complexity Score] [Subtask description]
  - [ ] [Complexity Score] [Subtask description]
  - [ ] [Complexity Score] [Subtask description]

### High Risk Tasks (P1)
- [ ] [Task Number].[Subtask] [Task Title] (Maps to US-[Number])
  - [ ] [Complexity Score] [Subtask description]
  - [ ] [Complexity Score] [Subtask description]

### Medium Risk Tasks (P2)
- [ ] [Task Number].[Subtask] [Task Title] (Maps to US-[Number])
  - [ ] [Complexity Score] [Subtask description]
  - [ ] [Complexity Score] [Subtask description]

### Low Risk Tasks (P3)
- [ ] [Task Number].[Subtask] [Task Title] (Maps to US-[Number])
  - [ ] [Complexity Score] [Subtask description]
```

## Task List Template

```markdown
# Task List: [Feature Name]

## User Stories
- **US-[Number]:** [User Story Text] - **Complexity:** [Score] - **Mapped to Task:** [Task Number]

## Risk Assessment Summary
- **Highest Risk Level:** [Critical/High/Medium/Low]
- **Total Tasks:** [Number]
- **Critical Risk Tasks:** [Number]
- **High Risk Tasks:** [Number]
- **Medium Risk Tasks:** [Number]
- **Low Risk Tasks:** [Number]

## Tasks

### Critical Risk Tasks (P0) - Immediate Priority
- [ ] [Task Number] [Task Title] (Maps to US-[Number])
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

### High Risk Tasks (P1) - High Priority
- [ ] [Task Number] [Task Title] (Maps to US-[Number])
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

### Medium Risk Tasks (P2) - Standard Priority
- [ ] [Task Number] [Task Title] (Maps to US-[Number])
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

### Low Risk Tasks (P3) - Low Priority
- [ ] [Task Number] [Task Title] (Maps to US-[Number])
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

## Complexity Assessment Summary
- **Total Tasks:** [Number]
- **Total Subtasks:** [Number]
- **Average Complexity:** [Score]
- **Complex Tasks (>4):** [Number] (broken down into smaller tasks)
- **Simple Tasks (≤4):** [Number]

## Risk Distribution
- **Critical Risk:** [Number] tasks
- **High Risk:** [Number] tasks
- **Medium Risk:** [Number] tasks
- **Low Risk:** [Number] tasks

## Testing Requirements by Risk Level
- **Critical Risk:** Unit + Integration + E2E + Security + Performance + Accessibility (95%+ coverage)
- **High Risk:** Unit + Integration + E2E + Performance (90%+ coverage)
- **Medium Risk:** Unit + Integration (80%+ coverage)
- **Low Risk:** Unit Tests Only (70%+ coverage)

## Implementation Guidelines
- Follow risk-based testing protocols from `docs/testing-guidelines.md`
- Collect evidence according to risk level requirements
- Use appropriate quality gates for each risk level
- Reference `docs/risk-assessment-framework.md` for detailed protocols

## Dependencies
[List any task dependencies or sequencing requirements]

## Estimated Timeline
[Provide rough timeline estimates based on complexity and risk levels]

## Notes
[Any additional notes or considerations for implementation]
```

## Usage Examples

### Simple Example
```
AI: I'll generate tasks from your PRD. Let me analyze the requirements and create a structured task list.

[Analyzes PRD...]

Here's the task list I've generated:

# Task List: User Login Page

## User Stories
- **US-001:** As a user, I want to log in with email and password - **Complexity:** 3 - **Mapped to Task:** 1.0

## Risk Assessment Summary
- **Highest Risk Level:** Medium
- **Total Tasks:** 1

## Tasks
### Medium Risk Tasks (P2) - Standard Priority
- [ ] 1.0 User Login Page (Maps to US-001)
  - [ ] 1.1 Create login form component - **Complexity:** 2
  - [ ] 1.2 Implement form validation - **Complexity:** 2
  - [ ] 1.3 Add authentication service integration - **Complexity:** 3
  - [ ] 1.4 Create error handling and user feedback - **Complexity:** 2
```

### Complex Example
```
AI: I'll generate a comprehensive task list for your authentication system with risk assessment and complexity scoring.

[Analyzes PRD... breaks down complex requirements...]

# Task List: User Authentication System

## User Stories
- **US-001:** As a user, I want to log in with email and password - **Complexity:** 6 - **Mapped to Task:** 1.0
- **US-002:** As a user, I want to use social login - **Complexity:** 8 - **Mapped to Task:** 2.0
- **US-003:** As a user, I want to enable MFA - **Complexity:** 7 - **Mapped to Task:** 3.0

## Risk Assessment Summary
- **Highest Risk Level:** Critical
- **Total Tasks:** 3

## Tasks
### Critical Risk Tasks (P0) - Immediate Priority
- [ ] 1.0 Authentication Core Engine (Maps to US-001)
  - [ ] 1.1 Design secure authentication architecture - **Complexity:** 4
  - [ ] 1.2 Implement password hashing and validation - **Complexity:** 3
  - [ ] 1.3 Create JWT token management system - **Complexity:** 4
  - [ ] 1.4 Implement session management - **Complexity:** 4

- [ ] 2.0 Social Login Integration (Maps to US-002)
  - [ ] 2.1 Create OAuth2 integration framework - **Complexity:** 5 → *Complex task - see breakdown*
    - [ ] 2.1.1 Create OAuth2 configuration system - **Complexity:** 3
    - [ ] 2.1.2 Implement Google OAuth2 provider - **Complexity:** 3
    - [ ] 2.1.3 Implement Microsoft OAuth2 provider - **Complexity:** 3
  - [ ] 2.2 Build SSO user mapping and synchronization - **Complexity:** 4
```

## Quality Checklist

Before saving the task list, ensure:
- [ ] All functional requirements are covered
- [ ] Task complexity scores are appropriate (≤4 for leaf tasks)
- [ ] Risk levels are assigned correctly
- [ ] User stories are mapped to tasks
- [ ] Dependencies are identified
- [ ] Testing requirements are specified by risk level
- [ ] File follows naming convention: `tasks-[n]-prd-[feature-name].md`
- [ ] Task list is saved in `/tasks` directory

## Integration with Workflow

This task generation step feeds directly into:
1. **Implementation** (`process-task-list.md`) - Guides step-by-step development
2. **Risk-Based Testing** - Determines testing protocols and evidence collection
3. **Quality Assurance** - Sets up appropriate quality gates and reviews

## File Naming Convention

Save task lists in the `/tasks` directory using this format:
- `tasks-0001-prd-[feature-name].md`
- `tasks-0002-prd-[feature-name].md`
- etc. (matching the corresponding PRD number)

## Common Patterns

### Handling Complex Tasks
- Any task with complexity >4 must be broken down
- Use subtasks to reduce complexity to ≤4
- Maintain logical flow and dependencies
- Ensure each subtask is independently testable

### Risk-Based Prioritization
- Critical risk tasks get immediate attention
- High risk tasks should be completed early
- Medium and low risk tasks can be scheduled appropriately
- Consider dependencies when planning implementation order

### User Story Mapping
- Ensure every user story has corresponding tasks
- Map user stories to specific implementation tasks
- Track progress against user story completion
- Validate that all acceptance criteria are covered
