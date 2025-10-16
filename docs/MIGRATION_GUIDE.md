# Migration Guide: Enhanced AI Dev Tasks Workflow with Risk Assessment

## Overview

This guide helps you migrate existing PRDs to the enhanced ai-dev-tasks workflow that includes user stories, complexity assessment, risk-based testing, and the "All Roads to Rome" cross-functional risk assessment methodology.

## When to Use This Guide

Use this migration guide when:
- You have existing PRDs without user stories
- You want to adopt the enhanced workflow with complexity assessment and risk-based testing
- You need to process legacy PRDs with the new system
- You want to implement the "All Roads to Rome" risk assessment approach
- You need to set up cross-functional risk workshops for complex features

## Migration Process

### Step 1: Analyze Existing PRD

1. **Check for User Stories Section**
   - Look for a "User Stories" section in the PRD
   - If present, you can use the enhanced workflow directly
   - If missing, proceed with migration steps

2. **Identify Content Type**
   - **Functional Requirements:** Convert to user stories
   - **Goals/Objectives:** Derive user stories from goals
   - **Mixed Content:** Extract user stories where possible, create fallbacks for gaps

### Step 2: Convert Functional Requirements to User Stories

**Direct Conversion Method:**

For each functional requirement like:
> "1. The system must allow users to upload profile pictures"

Convert to user story:
> **US-001:** As a user, I want to upload a profile picture so that other users can recognize me.

**Advanced Conversion Method:**

For complex requirements like:
> "3. The system shall provide real-time notifications for important updates"

Break down into multiple user stories:
> **US-003:** As a user, I want to receive real-time notifications so that I stay informed of important updates.
> **US-004:** As a user, I want to customize notification preferences so that I only receive relevant alerts.
> **US-005:** As a user, I want to view notification history so that I can catch up on missed information.

### Step 3: Handle Missing Information

**When User Actions Are Unclear:**
1. **Infer from Context:** Look at the feature description for implied user actions
2. **Use Common Patterns:** Apply standard user story patterns for common features
3. **Document Assumptions:** Clearly state any assumptions made

**Example:**
*Original Requirement:* "Improve system performance"
*Converted User Story:* "As a user, I want faster page load times so that I can complete my tasks more efficiently."
*Assumption:* Performance improvement focuses on page load speed for task completion

### Step 4: Create Fallback User Stories

**When Requirements Are Too Vague:**

Use the fallback template and document the feature type:

```markdown
US-FB-001: As a user, I want to access the [feature name] so that I can [primary benefit].
```

**Examples:**
- *Feature:* "Dashboard analytics" → *Benefit:* "track key metrics"
- *Feature:* "File management" → *Benefit:* "organize my documents"
- *Feature:* "Search functionality" → *Benefit:* "find information quickly"

### Step 5: Validate User Stories

**Quality Checklist for Each Generated Story:**
- [ ] **Format:** Follows "As a [user], I want [action] so that [benefit]" structure
- [ ] **Specific:** User role is clearly identifiable
- [ ] **Actionable:** Describes a specific capability
- [ ] **Beneficial:** Benefit is user-focused and measurable
- [ ] **Bounded:** Scope is reasonable for implementation

**Validation Examples:**

**✅ Valid:**
- As a content creator, I want to schedule posts for future publication so that I can maintain consistent content delivery.

**❌ Needs Revision:**
- As a user, I want to improve the system so that it works better.
  → *Revision:* As a user, I want faster page load times so that I can complete tasks more efficiently.

### Step 6: Update the PRD

1. **Add User Stories Section**
   ```markdown
   ## User Stories
   
   - **US-001:** As a user, I want to upload profile pictures so that others can recognize me.
   - **US-002:** As a user, I want to customize my profile settings so that I can personalize my experience.
   ```

2. **Document Migration Changes**
   ```markdown
   ## Migration Notes
   
   This PRD was migrated to the enhanced workflow on [date].
   - User stories were derived from functional requirements
   - Original requirements preserved in Functional Requirements section
   - Assumptions documented where user intent was inferred
   ```

3. **Preserve Original Content**
   - Keep all original sections (Goals, Functional Requirements, etc.)
   - Add migration notes explaining the conversion process
   - Maintain original requirement numbering for reference

## Common Migration Scenarios

### Scenario 1: PRD with Clear Functional Requirements

**Original Content:**
```markdown
## Functional Requirements
1. Users must be able to create accounts
2. Users must be able to log in with email/password
3. Users must be able to reset forgotten passwords
```

**Migrated User Stories:**
```markdown
## User Stories
- **US-001:** As a new user, I want to create an account so that I can access the system.
- **US-002:** As a registered user, I want to log in with my email and password so that I can access my account securely.
- **US-003:** As a user, I want to reset my forgotten password so that I can regain access to my account.
```

### Scenario 2: PRD with Goals but No Requirements

**Original Content:**
```markdown
## Goals
1. Improve user engagement through better communication
2. Reduce support ticket volume through self-service options
```

**Migrated User Stories:**
```markdown
## User Stories
- **US-001:** As a user, I want to access a help center so that I can find answers to common questions.
- **US-002:** As a user, I want to contact support through in-app messaging so that I can get help when needed.
- **US-003:** As a user, I want to track my support requests so that I can monitor issue resolution.
```

### Scenario 3: PRD with Mixed/Incomplete Content

**Original Content:**
```markdown
## Goals
1. Enhance user experience
## Notes
- Need to implement search functionality
- Performance improvements required
```

**Migrated User Stories:**
```markdown
## User Stories
- **US-001:** As a user, I want to search for content so that I can find information quickly.
- **US-FB-002:** As a user, I want to experience faster page loads so that I can complete tasks efficiently.

## Migration Notes
- User story US-FB-002 created from performance enhancement goal
- Original content was limited, assumptions documented in migration
```

## Risk Assessment Integration

### Step 7: Add Risk Assessment Section

For the enhanced workflow, add a comprehensive risk assessment section:

```markdown
## Risk Assessment ("All Roads to Rome" Approach)

### 7.1 Initial Risk Screening
[Conduct preliminary risk assessment for all major features]

### 7.2 Cross-Functional Risk Workshop Planning
[Required participants, schedule, and deliverables]

### 7.3 User Impact Assessment
[Frequency of use, affected users, user-facing impact analysis]

### 7.4 Technical Complexity Assessment
[Algorithm complexity, dependencies, software maturity analysis]

### 7.5 Process Complexity Assessment
[Logical steps, process layers, integration points]

### 7.6 Data and Impact Assessment
[Data volume, expected defect rate assessment]

### 7.7 Legal and Compliance Assessment
[Regulatory requirements, legal impact, data privacy analysis]

### 7.8 Risk Level Determination
[Risk levels for each major feature with justification]

### 7.9 Risk Mitigation Strategies
[Specific mitigation strategies for identified risks]
```

### Step 8: Risk Assessment Questions Integration

Add enhanced risk assessment questions to your PRD:

**User Impact Assessment:**
- Frequency of Use: Seldom/Frequent/Very Frequent
- Affected Users: Less (<100)/More (100-1000)/Many (>1000)
- User-Facing Impact: UI Only/Process Changes/Data Changes

**Technical Complexity Assessment:**
- Algorithm Complexity: Simple/Complex/Very Complex
- Dependencies: None/Internal Only/Internal + External
- Software Maturity: High/Recent/Medium/Low/Old
- Screens/Entities Affected: <2/2-4/>4

**Process Complexity Assessment:**
- Logical Steps: <2/2-3/>3
- Process Layers: UI Only/Calculation-Validation/Data Change
- Integration Points: Few/Moderate/Many

**Data and Impact Assessment:**
- Data Volume: Low/Medium/High
- Expected Defect Rate: Less/Moderate/Many

**Legal and Compliance Assessment:**
- Regulatory Requirements: None/Basic/Complex
- Legal Impact of Failure: Minimal/Moderate/High
- Data Privacy Impact: Low/Medium/High

## Validation and Testing

### Test the Migrated PRD

1. **Run Enhanced Task Generation**
   ```bash
   # Use the enhanced workflow with your migrated PRD
   # The AI should now recognize user stories and generate risk-based tasks
   ```

2. **Review Generated Tasks**
   - Verify tasks map correctly to user stories
   - Check complexity ratings seem reasonable
   - Ensure complex tasks are properly broken down
   - Validate risk levels are assigned correctly
   - Confirm testing requirements match risk levels

3. **Conduct Risk Assessment Workshop**
   - Schedule cross-functional workshop for major features
   - Invite required participants: Development Team, Product Management, Design/UX, Legal/Compliance, DevOps/Infrastructure
   - Use the 60-minute workshop agenda from the enhanced workflow
   - Document risk assessment results with rationale

4. **Adjust as Needed**
   - Refine user stories if tasks don't align
   - Add missing user stories for gaps
   - Adjust complexity assessment if needed
   - Update risk levels based on workshop results

## Best Practices

### Do's
- ✅ Document all assumptions made during migration
- ✅ Preserve original PRD content
- ✅ Add migration notes explaining changes
- ✅ Validate generated user stories against quality criteria
- ✅ Test the complete workflow after migration

### Don'ts
- ❌ Delete or significantly modify original content
- ❌ Create user stories that are too broad or vague
- ❌ Assume user intent without evidence from requirements
- ❌ Skip validation steps to save time

## Troubleshooting

### Common Issues and Solutions

**Issue:** Generated tasks don't match user stories
- **Solution:** Review user story clarity and specificity
- **Solution:** Ensure user stories are well-defined and actionable

**Issue:** Complexity ratings seem incorrect
- **Solution:** Use the concrete assessment criteria in `docs/complexity-rubric.md`
- **Solution:** Adjust based on specific implementation details
- **Solution:** Consider cross-functional team input during risk workshop

**Issue:** Too few or too many user stories
- **Solution:** Break down broad stories or combine related simple ones
- **Solution:** Aim for 3-7 user stories per feature, depending on scope

**Issue:** Original requirements are lost in migration
- **Solution:** Always preserve original Functional Requirements section
- **Solution:** Add cross-references between user stories and original requirements

**Issue:** Risk assessment seems overwhelming
- **Solution:** Start with initial risk screening before conducting full workshop
- **Solution:** Use the visual decision tree from the risk assessment framework
- **Solution:** Focus on highest-risk items first for maximum impact

**Issue:** Cross-functional workshop scheduling is difficult
- **Solution:** Use the 60-minute structured agenda for efficiency
- **Solution:** Start with most critical features first
- **Solution:** Document partial assessments and complete iteratively

## Support

If you encounter issues during migration:
1. Check this guide for specific scenarios
2. Review the enhanced workflow documentation
3. Validate against the user story quality criteria
4. Consider the complexity assessment guidelines from `docs/complexity-rubric.md`
5. Use the risk assessment framework in `docs/risk-assessment-framework.md`
6. Reference testing guidelines in `docs/testing-guidelines.md`
7. Consider scheduling a cross-functional workshop for complex features

## Enhanced Migration Checklist

Before completing migration, verify:
- [ ] All user stories follow the standard format
- [ ] Original PRD content is preserved
- [ ] Migration notes are documented
- [ ] User stories are specific and actionable
- [ ] Benefits are user-focused and measurable
- [ ] Story scope is appropriately bounded
- [ ] Generated tasks align with user stories
- [ ] Complexity assessments use concrete criteria
- [ ] Risk assessment section is added with "All Roads to Rome" approach
- [ ] Cross-functional stakeholders are identified
- [ ] Legal and compliance considerations are documented
- [ ] Risk assessment questions are answered for each major feature
- [ ] Testing requirements are specified based on risk levels

After completing migration:
- [ ] Test the complete enhanced workflow
- [ ] Validate task breakdown automation with risk assessment
- [ ] Review complexity ratings for consistency
- [ ] Conduct cross-functional risk workshops for complex features
- [ ] Validate risk-based testing requirements
- [ ] Update team on new workflow if needed
- [ ] Archive original process documentation
- [ ] Document migration lessons learned for future improvements
