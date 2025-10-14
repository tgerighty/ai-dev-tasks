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

*   **Problem/Goal:** "What problem does this feature solve for the user?" or "What is the main goal we want to achieve with this feature?"
*   **Target User:** "Who is the primary user of this feature?"
*   **Core Functionality:** "Can you describe the key actions a user should be able to perform with this feature?"
*   **User Stories:** "Could you provide a few user stories? (e.g., As a [type of user], I want to [perform an action] so that [benefit].)"
*   **Acceptance Criteria:** "How will we know when this feature is successfully implemented? What are the key success criteria?"
*   **Scope/Boundaries:** "Are there any specific things this feature *should not* do (non-goals)?"
*   **Data Requirements:** "What kind of data does this feature need to display or manipulate?"
*   **Design/UI:** "Are there any existing design mockups or UI guidelines to follow?" or "Can you describe the desired look and feel?"
*   **Edge Cases:** "Are there any potential edge cases or error conditions we should consider?"

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
5.  **Non-Goals (Out of Scope):** Clearly state what this feature will *not* include to manage scope.
6.  **Design Considerations (Optional):** Link to mockups, describe UI/UX requirements, or mention relevant components/styles if applicable.
7.  **Technical Considerations (Optional):** Mention any known technical constraints, dependencies, or suggestions (e.g., "Should integrate with the existing Auth module").
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