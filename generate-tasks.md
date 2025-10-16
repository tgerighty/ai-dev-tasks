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

## Enhanced Task Analysis Framework - "All Roads to Rome" Approach

### Cross-Functional Risk Assessment Process

#### Step 1: Multi-Criteria Evaluation
For each major task, assess across all dimensions using the "All Roads to Rome" methodology:

**User Impact Assessment:**
- **Frequency of Use:** Seldom/Frequent/Very Frequent
- **Affected Users:** Less (<100)/More (100-1000)/Many (>1000)
- **User-Facing Impact:** UI Only/Process Changes/Data Changes

**Technical Complexity Assessment:**
- **Algorithm Complexity:** Simple/Complex/Very Complex
- **Dependencies:** None/Internal Only/Internal + External
- **Software Maturity:** High/Recent/Medium/Low/Old
- **Screens/Entities Affected:** <2/2-4/>4

**Process Complexity Assessment:**
- **Logical Steps:** <2/2-3/>3
- **Process Layers:** UI Only/Calculation-Validation/Data Change
- **Integration Points:** Few/Moderate/Many

**Data and Impact Assessment:**
- **Data Volume:** Low/Medium/High
- **Expected Defect Rate:** Less/Moderate/Many

**Legal and Compliance Assessment:**
- **Regulatory Requirements:** None/Basic/Complex
- **Legal Impact of Failure:** Minimal/Moderate/High
- **Data Privacy Impact:** Low/Medium/High

#### Step 2: Path-Based Risk Determination
Follow the visual decision tree to determine risk level:

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   START TASK    │───▶│ASSESS CRITERIA │───▶│  MAP RISK PATH │───▶│DETERMINE LEVEL │
│   ASSESSMENT    │    │   EVALUATION   │    │   TO RISK      │    │   & TESTING    │
└─────────────────┘    └─────────────────┘    └─────────────────┘    └─────────────────┘
```

#### Step 3: Collaborative Risk Workshop
Conduct cross-functional assessment:

1. **Review Requirements (15 min):** Overview of feature/task
2. **Individual Assessment (10 min):** Each expert scores their area
   - Development Team: Technical factors
   - Product Management: User impact factors
   - Design/UX: User-facing and process factors
   - Legal/Compliance: Regulatory and legal factors
   - DevOps: Data and infrastructure factors
3. **Discussion (20 min):** Discuss perspectives and reach consensus
4. **Path Mapping (10 min):** Map risk path and determine final level
5. **Documentation (5 min):** Record assessment with rationale

### Enhanced Risk Level Classification

#### Critical Risk (Red Path) - Score: 4.5-5.0
**Path Characteristics:**
- Very Frequent + Many Users + Complex Algorithm
- Data Changes + High Data Volume + High Defect Rate
- Legal/Compliance requirements + High failure impact
- External dependencies + Critical business impact

#### High Risk (Orange Path) - Score: 3.6-4.4
**Path Characteristics:**
- Frequent + Many Users + Medium Algorithm
- Process Changes + Medium Data Volume
- External dependencies + Business impact
- Moderate legal requirements

#### Medium Risk (Yellow Path) - Score: 2.1-3.5
**Path Characteristics:**
- Seldom/Frequent + Less Users + Simple Algorithm
- UI Only changes + Low data volume
- Internal dependencies only
- Basic legal compliance

#### Low Risk (Green Path) - Score: 0.0-2.0
**Path Characteristics:**
- Seldom + Less Users + Simple Algorithm
- Minimal changes + No dependencies
- No legal requirements
- Low data impact

### Complexity Assessment (Enhanced)
Use the complexity rubric to score each task:
- **1-2:** Small, localized changes
- **3:** Medium changes with moderate risk
- **4:** Large but bounded changes
- **5+:** Must be decomposed into smaller subtasks (≤4)

### Risk Level Integration
Complexity and risk assessment work together:
- High complexity + High user impact = Critical Risk
- Medium complexity + Moderate impact = High Risk
- Low complexity + Low impact = Medium/Low Risk
- Legal requirements automatically elevate risk level

## Enhanced Task Generation Process

### 1. PRD Analysis and Risk Assessment
- Read functional requirements section
- Identify user stories and acceptance criteria
- Review non-functional requirements
- Consider technical constraints
- **Conduct initial risk assessment** for each major requirement

### 2. Cross-Functional Risk Workshop
For each major requirement/feature:
- **Schedule 60-minute risk assessment workshop**
- **Invite cross-functional team:**
  - Development Team (Technical assessment)
  - Product Management (User impact assessment)
  - Design/UX (User experience assessment)
  - Legal/Compliance (Regulatory assessment)
  - DevOps/Infrastructure (Data and performance assessment)

**Workshop Agenda:**
1. **Review Requirements (15 min):** Overview of feature
2. **Individual Assessment (10 min):** Each expert scores their criteria
3. **Discussion & Consensus (20 min):** Discuss perspectives and agree on risk path
4. **Path Mapping (10 min):** Map to risk level and determine testing requirements
5. **Documentation (5 min):** Record assessment with rationale

### 3. Break Down Requirements with Risk Consideration
For each functional requirement:
- **Identify main implementation tasks** based on risk assessment
- **Apply complexity scoring** using the complexity rubric
- **Break down complex tasks** into subtasks (complexity ≤4)
- **Inherit risk level** from parent major task
- **Identify dependencies** between tasks

### 4. Assign Priority Levels with Risk Weighting
- **P0 (Critical):** Critical Risk tasks - immediate priority
- **P1 (High):** High Risk tasks - high priority
- **P2 (Medium):** Medium Risk tasks - standard priority
- **P3 (Low):** Low Risk tasks - can be done later

**Risk-based priority adjustments:**
- Legal/compliance requirements automatically elevate priority
- High user impact requirements get priority consideration
- External dependencies may affect scheduling priority

### 5. Enhanced Task Structure
```markdown
## Tasks

### Critical Risk Tasks (P0) - Immediate Priority
- [ ] [Task Number] [Task Title] (Risk: Critical - [Score]/5.0)
  - **Assessment Summary:** [Brief risk rationale]
  - **Testing Requirements:** [Enhanced testing protocol]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

### High Risk Tasks (P1) - High Priority
- [ ] [Task Number] [Task Title] (Risk: High - [Score]/5.0)
  - **Assessment Summary:** [Brief risk rationale]
  - **Testing Requirements:** [Enhanced testing protocol]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
```

### 4. Create Task Structure
```markdown
## Tasks

### Critical Risk Tasks (P0) - Immediate Priority
- [ ] [Task Number] [Task Title] (Risk: Critical - [Score]/5.0) (Maps to US-[Number])
  - **Assessment Summary:** [Brief risk rationale from workshop]
  - **Testing Requirements:** Unit + Integration + E2E + Security + Performance + Accessibility (95%+ coverage)
  - **Legal Review Required:** Yes/No
  - **Stakeholder Sign-off:** [Required stakeholders]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

### High Risk Tasks (P1) - High Priority
- [ ] [Task Number] [Task Title] (Risk: High - [Score]/5.0) (Maps to US-[Number])
  - **Assessment Summary:** [Brief risk rationale from workshop]
  - **Testing Requirements:** Unit + Integration + E2E + Performance + Security (90%+ coverage)
  - **Legal Review Required:** Yes/No
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

### Medium Risk Tasks (P2) - Standard Priority
- [ ] [Task Number] [Task Title] (Risk: Medium - [Score]/5.0) (Maps to US-[Number])
  - **Assessment Summary:** [Brief risk rationale from workshop]
  - **Testing Requirements:** Unit + Integration (80%+ coverage)
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]

### Low Risk Tasks (P3) - Low Priority
- [ ] [Task Number] [Task Title] (Risk: Low - [Score]/5.0) (Maps to US-[Number])
  - **Assessment Summary:** [Brief risk rationale from workshop]
  - **Testing Requirements:** Unit tests only (70%+ coverage)
  - [ ] [Subtask Number] [Subtask Title] - **Complexity:** [Score]
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
