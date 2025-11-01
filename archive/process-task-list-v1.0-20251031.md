# Rule: Processing Task Lists with Risk-Based Implementation

## Goal
Guide an AI assistant in systematically implementing tasks from a generated task list, with comprehensive risk-based protocols, evidence collection, and progress tracking.

## Process Overview
1. **Load Task List:** Read and analyze the task list structure
2. **Load Context Document:** Review context.md for design decisions, patterns, and instructions
3. **Assess Risk:** Determine highest risk level and setup appropriate protocols
4. **Implement Sequentially:** Execute one task at a time with micro-task grinding
5. **Test Thoroughly:** Apply risk-based testing requirements within micro-tasks
6. **Collect Evidence:** Gather required testing evidence from all micro-tasks
7. **Update Context:** Document new design decisions and implementation insights
8. **Track Progress:** Update task completion status and seek user confirmation

**NEW: Micro-Task Grinding Approach**
- **Grind Through:** Complete ALL micro-task work (breakdown, delegation, testing, validation) before user interaction
- **Batch Processing:** Split → Execute → Test → Validate → THEN ask for confirmation
- **mark as done:** mark in task list as done once validated test passes
- **No Interruptions:** Only stop to ask user after full micro-task completion and testing

## Documentation References
- **Risk Assessment Framework:** Use `docs/risk-assessment-framework.md` for detailed protocols
- **Testing Guidelines:** Follow `docs/testing-guidelines.md` for quality-over-quantity, risk-proportional testing
- **Complexity Rubric:** Reference `docs/complexity-rubric.md` for task understanding
- **Workflow Examples:** See `examples/workflow-integration-example.md` for complete implementation

## Risk-Based Implementation Protocols

### Quick Risk Assessment
Before starting implementation, determine:
- **Highest Risk Level:** Critical, High, Medium, or Low
- **Testing Requirements:** Based on risk level (see docs/testing-guidelines.md)
- **Evidence Collection:** Required evidence types for audit
- **Quality Gates:** Validation checkpoints for completion

### Sequential Implementation Process (Updated - Micro-Task Grinding)
```
Start Task → Break into Micro-Tasks → Delegate tdroids/agents → Execute in Parallel/Sequence → Integrate Results → Test End-to-End → Validate Quality Gates → Collect Evidence → Present to User for Confirmation → Commit → Next Task
```

**Key Rules:**
- **One task at a time:** Complete current task before moving to next
- **Micro-task grinding:** Complete ALL micro-task work before user interaction
- **No interruptions during micro-task execution:** Continuous workflow through breakdown, delegation, testing, validation
- **Batch confirmation:** Only ask user approval after complete micro-task implementation and testing
- **Risk-aware testing:** Apply appropriate testing protocols within micro-task delegation
- **Evidence collection:** Generate and archive all required evidence from all tools
- **Quality gates:** Validate all requirements before presenting to user

## Task Implementation Workflow

### 1. Pre-Implementation Setup
```bash
# Load task list
TASK_FILE="tasks-[n]-[feature-description].md"

# Load context document for design guidance
CONTEXT_FILE="context-[n]-[feature-description].md"

# Validate task list structure
node scripts/validate-task-list.js "$TASK_FILE"

# Load context for design patterns and decisions
if [ -f "$CONTEXT_FILE" ]; then
  echo "Loading context from: $CONTEXT_FILE"
  # Parse context for key design decisions, patterns, and implementation rules
  DESIGN_DECISIONS=$(node scripts/extract-context-decisions.js "$CONTEXT_FILE")
  IMPLEMENTATION_PATTERNS=$(node scripts/extract-patterns.js "$CONTEXT_FILE")
fi

# Assess risk levels
RISK_ANALYSIS=$(node scripts/analyze-risk-levels.js "$TASK_FILE")
HIGHEST_RISK=$(echo "$RISK_ANALYSIS" | jq -r '.highest_risk')
echo "Highest risk level: $HIGHEST_RISK"
```

### 2. Implementation Process (Updated - Micro-Task Grinding)
For each task/subtask:

**GRIND THROUGH APPROACH (Updated - Individual Micro-Task Quality Gates):**
1. **Break down subtask into micro-tasks** (Complexity 1-2)
2. **Match micro-tasks to appropriate droid/agent** based on capabilities
3. **Execute micro-tasks with individual quality gates**:
   - Execute micro-task
   - Test micro-task individually
   - Validate micro-task quality gate
   - Collect micro-task evidence
   - Mark micro-task complete only when passing
4. **Integrate results automatically** as micro-tasks complete and pass validation
5. **Run end-to-end integration testing** after all micro-tasks complete
6. **Validate overall quality gates** automatically
7. **Collect comprehensive evidence package** from all micro-tasks
8. **Present complete results to user** for confirmation/commit decision

#### A. Universal Micro-Task Delegation (All Complexity Levels 1-4)

**Core Principle:** Every subtask (complexity 1, 2, 3, AND 4) must be broken down into micro-tasks of complexity 1-2 during execution. ALL micro-tasks are delegated to appropriate tools based on capability matching.

**Process Flow:**
```
Load Subtask (Complexity 1-4) → Inventory Available droids or Agents → Break Subtask into Micro-Tasks (Complexity 1-2) → Match Micro-Tasks to droid or Agent Capabilities → Delegate All Micro-Tasks → Integration & Validation → Evidence Collection → Complete Subtask
```

**droid or Agent Discovery and Matching Process:**

1. **droid or Agent Inventory:** List all available coding droids or agents and document their specialized capabilities
2. **Capability Assessment:** Document each droid or agent's expertise areas and complexity handling abilities
3. **Micro-Task Matching:** Map micro-task types to appropriate droids or agents based on capabilities
4. **Validation:** Ensure selected droids or agents can handle assigned complexity levels

**Standard Micro-Task Types (droid or Agent-Agnostic):**

| Category | Micro-Task | Complexity | Required droid or Agent Capability |
|----------|------------|------------|--------------------------|
| **Foundation** | Create interfaces/types | 1 | Strong typing support |
| | Design component structure | 1 | UI framework expertise |
| | Set up configuration | 1 | Environment management |
| **Implementation** | Implement core logic | 2 | Domain-specific knowledge |
| | Create API endpoints | 2 | API development expertise |
| | Build database operations | 2 | Data persistence knowledge |
| **Quality** | Add error handling | 1 | Code quality patterns |
| | Write unit tests | 2 | Test automation knowledge |
| | Create integration tests | 2 | Testing framework expertise |
| **Review** | Code review | 1 | Code analysis capabilities |
| | Security analysis | 1 | Security assessment skills |
| | Performance analysis | 1 | Optimization expertise |
| **Documentation** | Update documentation | 1 | Technical writing capabilities |

**Micro-Task Breakdown by Subtask Complexity:**

**Complexity 1 Subtask → 1-2 Micro-tasks**
```
Subtask: "Create user interface" (Complexity: 1)
├── 1.1 Create component structure → [droid or Agent with UI framework expertise]
└── 1.2 Add type definitions → [droid or Agent with strong typing capabilities]
```

**Complexity 2 Subtask → 2-4 Micro-tasks**
```
Subtask: "Implement form validation" (Complexity: 2)
├── 2.1 Create validation rules → [droid or Agent with validation expertise]
├── 2.2 Implement validation logic → [droid or Agent with form handling expertise]
├── 2.3 Add error handling → [droid or Agent with error handling patterns]
└── 2.4 Write tests → [droid or Agent with testing framework knowledge]
```

**Complexity 3 Subtask → 3-6 Micro-tasks**
```
Subtask: "Add authentication service" (Complexity: 3)
├── 3.1 Create auth interfaces → [droid or Agent with type system expertise]
├── 3.2 Implement auth logic → [droid or Agent with security/backend expertise]
├── 3.3 Add middleware → [droid or Agent with middleware expertise]
├── 3.4 Write tests → [droid or Agent with testing capabilities]
├── 3.5 Security review → [droid or Agent with security analysis capabilities]
└── 3.6 Update documentation → [droid or Agent with documentation generation]
```

**Complexity 4 Subtask → 4-8 Micro-tasks**
```
Subtask: "Implement OAuth2 integration" (Complexity: 4)
├── 4.1 Design OAuth2 interfaces → [droid or Agent with type system expertise]
├── 4.2 Create configuration → [droid or Agent with configuration expertise]
├── 4.3 Implement provider 1 → [droid or Agent with OAuth expertise]
├── 4.4 Implement provider 2 → [droid or Agent with OAuth expertise]
├── 4.5 Create token management → [droid or Agent with security expertise]
├── 4.6 Write comprehensive tests → [droid or Agent with testing expertise]
├── 4.7 Security review → [droid or Agent with security analysis]
└── 4.8 Update documentation → [droid or Agent with documentation capabilities]
```

**Delegation Execution Protocol (Updated - Individual Micro-Task Quality Gates):**

1. **Pre-Execution Context Review:** Each droid or agent MUST review context.md before making any code changes:
   - **Load context document** → **Review design decisions** → **Check implementation patterns** → **Verify requirements** → **Begin execution**
   - **Critical Design Validation:** Ensure understanding of architecture decisions, API patterns, security requirements, and coding standards
   - **Pattern Compliance:** Verify that all changes follow established patterns from context document
   - **Constraint Awareness:** Review all constraints, dependencies, and integration requirements

2. **Continuous Execution with Quality Gates:** Launch droids or agents and continue processing without user interruption
3. **Individual Micro-Task Validation:** Each micro-task must pass its own quality gate before completion:
   - **Context-Compliant Execution** → **Execute micro-task** → **Test micro-task** → **Validate quality gate** → **Collect evidence** → **Mark complete**
   - **Design Consistency Check:** Ensure implementation aligns with documented design decisions
   - **Pattern Adherence Validation:** Verify compliance with established implementation patterns
4. **Parallel Execution:** Launch multiple droids or agents simultaneously when micro-tasks are independent
5. **Sequential Execution:** Wait for completion and validation of dependent micro-tasks before launching next droids or agents
6. **Hybrid Execution:** Mix of parallel and sequential based on dependency analysis
7. **Automated Integration:** Continuously integrate results as micro-tasks complete and pass validation

**Context Review Requirements for All Micro-Tasks:**

**Before Any Code Changes:**
- [ ] **Load context.md** and review all relevant sections
- [ ] **Architecture Understanding:** Verify comprehension of system architecture and component relationships
- [ ] **Design Decision Review:** Understand the rationale behind key design choices
- [ ] **Pattern Recognition:** Identify and understand implementation patterns to follow
- [ ] **Constraint Awareness:** Review all technical, business, and security constraints
- [ ] **Integration Point Mapping:** Identify all integration points and their requirements
- [ ] **Security Requirements:** Understand all security patterns and requirements

**During Implementation:**
- [ ] **Design Consistency:** Ensure all changes align with documented decisions
- [ ] **Pattern Compliance:** Follow established patterns consistently
- [ ] **Constraint Adherence:** Respect all documented constraints
- [ ] **Integration Compatibility:** Ensure compatibility with existing integrations
- [ ] **Security Compliance:** Implement security measures as documented

**After Implementation:**
- [ ] **Design Validation:** Verify implementation matches design decisions
- [ ] **Pattern Validation:** Confirm patterns were correctly applied
- [ ] **Context Updates:** Document any new design decisions or patterns discovered

**Expected Execution Times (Uninterrupted with Individual Quality Gates):**
- **Complexity 1:** 5-10 minutes (1-2 micro-tasks, 1-2 droids or agents) - GRIND THROUGH with individual quality gates
- **Complexity 2:** 15-20 minutes (2-4 micro-tasks, 2-3 droids or agents) - GRIND THROUGH with individual quality gates
- **Complexity 3:** 30-45 minutes (3-6 micro-tasks, 4-5 droids or agents) - GRIND THROUGH with individual quality gates
- **Complexity 4:** 60-90 minutes (4-8 micro-tasks, 5-6 droids or agents) - GRIND THROUGH with individual quality gates

**Note:** Individual micro-task quality gates add ~2-5 minutes per micro-task for testing and validation

**Automated Integration and Quality Assurance (Updated - Individual Micro-Task Validation):**

**For Each Micro-Task (Must Pass Before Moving to Next):**
- [ ] Execute micro-task with delegated droid or agent
- [ ] Run micro-task specific tests (unit/integration based on micro-task type)
- [ ] Validate micro-task quality gate (based on micro-task complexity and type)
- [ ] Collect micro-task evidence (test results, coverage, performance if applicable)
- [ ] Mark micro-task as complete only when all validations pass
- [ ] Log micro-task completion status and evidence

**After All Micro-Tasks Complete:**
- [ ] Validate compatibility between all micro-task outputs
- [ ] Run end-to-end integration testing across all micro-tasks
- [ ] Apply overall risk-based testing protocols (maintain original risk level requirements)
- [ ] Aggregate evidence from all micro-tasks into comprehensive package
- [ ] Validate overall quality gates for complete subtask
- [ ] Prepare complete implementation summary for user

**Micro-Task Quality Gates (Each Micro-Task Must Pass):**

**Complexity 1 Micro-Task Quality Gate:**
- [ ] Micro-task executed successfully by delegated droid or agent
- [ ] Basic functionality test passes
- [ ] Code quality check passes
- [ ] Documentation updated (if required)
- [ ] Evidence collected and logged

**Complexity 2 Micro-Task Quality Gate:**
- [ ] Micro-task executed successfully by delegated droid or agent
- [ ] Unit tests pass (80%+ coverage for micro-task)
- [ ] Integration test with related components passes
- [ ] Code quality and security check passes
- [ ] Performance validation (if applicable)
- [ ] Documentation updated
- [ ] Evidence collected and logged

**Subtask Completion Validation (Before User Interaction):**

Before presenting to user, ensure ALL of the following are COMPLETE:
- [ ] All micro-tasks completed and passed their individual quality gates
- [ ] Integration testing passed with no conflicts between micro-task outputs
- [ ] End-to-end functionality testing completed and passing
- [ ] Risk-based testing requirements fully met (based on original subtask risk level)
- [ ] All evidence collected from all micro-tasks and specialized tools
- [ ] Documentation updated automatically across all micro-tasks
- [ ] Overall quality gates validated automatically
- [ ] Ready for user review and confirmation

#### B. Code Implementation
- Write code following established patterns
- Implement functionality according to requirements
- Follow coding standards and best practices
- Ensure code is testable and maintainable

#### B. Testing Implementation
Based on risk level, implement appropriate tests:

**Critical Risk (Testing-as-Code):**
```typescript
// Write tests alongside code
describe('AuthService', () => {
  it('should authenticate valid credentials', async () => {
    // Test implementation
  });
  
  it('should handle security edge cases', async () => {
    // Security tests
  });
  
  it('should meet performance requirements', async () => {
    // Performance tests
  });
});
```

**High Risk:**
- Unit tests (90%+ coverage)
- Integration tests
- E2E tests
- Performance tests

**Medium Risk:**
- Unit tests (80%+ coverage)
- Integration tests

**Low Risk:**
- Unit tests (70%+ coverage)

#### C. Evidence Collection
Generate required evidence based on risk level:

**Critical Risk Evidence:**
- Test reports (unit, integration, E2E, security, performance, accessibility)
- Coverage reports (95%+)
- Security audit results
- Performance benchmarks
- Accessibility compliance reports

**High Risk Evidence:**
- Test reports (unit, integration, E2E, performance)
- Coverage reports (90%+)
- Performance benchmarks

**Medium Risk Evidence:**
- Test reports (unit, integration)
- Coverage reports (80%+)

**Low Risk Evidence:**
- Test reports (unit)
- Coverage reports (70%+)

### 3. Quality Gate Validation
Before marking task complete, validate:

**Universal Quality Gates (All Risk Levels with Micro-Task Delegation):**
- [ ] All micro-tasks completed successfully by delegated droids or agents
- [ ] Integration testing passed with no conflicts between droid or agent outputs
- [ ] Risk-based testing requirements met (maintain original risk level protocols)
- [ ] Evidence package complete from all specialized droids or agents
- [ ] Documentation updated and validated

**Critical Risk Quality Gates:**
- [ ] Universal quality gates validated
- [ ] All tests passing (95%+ coverage)
- [ ] Security audit passed
- [ ] Performance benchmarks met
- [ ] Accessibility audit passed
- [ ] All required reviews completed
- [ ] Evidence collected and archived
- [ ] Documentation updated
- [ ] Stakeholder sign-offs obtained

**High Risk Quality Gates:**
- [ ] Universal quality gates validated
- [ ] All tests passing (90%+ coverage)
- [ ] Performance benchmarks met
- [ ] Required reviews completed
- [ ] Evidence collected and validated
- [ ] Documentation updated
- [ ] Stakeholder approvals obtained

**Medium Risk Quality Gates:**
- [ ] Universal quality gates validated
- [ ] All tests passing (80%+ coverage)
- [ ] Code review completed
- [ ] Evidence collected and validated
- [ ] Documentation updated

**Low Risk Quality Gates:**
- [ ] Universal quality gates validated
- [ ] All tests passing (70%+ coverage)
- [ ] Basic validation completed
- [ ] Evidence collected
- [ ] Documentation updated

### 4. Git Workflow
```bash
# Commit with risk-based template
git add .
git commit -m "feat: [TASK-TITLE] - [RISK LEVEL] Implementation

- Implementation details
- Risk Level: [Critical/High/Medium/Low] ([Score]/5.0)
- Testing: [Testing types and coverage]
- Evidence: [Evidence collected]
- Quality Gates: [Validation status]

Related: [PRD-Reference] | Task-[Task-Number]"
```

## Testing Protocols by Risk Level

### Critical Risk Testing Protocol
```bash
# Complete testing suite
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":95,"functions":95,"lines":95,"statements":95}}'
npm run test:integration
npm run test:e2e
npm run test:security
npm run test:performance
npm run test:a11y

# Collect evidence
mkdir -p evidence/$(date +%Y%m%d_%H%M%S)
cp coverage/ coverage.json evidence/$(date +%Y%m%d_%H%M%S)/
cp test-results/ evidence/$(date +%Y%m%d_%H%M%S)/
cp security-audit.json evidence/$(date +%Y%m%d_%H%M%S)/
```

### High Risk Testing Protocol
```bash
# Comprehensive testing
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":90,"functions":90,"lines":90,"statements":90}}'
npm run test:integration
npm run test:e2e
npm run test:performance

# Collect evidence
mkdir -p evidence/$(date +%Y%m%d_%H%M%S)
cp coverage/ coverage.json evidence/$(date +%Y%m%d_%H%M%S)/
cp test-results/ evidence/$(date +%Y%m%d_%H%M%S)/
```

### Medium Risk Testing Protocol
```bash
# Standard testing
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":80,"functions":80,"lines":80,"statements":80}}'
npm run test:integration

# Collect evidence
mkdir -p evidence/$(date +%Y%m%d_%H%M%S)
cp coverage/ coverage.json evidence/$(date +%Y%m%d_%H%M%S)/
```

### Low Risk Testing Protocol
```bash
# Basic testing
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":70,"functions":70,"lines":70,"statements":70}}'

# Collect evidence
mkdir -p evidence/$(date +%Y%m%d_%H%M%S)
cp coverage/ coverage.json evidence/$(date +%Y%m%d_%H%M%S)/
```

## Progress Tracking

### Task Completion Tracking
Update task list as tasks are completed:
```markdown
- [x] [Task Number] [Task Title] - **Completed:** [Date]
  - [x] [Subtask Number] [Subtask Title] - **Evidence:** [path/to/evidence]
  - [x] [Subtask Number] [Subtask Title] - **Evidence:** [path/to/evidence]
```

### Risk-Based Progress Metrics
Track progress by risk level:
```markdown
## Progress by Risk Level

### Critical Risk Tasks
- **Total:** [X]
- **Completed:** [Y]/[X] ([Z]%)
- **In Progress:** [A]
- **Testing Progress:** [0-100%]

### High Risk Tasks
- **Total:** [X]
- **Completed:** [Y]/[X] ([Z]%)
- **In Progress:** [A]
- **Testing Progress:** [0-100%]
```

## Error Handling and Recovery

### Common Issues
**Test Failures:**
```bash
# Debug test failures
npm run test:debug -- --testNamePattern="[failing-test]"
npm run test:verbose -- --testNamePattern="[failing-test]"
```

**Coverage Issues:**
```bash
# Analyze coverage gaps
npm run test:coverage -- --coverageReporters=text-lcov
```

**Performance Issues:**
```bash
# Profile performance
npm run test:performance -- --profile
```

### Recovery Procedures
**Partial Failure Recovery:**
```bash
# Save current state
git add .
git commit -m "wip: partial implementation - checkpoint"

# Reset and retry
git reset --hard HEAD~1
```

## Usage Examples

### Enhanced Implementation Process - "All Roads to Rome"

#### Pre-Implementation Risk Workshop
```
AI: I'll help you implement the user authentication system following enhanced risk-based protocols.

## Risk Assessment Summary - "All Roads to Rome" Approach
- **Highest Risk Level:** Critical (4.7/5.0)
- **Risk Path:** Very Frequent + Many Users + Complex Algorithm + Data Changes
- **Testing Environment:** Configured for Critical Risk protocols
- **Legal Review Required:** Yes (data privacy regulations)
- **Git Branch:** feature/0001-prd-user-authentication
- **Stakeholder Workshop:** Completed - Development, Product, Legal, DevOps teams participated

## Starting Task 1.0: Authentication Core Engine

**Risk Level:** Critical (4.7/5.0) - Red Path
**Risk Path Characteristics:**
- Very Frequent use + Many users affected
- Complex algorithm + External dependencies  
- Data changes + High data volume
- Legal compliance requirements (GDPR/CCPA)

**Testing Requirements:** Unit + Integration + E2E + Security + Performance + Accessibility (95%+ coverage)
**Evidence Required:** All test reports + security audit + performance benchmarks + accessibility compliance report
**Stakeholder Approvals:** Legal Team, Security Team, Product Management

I'll now implement subtask 1.1: "Design secure authentication architecture" using the micro-task grinding approach. I'll break it down into micro-tasks, delegate to appropriate tools, execute all work continuously, test thoroughly, and only return to you when the complete implementation is ready for your review.

**Starting Micro-Task Grinding for Subtask 1.1...**

*This will take approximately 30-45 minutes. I'll complete ALL work (breakdown → delegation → execution → testing → validation → evidence collection) before returning for your confirmation.*
```

### Risk-Based Task Completion Process
```
AI: Subtask 1.1 completed successfully.

## Quality Gate Validation
- [x] All tests passing (96.2% coverage) - ✅ Meets Critical Risk requirements
- [x] Security audit passed - ✅ No vulnerabilities found
- [x] Performance benchmarks met - ✅ <100ms response time
- [x] Accessibility audit passed - ✅ All tests passed
- [x] Evidence collected and archived - ✅ Complete documentation
- [x] Documentation updated - ✅ API docs and user guides

## Evidence Collected
- **Test Reports:** path/to/test-reports
- **Coverage Reports:** path/to/coverage (96.2%)
- **Security Reports:** path/to/security-audit
- **Performance Reports:** path/to/performance-benchmarks

## Commit Details
git commit -m "feat: Authentication Core Engine - Critical Risk Implementation

- Implements secure authentication architecture with comprehensive testing
- Risk Level: Critical (Score: 4.7/5.0)
- Testing: Unit + Integration + E2E + Security + Performance + Accessibility
- Coverage: 95%+ achieved
- Evidence: Full test suite + security audit + performance benchmarks

**Micro-Task Grinding Complete for Subtask 1.1!**

## Implementation Summary
All micro-tasks have been completed, tested, and validated. Here are the complete results:

### Quality Gate Validation
- [x] All micro-tasks completed successfully by delegated tools
- [x] Integration testing passed with no conflicts
- [x] All tests passing (96.2% coverage) - ✅ Meets Critical Risk requirements
- [x] Security audit passed - ✅ No vulnerabilities found
- [x] Performance benchmarks met - ✅ <100ms response time
- [x] Accessibility audit passed - ✅ All tests passed
- [x] Evidence collected and archived
- [x] Documentation updated

### Evidence Collected
- **Test Reports:** path/to/test-reports
- **Coverage Reports:** path/to/coverage (96.2%)
- **Security Reports:** path/to/security-audit
- **Performance Reports:** path/to/performance-benchmarks
- **Integration Tests:** path/to/integration-results

### Micro-Tasks Executed (Each with Individual Quality Gates)

**1. Auth Interface Design** → TypeScript Specialist Droid
- [x] Executed: TypeScript interfaces created ✅
- [x] Tested: Type validation tests passing ✅
- [x] Quality Gate: All interfaces compile without errors ✅
- [x] Evidence: Type definitions + test results logged ✅

**2. Security Architecture** → Backend Security Specialist
- [x] Executed: Security patterns implemented ✅
- [x] Tested: Security validation tests passing ✅
- [x] Quality Gate: Security audit passed ✅
- [x] Evidence: Architecture docs + security test results ✅

**3. Database Schema Design** → Database Specialist
- [x] Executed: Schema migrations created ✅
- [x] Tested: Database integration tests passing ✅
- [x] Quality Gate: Schema validation passed ✅
- [x] Evidence: Schema files + integration test results ✅

**4. Unit Test Implementation** → Testing Specialist
- [x] Executed: Comprehensive unit tests created ✅
- [x] Tested: All unit tests passing (95% coverage) ✅
- [x] Quality Gate: Coverage threshold met ✅
- [x] Evidence: Test suite + coverage report ✅

**5. Security Review** → Code Reviewer
- [x] Executed: Security review completed ✅
- [x] Tested: Security scan passed ✅
- [x] Quality Gate: No security vulnerabilities found ✅
- [x] Evidence: Security audit report ✅

**6. Documentation Update** → Documentation Generator
- [x] Executed: API documentation updated ✅
- [x] Tested: Documentation validation passed ✅
- [x] Quality Gate: All examples compile and work ✅
- [x] Evidence: Updated documentation files ✅

**Would you like me to:**
1. Commit these changes and proceed to subtask 1.2?
2. Review any specific aspect before committing?
3. Make any adjustments before proceeding?

*All implementation work is complete - just need your confirmation to commit and continue.*
```

## Enhanced Quality Checklist - "All Roads to Rome" Approach

### Pre-Implementation Quality Gates
Before starting any task:
- [ ] Risk assessment completed and documented
- [ ] Cross-functional workshop conducted (if required)
- [ ] Stakeholder approvals obtained (for high/critical risk)
- [ ] Testing environment configured for risk level
- [ ] Risk mitigation strategies identified and documented

**NEW: Micro-Task Grinding Confirmation**
- [ ] User confirms to start micro-task grinding (single confirmation for entire subtask)
- [ ] AI commits to complete ALL micro-task work before next user interaction

### During Implementation Quality Gates
- [ ] Code follows established patterns and coding standards
- [ ] Security best practices implemented (for critical/high risk)
- [ ] Regular progress updates provided to stakeholders
- [ ] Risk issues identified and addressed promptly

### Post-Implementation Quality Gates (Updated - After Micro-Task Grinding)

**Before presenting to user (Micro-Task Grinding Complete):**
- [ ] All quality gates for current task are automatically validated
- [ ] Required evidence collected and archived (based on risk level)
- [ ] Documentation automatically updated
- [ ] Comprehensive test results compiled
- [ ] Integration testing completed
- [ ] Performance benchmarks validated
- [ ] Security/compliance checks completed
- [ ] Ready for user review

**User Interaction Phase (After Grinding Complete):**
- [ ] Present complete implementation results to user
- [ ] Show all evidence and test results
- [ ] Request user confirmation for commit/documentation
- [ ] Get user approval for next task
- [ ] Obtain stakeholder sign-offs (for high/critical risk tasks)
- [ ] Git commit made with enhanced risk-based template
- [ ] Risk register updated with implementation learnings
- [ ] Progress tracking updated by risk level

### Risk-Specific Quality Gates

#### Critical Risk Tasks (Red Path)
- [ ] All micro-tasks completed successfully by delegated droids or agents
- [ ] Integration testing passed with no conflicts between droid or agent outputs
- [ ] All tests passing (95%+ coverage)
- [ ] Security audit passed
- [ ] Legal compliance verified
- [ ] Performance benchmarks met
- [ ] Accessibility audit passed (WCAG AA)
- [ ] All required reviews completed (Security, Legal, Performance, Accessibility, Code, Architectural)
- [ ] Evidence package complete from all specialized droids or agents
- [ ] Documentation updated
- [ ] Stakeholder sign-offs obtained

#### High Risk Tasks (Orange Path)
- [ ] All micro-tasks completed successfully by delegated droids or agents
- [ ] Integration testing passed with no conflicts between droid or agent outputs
- [ ] All tests passing (90%+ coverage)
- [ ] Performance benchmarks met
- [ ] Security testing passed
- [ ] Required reviews completed (Performance, Code, Architectural)
- [ ] Evidence package complete from all specialized droids or agents
- [ ] Documentation updated
- [ ] Stakeholder approvals obtained

#### Medium Risk Tasks (Yellow Path)
- [ ] All micro-tasks completed successfully by delegated droids or agents
- [ ] Integration testing passed with no conflicts between droid or agent outputs
- [ ] All tests passing (80%+ coverage)
- [ ] Code review completed
- [ ] Basic security validation
- [ ] Evidence package complete from specialized droids or agents
- [ ] Documentation updated

#### Low Risk Tasks (Green Path)
- [ ] All micro-tasks completed successfully by delegated droids or agents
- [ ] Integration testing passed with no conflicts between droid or agent outputs
- [ ] All tests passing (70%+ coverage)
- [ ] Basic validation completed
- [ ] Evidence collected from delegated droids or agents
- [ ] Documentation updated (minimal)

## Integration with Workflow

This implementation step integrates with:
1. **Task Generation** - Provides detailed task list with risk assessment
2. **Risk Assessment Framework** - Determines testing protocols and quality gates
3. **Testing Guidelines** - Provides specific testing requirements by risk level
4. **Quality Assurance** - Ensures comprehensive validation and evidence collection

## Best Practices

### During Implementation
- **Test-First Development:** Write tests before or alongside code
- **Risk-Aware Approach:** Apply appropriate protocols based on risk level
- **Evidence Collection:** Systematically collect and archive all required evidence
- **Quality Gates:** Validate all requirements before marking tasks complete
- **Progress Tracking:** Maintain accurate progress records by risk level

### Error Handling
- **Early Detection:** Identify issues early through comprehensive testing
- **Systematic Debugging:** Use structured approach to identify and fix issues
- **Recovery Procedures:** Have clear processes for handling failures
- **Documentation:** Record issues and solutions for future reference

### Continuous Improvement
- **Process Refinement:** Continuously improve based on implementation experience
- **Tool Updates:** Keep testing tools and frameworks up to date
- **Pattern Recognition:** Identify and document common patterns and solutions
- **Knowledge Sharing:** Share learnings across team members
