# Rule: Generating a Product Requirements Document (PRD)

## Goal
Guide an AI assistant in creating a detailed PRD in Markdown format, based on an initial user prompt. The PRD should be clear, actionable, and suitable for implementation.

## Process
1. **Receive Initial Prompt:** User provides a brief description of a new feature
2. **Ask Clarifying Questions:** Gather sufficient detail to understand the "what" and "why"
3. **Generate PRD:** Create PRD using the structure outlined below
4. **Save PRD:** Save as `[n]-prd-[feature-name].md` in the `/tasks` directory

## Documentation References
- **Risk Assessment:** See `docs/risk-assessment-framework.md` for comprehensive risk evaluation
- **Complexity Scoring:** Use `docs/complexity-rubric.md` for task sizing guidance
- **Testing Guidelines:** Reference `docs/testing-guidelines.md` for quality requirements

## Clarifying Questions

### Standard Questions
- **Problem/Goal:** What problem does this feature solve or what's the main goal?
- **Target User:** Who is the primary user of this feature?
- **Core Functionality:** What key actions should users be able to perform?
- **User Stories:** Provide user stories (e.g., "As a [user], I want to [action] so that [benefit]")
- **Acceptance Criteria:** How will we know when this feature is successfully implemented?
- **Scope/Boundaries:** What should this feature NOT do (non-goals)?
- **Data Requirements:** What data does this feature need to display or manipulate?
- **Design/UI:** Are there existing design mockups or UI guidelines to follow?
- **Edge Cases:** What potential edge cases or error conditions should we consider?

### Risk Assessment (Quick Overview)
For each major feature, assess:
- **Frequency of Use:** How often will this be used? (1-5 scale)
- **Complexity:** How complex is the implementation? (1-5 scale)
- **Dependencies:** How many external dependencies? (1-5 scale)
- **User Impact:** What's the impact if this fails? (1-5 scale)

*Note: For detailed risk assessment, see `docs/risk-assessment-framework.md`*

## PRD Structure

```markdown
# [Feature Name] - Product Requirements Document

## 1. Introduction/Overview
[Brief description of the feature and its purpose]

## 2. Goals
[Primary objectives and success criteria]

## 3. User Stories
[List of user stories in format: As a [user], I want to [action] so that [benefit]]

## 4. Functional Requirements
[Detailed list of what the system must do]

## 5. Non-Functional Requirements
[Performance, security, accessibility requirements]

## 6. Risk Assessment
[High-level risk assessment using the framework from docs/risk-assessment-framework.md]

## 7. Acceptance Criteria
[Specific criteria for feature completion]

## 8. Out of Scope
[Explicitly list what will NOT be included]
```

## Usage Examples

### Simple Example
```
User: "I need a user login page"

AI: I'll help you create a PRD for the user login page. Let me ask some clarifying questions:

A. Problem/Goal: What problem does this login page solve?
1. Users can't access protected resources
2. Current login is confusing
3. Need to replace basic authentication
4. Other (please specify)

B. Target User: Who will use this login page?
1. General public users
2. Business/enterprise users
3. Internal team members
4. Multiple user types (please specify)
```

### Complex Example
```
User: "I need a comprehensive user authentication system with social login, MFA, and SSO"

AI: This is a complex feature that requires detailed planning. Let me gather comprehensive requirements:

A. Problem/Goal: What authentication problems are you solving?
1. Replace existing basic authentication
2. Support enterprise security requirements
3. Improve user experience with multiple options
4. Comply with security standards
5. Other (please specify)

B. Target User: Who needs authentication?
1. General public users
2. Business/enterprise users
3. Internal team members
4. Multiple user types (please specify)

C. Authentication Methods: Which methods do you need?
1. Email/password
2. Social login (Google, GitHub, etc.)
3. Multi-factor authentication
4. Single Sign-On (SSO)
5. All of the above

D. Risk Assessment:
For each authentication method, please rate:
- Frequency of Use (1-5): How often will users authenticate?
- Complexity (1-5): How complex is the implementation?
- Dependencies (1-5): How many external services?
- User Impact (1-5): What's the impact if authentication fails?

E. Security Requirements: What security level is needed?
1. Basic security (password hashing)
2. Enhanced security (rate limiting, session management)
3. Enterprise security (audit logs, compliance)
4. High-security (advanced encryption, monitoring)
```

## Best Practices

### Before Writing PRD
- Ensure you understand the core problem and user needs
- Identify all stakeholders and their requirements
- Consider technical constraints and limitations
- Think about edge cases and error scenarios

### During PRD Creation
- Use clear, concise language
- Include specific, measurable acceptance criteria
- Consider both functional and non-functional requirements
- Document assumptions and constraints

### After PRD Creation
- Review with stakeholders for validation
- Ensure risk assessment is complete
- Verify that requirements are testable
- Get approval before proceeding to task generation

## File Naming Convention

Save PRDs in the `/tasks` directory using this format:
- `0001-prd-[feature-name].md`
- `0002-prd-[feature-name].md`
- etc. (zero-padded 4-digit sequence)

## Integration with Workflow

This PRD creation step feeds directly into:
1. **Task Generation** (`generate-tasks.md`) - Creates detailed task list from PRD
2. **Risk Assessment** - Determines testing requirements and quality gates
3. **Implementation Planning** - Guides development approach and timeline

## Quality Checklist

Before saving the PRD, ensure:
- [ ] All clarifying questions have been asked and answered
- [ ] User stories are clear and actionable
- [ ] Acceptance criteria are specific and measurable
- [ ] Risk assessment is complete
- [ ] Scope and boundaries are clearly defined
- [ ] File follows naming convention
- [ ] PRD is saved in `/tasks` directory
