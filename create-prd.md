# Rule: Creating Product Requirements Documents (PRDs) - Enhanced with "All Roads to Rome" Risk Assessment

## Goal
Guide an AI assistant in creating comprehensive Product Requirements Documents (PRDs) that clarify project requirements, scope, and constraints for development teams while incorporating cross-functional risk assessment using the "All Roads to Rome" methodology.

## Enhanced Process
1. **Receive Initial Prompt:** User provides a brief description of a new feature
2. **Initial Risk Screening:** Conduct preliminary risk assessment across all dimensions
3. **Ask Clarifying Questions:** Gather sufficient detail including risk-related information
4. **Schedule Risk Assessment Workshop:** Plan cross-functional risk assessment for major features
5. **Generate PRD:** Create PRD using enhanced structure with risk sections
6. **Save PRD:** Save as `[n]-prd-[feature-name].md` in the `/tasks` directory

## Documentation References
- **Enhanced Risk Assessment:** Use `docs/risk-assessment-framework.md` for comprehensive risk evaluation
- **Complexity Scoring:** Use `docs/complexity-rubric.md` for task sizing guidance
- **Testing Guidelines:** Reference `docs/testing-guidelines.md` for quality requirements
- **Task Generation:** Follow `generate-tasks.md` for risk-based task breakdown
- **Task Processing:** Use `process-task-list.md` for implementation guidance

## Enhanced PRD Requirements

### Risk Assessment Integration
Every PRD must include:
- **Initial Risk Screening:** Preliminary assessment of all major features
- **Cross-Functional Stakeholder Identification:** Required team members for risk workshops
- **Legal and Compliance Considerations:** Regulatory requirements and legal impact assessment
- **User Impact Analysis:** Frequency of use, affected users, user-facing impact
- **Technical Complexity Assessment:** Algorithm complexity, dependencies, software maturity

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

### Enhanced Risk Assessment Questions
For each major feature, assess across all "All Roads to Rome" dimensions:

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

### Cross-Functional Workshop Planning
For each major feature requiring risk assessment:
- **Required Participants:** Development Team, Product Management, Design/UX, Legal/Compliance, DevOps/Infrastructure
- **Workshop Duration:** 60 minutes
- **Deliverables:** Risk assessment summary, testing requirements, stakeholder approvals
- **Follow-up Actions:** Document assessment results in risk register

*Note: For detailed risk assessment methodology, see `docs/risk-assessment-framework.md`*

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

## 6. Risk Assessment ("All Roads to Rome" Approach)

### 6.1 Initial Risk Screening
[Preliminary risk assessment for all major features]

### 6.2 Cross-Functional Risk Workshop Planning
[Required participants, schedule, and deliverables]

### 6.3 User Impact Assessment
[Frequency of use, affected users, user-facing impact analysis]

### 6.4 Technical Complexity Assessment
[Algorithm complexity, dependencies, software maturity analysis]

### 6.5 Process Complexity Assessment
[Logical steps, process layers, integration points]

### 6.6 Data and Impact Assessment
[Data volume, expected defect rate assessment]

### 6.7 Legal and Compliance Assessment
[Regulatory requirements, legal impact, data privacy analysis]

### 6.8 Risk Level Determination
[Risk levels for each major feature with justification]

### 6.9 Risk Mitigation Strategies
[Specific mitigation strategies for identified risks]

## 7. Cross-Functional Stakeholder Requirements

### 7.1 Required Participants
[List of required stakeholders for risk assessment]

### 7.2 Approval Process
[Required sign-offs and approval workflow]

### 7.3 Communication Plan
[How risk assessment results will be communicated]

## 7. Acceptance Criteria
[Specific criteria for feature completion]

## 8. Out of Scope
[Explicitly list what will NOT be included]

## 9. Testing Requirements (Risk-Based)
[Testing requirements based on risk levels - see docs/testing-guidelines.md]

## 10. Quality Gates and Evidence Collection
[Quality gates based on risk levels and required evidence]
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
