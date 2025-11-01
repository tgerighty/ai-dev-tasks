# Creating Product Requirements Documents (PRDs) - Discovery-Driven Approach

**Version:** 2.0
**Last Updated:** 2025-10-31
**Previous Version:** Archived in `/archive/create-prd-v1.0-20251031.md`

## Goal
Guide AI assistants in helping users discover, articulate, and document what they really need to build through adaptive questioning and progressive refinement.

## Core Philosophy
- **Problem before solution** - Understand "why" before "what"
- **Discovery through dialogue** - Questions reveal hidden requirements
- **Progressive refinement** - Each answer shapes the next question
- **Right-sized documentation** - Match PRD complexity to feature complexity
- **Stories over specifications** - Concrete examples reveal true needs

## The Discovery Process

### Step 1: Initial Engagement

Start with an open-ended question to understand what brought them here:

```
"Tell me about what you're trying to build or improve. I'll help you create a clear requirements document."
```

Based on their response, follow one of these paths:

#### Path A: Clear Problem Statement
If they describe a specific problem:
```
"That's a clear problem. Let me understand it better:

1. Who experiences this problem most often?
2. Can you describe the last time this was an issue?
3. What's the current workaround, if any?
4. What would 'fixed' look like to you?"
```

#### Path B: Solution Without Problem
If they jump to a solution ("I need a dashboard with..."):
```
"I see you have a solution in mind. Help me understand the underlying need:

1. What can't you do today that this would enable?
2. Who asked for this, and what problem are they trying to solve?
3. What happens if we don't build this?
4. Is there a specific incident that triggered this request?"
```

#### Path C: Vague or Uncertain
If they're unsure or very high-level:
```
"Let's explore this together:

1. What made you think about this today?
2. Can you describe a recent situation where you wished something worked differently?
3. Who would benefit most from improving this area?
4. What's the biggest pain point in this process right now?"
```

### Step 2: Problem Discovery Deep-Dive

Once you understand the general area, dig deeper with targeted questions:

#### Understanding Impact
```
"Let's understand the impact:

How often does this problem occur?
□ Multiple times per day
□ Daily
□ Weekly
□ Monthly or less

Who is affected when this happens?
□ Individual users
□ Entire teams
□ Customers/clients
□ The whole organization

What's the cost of NOT fixing this?
□ Minor inconvenience
□ Significant time waste
□ Lost revenue
□ Risk of major failure"
```

#### Understanding Context
```
"Tell me about the current situation:

1. Walk me through what happens today, step by step
2. Which step is the most painful/error-prone?
3. What would you remove from this process if you could?
4. What absolutely must stay the same?"
```

### Step 3: Scope Discovery (Adaptive)

Based on the type of feature they're describing, choose the appropriate question set:

#### For User-Facing Features
```
"Let's define the user experience:

1. **User Journey** (in simple steps)
   - User arrives at [where?] because [why?]
   - User wants to [do what?]
   - User expects to see/get [what outcome?]
   - User knows it worked when [what happens?]

2. **The Happy Path**
   What does perfect look like? Describe the ideal flow.

3. **Common Pitfalls**
   What might users do wrong? What errors should we prevent?

4. **Success Metric**
   How will you know users are happy with this?"
```

#### For API/Backend Features
```
"Let's understand the technical requirements:

1. **Trigger and Input**
   - What initiates this process?
   - What data/parameters are required?
   - What format does it arrive in?

2. **Processing**
   - What transformations/calculations happen?
   - What external systems are involved?
   - What are the performance requirements?

3. **Output and Storage**
   - What gets returned to the caller?
   - What gets stored permanently?
   - Who else needs access to this data?"
```

#### For Internal Tools/Admin Features
```
"Let's map the workflow:

1. **Current Process**
   How is this done today? (even if manual/spreadsheet)

2. **Users and Frequency**
   - Who does this task?
   - How often?
   - How long does it take?

3. **Improvement Goals**
   - From [X minutes] to [Y minutes]?
   - Eliminate which manual steps?
   - Prevent which common errors?"
```

#### For Data/Analytics Features
```
"Let's understand the data needs:

1. **Key Questions**
   What questions are you trying to answer with this data?

2. **Current Gaps**
   What can't you see/measure today?

3. **Decision Impact**
   What decisions will this data drive?

4. **Freshness Requirements**
   How current does this data need to be?"
```

### Step 4: Requirement Prioritization

Help them focus on what matters most:

```
"Let's prioritize using the MoSCoW method:

Based on our discussion, here's what I'm hearing:

**Must Have** (deal-breakers - without these, don't build)
- [AI suggests 2-3 based on conversation]
- [User confirms/adjusts]

**Should Have** (important but could launch without)
- [AI suggests 2-3 based on patterns]
- [User confirms/adjusts]

**Could Have** (nice to have if time permits)
- [AI suggests 2-3 enhancements]
- [User confirms/adjusts]

**Won't Have** (explicitly out of scope for now)
- [AI suggests based on complexity]
- [User confirms/adjusts]

Is this right? What would you adjust?"
```

### Step 5: Reality Check Questions

Before moving forward, validate the scope:

```
"Quick reality check:

1. **The Bare Minimum Test**
   If we could only deliver ONE thing, what would it be?

2. **The Time-to-Value Test**
   What's the smallest version that would still be useful?

3. **The Dependency Test**
   Does this require any other work to be done first?

4. **The Resource Test**
   Do we have access to everything needed (data, APIs, designs)?"
```

### Step 6: Smart Risk Assessment (Contextual Only)

Only assess risks relevant to what they're building:

#### Automatic Risk Detection
AI should detect and flag without asking:
- Payment/financial data → **High Risk** (financial)
- Authentication/authorization → **High Risk** (security)
- Personal/user data → **High Risk** (privacy/compliance)
- Public/customer-facing → **Medium Risk** (reputation)
- Internal/admin only → **Low Risk** (contained impact)

#### Contextual Risk Questions (Only Ask If Relevant)

**If external users involved:**
```
"What happens if this feature completely fails?
□ Users are mildly inconvenienced
□ Users cannot complete important tasks
□ Users cannot use the product at all
□ We lose money or damage relationships"
```

**If data modifications detected:**
```
"If something goes wrong, can we undo the changes?
□ Yes, easily reversible
□ Yes, but requires effort
□ Partially reversible
□ No, changes are permanent"
```

**If external integrations detected:**
```
"What's our fallback if the external service is unavailable?
□ We can wait/retry
□ We have a manual workaround
□ We need an automated fallback
□ Everything breaks"
```

### Step 7: PRD Generation (Right-Sized)

Based on complexity, generate appropriate documentation:

#### Micro PRD (Complexity 1-2, <1 page)
```markdown
# [Feature Name] - Micro PRD

## Problem
[1-2 sentences on what problem this solves]

## Solution
[3-5 bullet points on the approach]

## Success Criteria
- [ ] [Specific measurable outcome]
- [ ] [User can accomplish X]

## Out of Scope
- [What we're explicitly NOT doing]
```

#### Standard PRD (Complexity 3-4, 2-3 pages)
```markdown
# [Feature Name] - Product Requirements Document

## Problem Statement
[Clear description of the problem and its impact]

## User Stories
- As a [user type], I want to [action] so that [benefit]
- As a [user type], I want to [action] so that [benefit]

## Functional Requirements
### Must Have
- [Requirement with acceptance criteria]
- [Requirement with acceptance criteria]

### Should Have
- [Requirement with acceptance criteria]

## Success Metrics
- [Measurable outcome with target]
- [Measurable outcome with target]

## Risks and Mitigations
- **Risk:** [Description] → **Mitigation:** [Approach]

## Out of Scope
- [Explicitly excluded items]
```

#### Full PRD (Complexity 5+, Complete Document)
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
### User Impact Assessment
[Frequency of use, affected users, user-facing impact analysis]

### Technical Complexity Assessment
[Algorithm complexity, dependencies, software maturity analysis]

### Risk Level Determination
[Risk levels for each major feature with justification]

### Risk Mitigation Strategies
[Specific mitigation strategies for identified risks]

## 7. Acceptance Criteria
[Specific criteria for feature completion]

## 8. Out of Scope
[Explicitly list what will NOT be included]

## 9. Testing Requirements (Risk-Based)
[Testing requirements based on risk levels]

## 10. Quality Gates and Evidence Collection
[Quality gates based on risk levels and required evidence]
```

## Adaptive Questioning Techniques

### For Different User Types

#### Non-Technical Users
- Use analogies: "Think of it like..."
- Avoid jargon: "users" not "end-users", "save" not "persist"
- Focus on outcomes: "What should happen when..."
- Draw from familiar experiences: "Like Amazon does with..."

#### Technical Users
- Dive into implementation details when relevant
- Discuss architectural implications
- Talk about performance and scale
- Reference technical patterns they'd know

#### Business Stakeholders
- Focus on value and ROI
- Discuss metrics and KPIs
- Address competitive advantages
- Consider market timing

### Discovery Techniques

#### The "5 Whys" Approach
```
User: "We need a notification system"
AI: "Why do you need notifications?"
User: "So users know when things happen"
AI: "Why do they need to know immediately?"
User: "Because they're waiting for approvals"
AI: "Why are they waiting?"
User: "Because approvals are slow"
AI: "Why are approvals slow?"
User: "Because approvers don't know they have pending items"
→ Real problem: Approval visibility, not just notifications
```

#### The "Day in the Life" Approach
```
"Walk me through a typical day:
- When does this problem usually come up?
- Who encounters it first?
- What do they try to do?
- Where do they get stuck?
- How do they work around it?"
```

#### The "Magic Wand" Approach
```
"If you had a magic wand and could make this perfect:
- What would disappear?
- What would be automatic?
- What would users never have to think about?
- What would just work?"
```

## Response Patterns for AI

### When Users Are Stuck
```
"I'm not sure what I need exactly..."

AI: "No problem! Let's start with what's bothering you. Tell me about the last time you thought 'I wish this was easier' or 'Why doesn't this just work?'"
```

### When Users Are Too Detailed
```
"I need a form with 47 fields and 12 validation rules and..."

AI: "I can see you've thought this through! Before we dive into all the details, help me understand: What job does this form do? Who fills it out and why?"
```

### When Users Give Solutions Without Context
```
"We need machine learning for this"

AI: "Interesting! What problem would machine learning solve that simpler approaches couldn't? What would success look like?"
```

## Quality Checklist for PRD Creation

Before finalizing the PRD, ensure:

### Problem Understanding
- [ ] The problem is clearly stated in user/business terms
- [ ] The impact of not solving it is understood
- [ ] The users affected are identified
- [ ] Success metrics are defined

### Solution Clarity
- [ ] Requirements are specific and testable
- [ ] Priorities are clear (must/should/could)
- [ ] Dependencies are identified
- [ ] Scope boundaries are explicit

### Risk Awareness
- [ ] Relevant risks are identified (not all possible risks)
- [ ] Mitigation strategies exist for high risks
- [ ] Rollback plan exists if applicable

### Completeness
- [ ] User stories cover main use cases
- [ ] Edge cases are considered
- [ ] Non-functional requirements addressed (if relevant)
- [ ] Out of scope items are listed

## Templates for Common Scenarios

### Quick Feature Addition
```
"I need to add [feature] to [existing system]"

Questions to ask:
1. Who's been asking for this?
2. What can't they do without it?
3. How are they managing today?
4. What's the minimum useful version?
```

### Bug That Needs Requirements
```
"Users are complaining about [issue]"

Questions to ask:
1. When did this start happening?
2. What exactly are users seeing vs expecting?
3. How many users are affected?
4. What's the workaround they're using?
5. What's the correct behavior?
```

### Performance Improvement
```
"[System] is too slow"

Questions to ask:
1. What specific operation is slow?
2. How long does it take vs expectations?
3. When did it become noticeably slow?
4. How many users/operations are affected?
5. What's acceptable performance?
```

### Integration Request
```
"We need to integrate with [external system]"

Questions to ask:
1. What data/functionality do we need from them?
2. What will we send to them?
3. How critical is this integration?
4. What happens if it's unavailable?
5. Who owns the relationship?
```

## Final Reminders for AI Agents

1. **Listen for emotions**: Frustration reveals pain points
2. **Watch for assumptions**: "Obviously..." means it's not obvious
3. **Seek specifics**: "Sometimes" → "How often exactly?"
4. **Validate understanding**: "Let me play this back..."
5. **Start simple**: Can always add complexity later
6. **Document decisions**: Why we're NOT doing something is valuable
7. **Get examples**: Stories are better than specifications
8. **Identify success**: How will they know it's working?

## File Naming Convention

Save PRDs in the `/tasks` directory using this format:
- Simple features: `PRD-[YYYY-MM-DD]-[feature-name].md`
- Complex features: `PRD-[number]-[feature-name].md`
- Bug fixes: `PRD-FIX-[issue-number]-[description].md`

Example:
- `PRD-2024-03-15-user-notifications.md`
- `PRD-0001-authentication-system.md`
- `PRD-FIX-1234-login-timeout.md`

## Integration with Workflow

This PRD creation step feeds directly into:
1. **Task Generation** (`generate-tasks.md`) - Creates detailed task list from PRD
2. **Risk Assessment** - Determines testing requirements and quality gates
3. **Implementation Planning** - Guides development approach and timeline

## Version History

- **v2.0 (2025-10-31):** Discovery-driven approach with adaptive questioning
- **v1.0 (Original):** Static question-based PRD creation with full risk assessment