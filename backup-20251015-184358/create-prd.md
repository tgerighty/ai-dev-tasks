# Rule: Generating a Product Requirements Document (PRD)

## Goal

To guide an AI assistant in creating a detailed Product Requirements Document (PRD) in Markdown format, based on an initial user prompt. The PRD should be clear, actionable, and suitable for a junior developer to understand and implement the feature.

## Process

1.  **Receive Initial Prompt:** The user provides a brief description or request for a new feature or functionality.
2.  **Ask Clarifying Questions:** Before writing the PRD, the AI *must* ask clarifying questions to gather sufficient detail. The goal is to understand the "what" and "why" of the feature, not necessarily the "how" (which the developer will figure out). Make sure to provide options in letter/number lists so I can respond easily with my selections.
3.  **Generate PRD:** Based on the initial prompt and the user's answers to the clarifying questions, generate a PRD using the structure outlined below.
4.  **Save PRD:** Save the generated document as `[n]-prd-[feature-name].md` inside the `/tasks` directory. (Where `n` is a zero-padded 4-digit sequence starting from 0001, e.g., `0001-prd-user-authentication.md`, `0002-prd-dashboard.md`, etc.)

## Clarifying Questions (Examples)

The AI should adapt its questions based on the prompt, but here are some common areas to explore:

### Standard Questions
*   **Problem/Goal:** "What problem does this feature solve for the user?" or "What is the main goal we want to achieve with this feature?"
*   **Target User:** "Who is the primary user of this feature?"
*   **Core Functionality:** "Can you describe the key actions a user should be able to perform with this feature?"
*   **User Stories:** "Could you provide a few user stories? (e.g., As a [type of user], I want to [perform an action] so that [benefit].)"
*   **Acceptance Criteria:** "How will we know when this feature is successfully implemented? What are the key success criteria?"
*   **Scope/Boundaries:** "Are there any specific things this feature *should not* do (non-goals)?"
*   **Data Requirements:** "What kind of data does this feature need to display or manipulate?"
*   **Design/UI:** "Are there any existing design mockups or UI guidelines to follow?" or "Can you describe the desired look and feel?"
*   **Edge Cases:** "Are there any potential edge cases or error conditions we should consider?"

### Risk Assessment Questions (NEW)

#### Technical Risk Factors
**For each proposed feature/functionality, please rate:**

**A. Frequency of Use (1-5):**
1. Rarely used (less than daily)
2. Occasionally used (daily to weekly)
3. Regularly used (multiple times per day)
4. Frequently used (hourly or more)
5. Constantly used (always active)

**B. Algorithm Complexity (1-5):**
1. Simple logic and straightforward operations
2. Basic algorithms with some complexity
3. Moderate complexity with multiple steps
4. Complex algorithms with edge cases
5. Highly complex with advanced algorithms

**C. Dependencies (1-5):**
1. No external dependencies
2. 1-2 simple external dependencies
3. 3-5 external dependencies
4. 6-10 dependencies including complex integrations
5. Many dependencies (>10) or critical external services

**D. Affected Data Sensitivity:**
A. Low (public/non-sensitive data)
B. Medium (internal business data)
C. High (sensitive user data)
D. Critical (financial, health, security credentials)

**E. Components Affected (1-5):**
1. Single component
2. 2-3 related components
3. 4-6 components in same module
4. 7-10 components across modules
5. Many components (>10) or system-wide impact

#### Business Risk Factors
**For each proposed feature/functionality, please rate:**

**F. Affected Users (1-5):**
1. 1-10 users (internal team)
2. 11-100 users (department)
3. 101-1000 users (small organization)
4. 1001-10000 users (medium organization)
5. 10000+ users (large organization or public)

**G. Impact of Failure:**
A. Low (minor inconvenience, workaround available)
B. Medium (significant inconvenience, limited workaround)
C. High (major business impact, limited workaround)
D. Critical (business/financial loss, security breach, legal issues)

**H. Business Visibility:**
A. Internal (team/department visibility only)
B. External (visible to customers/partners)
C. Critical (mission-critical, customer-facing core functionality)

**I. Expected Defect Rate (%):**
What is the expected defect rate for this type of functionality?
- 0.01% - 0.1% (very low tolerance - security, financial)
- 0.1% - 1% (low tolerance - critical functionality)
- 1% - 3% (moderate tolerance - standard features)
- 3% - 5% (higher tolerance - experimental features)

**J. Software Maturity:**
A. New (entirely new functionality)
B. Evolving (existing system with new major changes)
C. Mature (well-established functionality)
D. Legacy (old system requiring modernization)

### Risk Assessment Integration

**After gathering standard requirements, ask:**

"Based on your responses, I'll calculate risk scores for each feature area. This will help us prioritize tasks and determine appropriate testing requirements. Are you ready to proceed with the risk assessment?"

## User Story Creation Guidelines

After gathering initial requirements, the AI must help create well-structured user stories that will serve as the foundation for task generation.

### User Story Format
Each user story should follow this format:
**"As a [type of user], I want to [perform an action] so that [benefit]."**

### Creating Effective User Stories

**User Story Creation Workflow:**
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Identify    │───▶│ Define      │───▶│ Clarify     │───▶│ Prioritize   │───▶│ Ensure      │
│ User Types  │    │ Actions     │    │ Benefits    │    │ Stories     │    │ Testability │
│             │    │             │    │             │    │             │    │             │
│ • Who uses │    │ • What can  │    │ • Why want │    │ • Which are  │    │ • Can be   │
│   feature? │    │   users do? │    │   to do it? │    │   most      │    │   tested?  │
│ • Primary   │    │ • Specific   │    │ • What value│    │   critical?  │    │ • Measurable│
│ • Secondary │    │   behaviors │    │   does it   │    │ • Nice to   │    │ • Verifiable│
│ • Roles     │    │ • Capabilities│    │   provide?  │    │   have?     │    │             │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

**User Story Creation Process:**
1. **Identify User Types:** Determine who will benefit from this feature
2. **Define Actions:** What specific actions can users perform?
3. **Clarify Benefits:** Why would users want to perform these actions?
4. **Prioritize Stories:** Help users prioritize which stories are most critical
5. **Ensure Testability:** Each story should be testable and measurable

**User Story Template Workflow:**
```
┌─────────────────────────────────────────────────────────────────┐
│                     USER STORY TEMPLATE                      │
├─────────────────────────────────────────────────────────────────┤
│ As a [USER TYPE],                                                │
│ I want to [SPECIFIC ACTION],                                   │
│ so that [CLEAR BENEFIT].                                      │
│                                                                 │
│ ┌─────────────┐  ┌─────────────┐  ┌─────────────┐           │
│ │   USER     │  │    ACTION   │  │   BENEFIT   │           │
│ │   TYPE     │  │             │  │             │           │
│ │ • Primary  │  │ • Specific  │  │ • Measurable│           │
│ │ • Secondary│  │ • Achievable│  │ • User-focused│           │
│ │ • Role     │  │ • Behavior  │  │ • Value     │           │
│ └─────────────┘  └─────────────┘  └─────────────┘           │
└─────────────────────────────────────────────────────────────────┘
                               ↓
                    ┌─────────────────┐
                    │ VALIDATE STORY │
                    │ • Clear user?  │
                    │ • Specific action?│
                    │ • Measurable benefit?│
                    │ • Bounded scope?│
                    └─────────────────┘
```

### User Story Quality Criteria
- **Specific:** Clear and unambiguous description of what's needed
- **Actionable:** Can be broken down into concrete development tasks
- **Valuable:** Provides clear benefit to the user
- **Testable:** Can be verified as complete through testing
- **Sized:** Small enough to be completed in a reasonable timeframe

### User Story Validation Rules

**Quality Checklist:**
- [ ] **User Role:** Is the user type clearly identified and specific?
- [ ] **Action:** Is the action specific and achievable?
- [ ] **Benefit:** Is the benefit clear and measurable?
- [ ] **Scope:** Is the story bounded and not overly broad?
- [ ] **Independence:** Can the story be implemented independently?

**Good vs. Poor Examples:**

**✅ Good Examples:**
```
As a content creator, I want to schedule posts for future publication so that I can maintain consistent content delivery without manual intervention.
As a system administrator, I want to monitor API response times in real-time so that I can quickly identify and resolve performance issues.
As a customer, I want to save my payment method for future purchases so that I don't have to enter card details for every transaction.
```

**❌ Poor Examples:**
```
As a user, I want to improve the system so that it works better.  # Too vague, no specific action or benefit
As an admin, I want to manage everything so that the system is perfect.  # Too broad, not bounded
As a developer, I want to add a button so that users can click it.  # Trivial benefit, not user-focused
As a marketing team, we want to increase engagement so that business metrics improve.  # Not actionable, unclear user role
```

**User Story Red Flags:**
- **Vague Verbs:** "improve", "enhance", "optimize", "manage" (without specifics)
- **Undefined Benefits:** "better experience", "improved efficiency" (not measurable)
- **Overly Broad:** Stories covering entire systems or multiple features
- **Technical Focus:** Stories written from implementation perspective rather than user perspective
- **Missing Components:** Incomplete "As a [user], I want [action] so that [benefit]" structure

**User Story Validation Workflow:**
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Story     │───▶│   Read      │───▶│   Identify   │───▶│   Clarify   │───▶│    Test     │
│   Input     │    │   Aloud     │    │     User     │    │    Action   │    │ Independence│
│             │    │             │    │   & Role     │    │   & Benefit  │    │             │
│ • Raw story│    │ • Logical?  │    │ • Specific? │    │ • Specific? │    │ • Can be    │
│ • Notes     │    │ • Makes sense│    │ • Identifiable│    │ • Measurable?│    │   implemented│
│ • Context   │    │ • Clear flow │    │ • Clear role │    │ • Value add? │    │   separately? │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
       ↓                 ↓                 ↓                 ↓                 ↓
┌─────────────────────────────────────────────────────────────────┐
│                    VALIDATION CHECKLIST                      │
├─────────────────────────────────────────────────────────────────┤
│ ✓ User Role: Is the user type clearly identified?             │
│ ✓ Action: Is the action specific and achievable?               │
│ ✓ Benefit: Is the benefit clear and measurable?               │
│ ✓ Scope: Is the story bounded and not overly broad?           │
│ ✓ Independence: Can the story be implemented independently?    │
└─────────────────────────────────────────────────────────────────┘
```

**Validation Process:**
1. **Read the story aloud:** Does it make logical sense?
2. **Identify the user:** Can you name a specific user type?
3. **Clarify the action:** What specific behavior change occurs?
4. **Measure the benefit:** How would you know if this succeeds?
5. **Test independence:** Could this be implemented separately from other stories?

**User Story Validation Matrix:**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   USER ROLE     │    │     ACTION      │    │     BENEFIT     │
│   Analysis      │    │    Analysis      │    │    Analysis      │
├─────────────────┤    ├─────────────────┤    ├─────────────────┤
│ ✓ Specific?     │    │ ✓ Specific?      │    │ ✓ Measurable?    │
│ ✓ Identifiable? │    │ ✓ Achievable?     │    │ ✓ User-focused?  │
│ ✓ Not generic?  │    │ ✓ Clear behavior?│    │ ✓ Clear value?   │
│ ✓ Clear role?   │    │ ✓ Single action?  │    │ ✓ Testable?      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

**Acceptance Criteria for User Stories:**
- Follows the standard format: "As a [user], I want [action] so that [benefit]"
- User role is specific and identifiable (e.g., "content creator", not just "user")
- Action describes a specific behavior or capability
- Benefit is measurable and user-focused
- Story scope is bounded and can be completed in 1-2 sprints
- Multiple users can benefit from the same feature (unless truly specific)

**User Story Prioritization Workflow:**
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Collect   │───▶│   Analyze   │───▶│   Prioritize │───▶│   Validate  │───▶│   Finalize  │
│   Stories   │    │   Impact    │    │   Value     │    │   Quality    │    │   Stories   │
│             │    │             │    │             │    │             │    │             │
│ • Brainstorm│    │ • Business  │    │ • User value │    │ • Story     │    │ • Approved  │
│ • Requirements│    │   impact    │    │ • Frequency  │    │   quality   │    │ • Ready for  │
│ • Ideas     │    │ • User need  │    │ • Criticality│    │ • Completeness│    │ • development│
│ • Feedback   │    │ • Technical  │    │ • Dependencies│    │ • Validation │    │ • Documented │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

**User Story Anti-Patterns:**
- **"System Stories":** "The system shall..." (focus on system, not user)
- **"Technology Stories":** "Implement React component..." (implementation, not user need)
- **"Feature Stories":** "Add search functionality..." (feature description, not user scenario)
- **"Epic Stories":** Stories that span multiple development cycles
- **"Dependency Stories":** Stories that require other stories to be complete first

**Anti-Pattern Detection Workflow:**
```
┌─────────────────┐
│ ANTI-PATTERN    │
│    DETECTION     │
├─────────────────┤
│ ❌ "System shall"│ → Focus on user action
│ ❌ "Implement"   │ → Focus on user benefit  
│ ❌ "Add feature" │ → Describe user scenario
│ ❌ Epic scope   │ → Break into smaller stories
│ ❌ Dependencies  │ → Make independent
└─────────────────┘
```

## PRD Structure

The generated PRD should include the following sections:

1.  **Introduction/Overview:** Briefly describe the feature and the problem it solves. State the goal.
2.  **Goals:** List the specific, measurable objectives for this feature.
3.  **User Stories:** Detail the user narratives describing feature usage and benefits. **This section is critical as it forms the foundation for task generation.** Each user story should be clearly stated and actionable.
4.  **Functional Requirements:** List the specific functionalities the feature must have. Use clear, concise language (e.g., "The system must allow users to upload a profile picture."). Number these requirements.
5.  **Risk Assessment:** **NEW** - Include risk assessment for each major functional area based on the technical and business factors gathered during clarifying questions.
6.  **Non-Goals (Out of Scope):** Clearly state what this feature will *not* include to manage scope.
7.  **Design Considerations (Optional):** Link to mockups, describe UI/UX requirements, or mention relevant components/styles if applicable.
8.  **Technical Considerations (Optional):** Mention any known technical constraints, dependencies, or suggestions (e.g., "Should integrate with the existing Auth module").

## Risk Assessment

Each PRD must include a comprehensive risk assessment section that analyzes technical and business risks to prioritize tasks and determine appropriate testing requirements.

### Risk Assessment Questions

During clarifying questions, ask users to rate these factors for each major functional area:

#### Technical Risk Factors (1-5 scale)
- **Frequency of Use**: How often will this be used? (1=rarely to 5=constantly)
- **Algorithm Complexity**: How complex are the algorithms? (1=simple to 5=highly complex)
- **Dependencies**: How many external dependencies? (1=none to 5=many)
- **Affected Data**: What data sensitivity? (A=Low, B=Medium, C=High, D=Critical)
- **Components Affected**: How many system components? (1=single to 5=many)

#### Business Risk Factors
- **Affected Users**: How many users impacted? (1=1-10 to 5=10000+)
- **Impact of Failure**: What happens if it fails? (A=Minor to D=Critical)
- **Business Visibility**: Who sees this? (A=Internal to C=Critical)
- **Expected Defect Rate**: What defect tolerance? (0.01%-5%+)
- **Software Maturity**: How mature is this area? (A=New to D=Legacy)

### Risk Scoring Algorithm

**Technical Risk Calculation:**
```
Technical Risk = (Frequency × 1.2) + (Complexity × 1.0) + (Dependencies × 1.5) + (Data_Sensitivity × 2.0) + (Components × 1.0)
```
**Data Sensitivity Values:** A=1.0, B=2.0, C=3.5, D=5.0

**Business Risk Calculation:**
```
Business Risk = (Users × 1.5) + (Impact × 2.0) + (Visibility × 1.0) + (Defect_Rate × 1.5) + (Maturity × 1.0)
```
**Impact Values:** A=1.0, B=2.5, C=4.0, D=5.0

**Overall Risk Score:**
```
Overall Risk = (Technical Risk + Business Risk) / 2
```

### Risk Levels and Testing Requirements

| Risk Score | Risk Level | Testing Required | Evidence Collection |
|------------|------------|------------------|---------------------|
| 4.5-5.0 | Critical | Unit + Integration + E2E + Security + Performance + Accessibility | All test reports + security audit + performance metrics |
| 3.6-4.4 | High | Unit + Integration + E2E + Performance | All test reports + performance metrics |
| 2.1-3.5 | Medium | Unit + Integration | Unit and integration test reports |
| 0.0-2.0 | Low | Unit Tests Only | Unit test reports |

### Risk Assessment Process

1. **Calculate Risk Scores**: Apply algorithms to determine risk levels
2. **Prioritize by Risk**: Organize tasks by risk level (Critical → High → Medium → Low)
3. **Assign Testing**: Determine appropriate testing requirements
4. **Create Mitigation**: Develop risk mitigation strategies for high-risk areas

### Risk Assessment Integration with Task Generation

- **Task Prioritization**: Higher-risk tasks get priority in development
- **Resource Allocation**: More resources for high-risk areas
- **Testing Requirements**: Each task includes specific testing based on its risk level
- **Evidence Collection**: Tasks require evidence proportional to risk level
- **Review Processes**: High-risk tasks require additional reviews
8.  **Success Metrics:** How will the success of this feature be measured? (e.g., "Increase user engagement by 10%", "Reduce support tickets related to X").
9.  **Open Questions:** List any remaining questions or areas needing further clarification.

## Target Audience

Assume the primary reader of the PRD is a **junior developer**. Therefore, requirements should be explicit, unambiguous, and avoid jargon where possible. Provide enough detail for them to understand the feature's purpose and core logic.

## Output

*   **Format:** Markdown (`.md`)
*   **Location:** `/tasks/`
*   **Filename:** `[n]-prd-[feature-name].md`

## Final instructions

1. Do NOT start implementing the PRD
2. Make sure to ask the user clarifying questions
3. Take the user's answers to the clarifying questions and improve the PRD