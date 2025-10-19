# Rule: Processing Task Lists with Risk-Based Implementation

## Goal
Guide an AI assistant in systematically implementing tasks from a generated task list, with comprehensive risk-based protocols, evidence collection, and progress tracking.

## Process Overview
1. **Load Task List:** Read and analyze the task list structure
2. **Assess Risk:** Determine highest risk level and setup appropriate protocols
3. **Implement Sequentially:** Execute one task at a time with user confirmation
4. **Test Thoroughly:** Apply risk-based testing requirements
5. **Collect Evidence:** Gather required testing evidence
6. **Track Progress:** Update task completion status and commit changes

## Documentation References
- **Risk Assessment Framework:** Use `docs/risk-assessment-framework.md` for detailed protocols
- **Testing Guidelines:** Follow `docs/testing-guidelines.md` for testing requirements
- **Complexity Rubric:** Reference `docs/complexity-rubric.md` for task understanding
- **Workflow Examples:** See `examples/workflow-integration-example.md` for complete implementation

## Risk-Based Implementation Protocols

### Quick Risk Assessment
Before starting implementation, determine:
- **Highest Risk Level:** Critical, High, Medium, or Low
- **Testing Requirements:** Based on risk level (see docs/testing-guidelines.md)
- **Evidence Collection:** Required evidence types for audit
- **Quality Gates:** Validation checkpoints for completion

### Sequential Implementation Process
```
Start Task → Implement → Test → Collect Evidence → Validate → Commit → Next Task
```

**Key Rules:**
- **One task at a time:** Complete current task before moving to next
- **User confirmation:** Ask for approval before starting each new task
- **Risk-aware testing:** Apply appropriate testing protocols based on risk level
- **Evidence collection:** Generate and archive all required evidence
- **Quality gates:** Validate all requirements before marking task complete

## Task Implementation Workflow

### 1. Pre-Implementation Setup
```bash
# Load task list
TASK_FILE="tasks-[feature-name].md"

# Validate task list structure
node scripts/validate-task-list.js "$TASK_FILE"

# Assess risk levels
RISK_ANALYSIS=$(node scripts/analyze-risk-levels.js "$TASK_FILE")
HIGHEST_RISK=$(echo "$RISK_ANALYSIS" | jq -r '.highest_risk')
echo "Highest risk level: $HIGHEST_RISK"
```

### 2. Implementation Process
For each task/subtask:

#### A. Universal Micro-Task Delegation (All Complexity Levels 1-4)

**Core Principle:** Every subtask (complexity 1, 2, 3, AND 4) must be broken down into micro-tasks of complexity 1-2 during execution. ALL micro-tasks are delegated to appropriate tools based on capability matching.

**Process Flow:**
```
Load Subtask (Complexity 1-4) → Inventory Available Tools → Break Subtask into Micro-Tasks (Complexity 1-2) → Match Micro-Tasks to Tool Capabilities → Delegate All Micro-Tasks → Integration & Validation → Evidence Collection → Complete Subtask
```

**Tool Discovery and Matching Process:**

1. **Tool Inventory:** List all available coding tools/agents and document their specialized capabilities
2. **Capability Assessment:** Document each tool's expertise areas and complexity handling abilities
3. **Micro-Task Matching:** Map micro-task types to appropriate tools based on capabilities
4. **Validation:** Ensure selected tools can handle assigned complexity levels

**Standard Micro-Task Types (Tool-Agnostic):**

| Category | Micro-Task | Complexity | Required Tool Capability |
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
├── 1.1 Create component structure → [Tool with UI framework expertise]
└── 1.2 Add type definitions → [Tool with strong typing capabilities]
```

**Complexity 2 Subtask → 2-4 Micro-tasks**
```
Subtask: "Implement form validation" (Complexity: 2)
├── 2.1 Create validation rules → [Tool with validation expertise]
├── 2.2 Implement validation logic → [Tool with form handling expertise]
├── 2.3 Add error handling → [Tool with error handling patterns]
└── 2.4 Write tests → [Tool with testing framework knowledge]
```

**Complexity 3 Subtask → 3-6 Micro-tasks**
```
Subtask: "Add authentication service" (Complexity: 3)
├── 3.1 Create auth interfaces → [Tool with type system expertise]
├── 3.2 Implement auth logic → [Tool with security/backend expertise]
├── 3.3 Add middleware → [Tool with middleware expertise]
├── 3.4 Write tests → [Tool with testing capabilities]
├── 3.5 Security review → [Tool with security analysis capabilities]
└── 3.6 Update documentation → [Tool with documentation generation]
```

**Complexity 4 Subtask → 4-8 Micro-tasks**
```
Subtask: "Implement OAuth2 integration" (Complexity: 4)
├── 4.1 Design OAuth2 interfaces → [Tool with type system expertise]
├── 4.2 Create configuration → [Tool with configuration expertise]
├── 4.3 Implement provider 1 → [Tool with OAuth expertise]
├── 4.4 Implement provider 2 → [Tool with OAuth expertise]
├── 4.5 Create token management → [Tool with security expertise]
├── 4.6 Write comprehensive tests → [Tool with testing expertise]
├── 4.7 Security review → [Tool with security analysis]
└── 4.8 Update documentation → [Tool with documentation capabilities]
```

**Delegation Execution Protocol:**

1. **Parallel Execution:** Launch multiple tools simultaneously when micro-tasks are independent
2. **Sequential Execution:** Wait for completion of dependent micro-tasks before launching next tools
3. **Hybrid Execution:** Mix of parallel and sequential based on dependency analysis

**Expected Execution Times:**
- **Complexity 1:** 5-10 minutes (1-2 micro-tasks, 1-2 tools)
- **Complexity 2:** 15-20 minutes (2-4 micro-tasks, 2-3 tools)
- **Complexity 3:** 30-45 minutes (3-6 micro-tasks, 4-5 tools)
- **Complexity 4:** 60-90 minutes (4-8 micro-tasks, 5-6 tools)

**Integration and Quality Assurance:**

After all micro-tasks are completed by delegated tools:
- [ ] Validate compatibility between tool outputs
- [ ] Test combined functionality end-to-end
- [ ] Ensure requirements are fully met
- [ ] Apply risk-based testing protocols (maintain original risk level requirements)
- [ ] Collect evidence from all specialized tools
- [ ] Aggregate evidence into comprehensive package

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
- [ ] All micro-tasks completed successfully by delegated tools
- [ ] Integration testing passed with no conflicts between tool outputs
- [ ] Risk-based testing requirements met (maintain original risk level protocols)
- [ ] Evidence package complete from all specialized tools
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

Would you like me to start implementing subtask 1.1: "Design secure authentication architecture"?
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

Ready to continue with subtask 1.2?
```

## Enhanced Quality Checklist - "All Roads to Rome" Approach

### Pre-Implementation Quality Gates
Before starting any task:
- [ ] Risk assessment completed and documented
- [ ] Cross-functional workshop conducted (if required)
- [ ] Stakeholder approvals obtained (for high/critical risk)
- [ ] Testing environment configured for risk level
- [ ] Risk mitigation strategies identified and documented

### During Implementation Quality Gates
- [ ] Code follows established patterns and coding standards
- [ ] Security best practices implemented (for critical/high risk)
- [ ] Regular progress updates provided to stakeholders
- [ ] Risk issues identified and addressed promptly

### Post-Implementation Quality Gates
Before proceeding to next task, ensure:
- [ ] All quality gates for current task are passed
- [ ] Required evidence is collected and archived (based on risk level)
- [ ] Task is marked as complete in task list
- [ ] Git commit is made with enhanced risk-based template
- [ ] Risk register updated with implementation learnings
- [ ] Progress tracking is updated by risk level
- [ ] User approval is received for next task
- [ ] Stakeholder sign-offs obtained (for high/critical risk tasks)

### Risk-Specific Quality Gates

#### Critical Risk Tasks (Red Path)
- [ ] All micro-tasks completed successfully by delegated tools
- [ ] Integration testing passed with no conflicts between tool outputs
- [ ] All tests passing (95%+ coverage)
- [ ] Security audit passed
- [ ] Legal compliance verified
- [ ] Performance benchmarks met
- [ ] Accessibility audit passed (WCAG AA)
- [ ] All required reviews completed (Security, Legal, Performance, Accessibility, Code, Architectural)
- [ ] Evidence package complete from all specialized tools
- [ ] Documentation updated
- [ ] Stakeholder sign-offs obtained

#### High Risk Tasks (Orange Path)
- [ ] All micro-tasks completed successfully by delegated tools
- [ ] Integration testing passed with no conflicts between tool outputs
- [ ] All tests passing (90%+ coverage)
- [ ] Performance benchmarks met
- [ ] Security testing passed
- [ ] Required reviews completed (Performance, Code, Architectural)
- [ ] Evidence package complete from all specialized tools
- [ ] Documentation updated
- [ ] Stakeholder approvals obtained

#### Medium Risk Tasks (Yellow Path)
- [ ] All micro-tasks completed successfully by delegated tools
- [ ] Integration testing passed with no conflicts between tool outputs
- [ ] All tests passing (80%+ coverage)
- [ ] Code review completed
- [ ] Basic security validation
- [ ] Evidence package complete from specialized tools
- [ ] Documentation updated

#### Low Risk Tasks (Green Path)
- [ ] All micro-tasks completed successfully by delegated tools
- [ ] Integration testing passed with no conflicts between tool outputs
- [ ] All tests passing (70%+ coverage)
- [ ] Basic validation completed
- [ ] Evidence collected from delegated tools
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
