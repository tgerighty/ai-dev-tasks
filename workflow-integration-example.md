# AI Dev Tasks Workflow Integration Example

## Overview

This example demonstrates how the three core AI Dev Tasks workflow files work together in a complete development cycle, from initial requirements through implementation and deployment.

## Complete Workflow Integration Process

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   create-prd.md │───▶│ generate-tasks.md│───▶│process-task-list.md│───▶│  Implementation  │
│                 │    │                 │    │                  │    │                 │
│ • Clarify       │    │ • Generate      │    │ • Execute        │    │ • Risk-aware    │
│ • Assess        │    │   tasks         │    │   protocols      │    │   development  │
│ • Create PRD    │    │ • Prioritize     │    │ • Test           │    │ • Evidence      │
│ • User Stories  │    │ • Break down     │    │ • Commit         │    │ • Progress      │
│ • Risk Analysis │    │ • Assign risk    │    │ • Track          │    │ • Quality gates │
└─────────────────┘    └─────────────────┘    └─────────────────┘    └─────────────────┘
```

## Step-by-Step Integration Example

Let's walk through a complete example: **User Authentication System**

### Phase 1: Requirements Gathering (create-prd.md)

**Initial User Request:**
```
"I need a user authentication system for my web application"
```

**AI Assistant Response (following create-prd.md):**
```
I'd like to help you create a comprehensive PRD for your user authentication system. 
Let me ask some clarifying questions to ensure we capture all requirements.

## Clarifying Questions

### Standard Questions
A. **Problem/Goal:** What specific authentication problems are you trying to solve?
   1. Users can't access protected resources
   2. No user account management exists
   3. Need to replace basic authentication with enterprise-grade solution
   4. Other (please specify)

B. **Target User:** Who will be using this authentication system?
   1. General public users
   2. Business/enterprise users
   3. Internal team members only
   4. Multiple user types (please specify)

C. **Core Functionality:** What authentication features do you need?
   1. Email/password login
   2. Social login (Google, GitHub, etc.)
   3. Multi-factor authentication
   4. Single Sign-On (SSO)
   5. All of the above

[Continue with clarifying questions...]
```

**Risk Assessment Questions (from create-prd.md):**
```
Now I'll help you assess the risk factors for each major functional area:

### Technical Risk Factors
For each authentication feature, please rate:

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

[Continue with risk assessment factors...]
```

**User Responses:**
```
A. Problem: 3 - Need enterprise-grade authentication
B. Target User: 2 - Business users
C. Core Functionality: 5 - All features needed

Risk Assessment:
- Frequency: 4 (High - users access multiple times per day)
- Complexity: 4 (High - OAuth2, MFA, session management)
- Dependencies: 5 (High - Multiple external auth providers)
- Data Sensitivity: C (High - User credentials, PII)
- Components: 4 (High - UI, backend, database, security)
- Affected Users: 3 (Medium - 500 business users)
- Impact of Failure: C (High - Business operations affected)
- Business Visibility: B (External - affects customer access)
- Expected Defect Rate: 0.1% - 1% (Security-critical)
- Software Maturity: B (Evolving - existing system with major changes)
```

**Generated PRD (0001-prd-user-authentication.md):**
```markdown
# User Authentication System - Product Requirements Document

## 1. Introduction/Overview
This PRD defines the requirements for a comprehensive user authentication system that supports enterprise-grade security requirements for business users...

## 2. Goals
- Implement secure user authentication with 99.9% uptime
- Support multiple authentication methods (email/password, OAuth2, MFA)
- Ensure compliance with enterprise security standards
- Provide seamless user experience for 500+ business users

## 3. User Stories
- **US-001:** As a business user, I want to log in with my email and password so that I can access protected resources.
- **US-002:** As a business user, I want to use single sign-on with my company credentials so that I don't need to remember multiple passwords.
- **US-003:** As a system administrator, I want to manage user accounts and permissions so that I can maintain security policies.

## 4. Functional Requirements
1. The system must support email/password authentication
2. The system must integrate with OAuth2 providers (Google, Microsoft, GitHub)
3. The system must implement multi-factor authentication
4. The system must provide session management with secure token handling
5. The system must support user account management (create, update, delete)
6. The system must implement role-based access control

## 5. Risk Assessment
### Critical Risk Areas (4.5-5.0)
- Authentication Core Engine (Risk Score: 4.7)
- Session Management (Risk Score: 4.6)

### High Risk Areas (3.6-4.4)
- OAuth2 Integration (Risk Score: 4.2)
- User Account Management (Risk Score: 3.8)
- Multi-Factor Authentication (Risk Score: 4.1)

### Testing Requirements
- **Critical Risk:** Unit + Integration + E2E + Security + Performance + Accessibility (95%+ coverage)
- **High Risk:** Unit + Integration + E2E + Performance (90%+ coverage)

[Continue with complete PRD...]
```

### Phase 2: Task Generation (generate-tasks.md)

**AI Assistant Response (following generate-tasks.md):**
```
I'll generate a comprehensive task list based on your PRD. Let me analyze the requirements and create tasks with appropriate risk assessment and complexity ratings.

# Task List: User Authentication System

## User Stories

- **US-001:** As a business user, I want to log in with my email and password so that I can access protected resources.
  - **Complexity:** 6
  - **Mapped to Task:** 1.0

- **US-002:** As a business user, I want to use single sign-on with my company credentials so that I don't need to remember multiple passwords.
  - **Complexity:** 8
  - **Mapped to Task:** 2.0

## Tasks

### Critical Risk Tasks (P0 - Immediate)

- [ ] 1.0 Authentication Core Engine (Maps to US-001)
  - [ ] 1.1 Design secure authentication architecture - **Complexity:** 4
  - [ ] 1.2 Implement password hashing and validation - **Complexity:** 3
  - [ ] 1.3 Create JWT token management system - **Complexity:** 4
  - [ ] 1.4 Implement session management with Redis - **Complexity:** 4

- [ ] 2.0 Single Sign-On Integration (Maps to US-002)
  - [ ] 2.1 Implement OAuth2 provider integration framework - **Complexity:** 5 → *[Complex task - see breakdown below]*
    - [ ] 2.1.1 Create OAuth2 configuration system - **Complexity:** 3
    - [ ] 2.1.2 Implement Google OAuth2 provider - **Complexity:** 3
    - [ ] 2.1.3 Implement Microsoft OAuth2 provider - **Complexity:** 3
  - [ ] 2.2 Build SSO user mapping and synchronization - **Complexity:** 4

### High Risk Tasks (P1 - High Priority)

- [ ] 3.0 Multi-Factor Authentication System
  - [ ] 3.1 Implement TOTP (Time-based One-Time Password) support - **Complexity:** 4
  - [ ] 3.2 Create SMS-based MFA integration - **Complexity:** 3
  - [ ] 3.3 Build MFA configuration and user management - **Complexity:** 3

## Complexity Assessment Summary

### Total Tasks: 3 high-level tasks
### Total Subtasks: 8 (including breakdown subtasks)
### Average Complexity: 3.8
### Complex Tasks (>4): 2 subtasks requiring breakdown
### Simple Tasks (≤4): 6 subtasks

### Risk Distribution:
- **Critical Risk:** 2 tasks
- **High Risk:** 1 task
- **Medium Risk:** 0 tasks
- **Low Risk:** 0 tasks

### Evidence Requirements by Risk Level
- **Critical Risk:** All test reports + security audit + performance benchmarks
- **High Risk:** All test reports + performance benchmarks
```

### Phase 3: Task Implementation (process-task-list.md)

**AI Assistant Response (following process-task-list.md):**
```
I'll help you implement the user authentication system following risk-based protocols. 
Let's start with the highest priority task.

## Risk Assessment Summary
- **Highest Risk Level:** Critical (4.7/5.0)
- **Testing Environment:** Configured for Critical Risk protocols
- **Git Branch:** feature/0001-prd-user-authentication

## Starting Task 1.0: Authentication Core Engine

**Risk Level:** Critical (4.7/5.0)
**Testing Requirements:** Unit + Integration + E2E + Security + Performance + Accessibility (95%+ coverage)
**Evidence Required:** All test reports + security audit + performance benchmarks

Would you like me to start implementing subtask 1.1: "Design secure authentication architecture"?
```

**User Response:** "Yes"

**Implementation Process:**
```bash
# 1. Execute Risk-Based Testing Protocol
echo "Running Critical Risk test suite for subtask 1.1..."

npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":95,"functions":95,"lines":95,"statements":95}}'
npm run test:integration
npm run test:e2e
npm run test:security
npm run test:performance
npm run test:a11y

# 2. Collect Evidence
mkdir -p evidence/20250617_143000
cp coverage/ coverage.json evidence/20250617_143000/
cp test-results/ evidence/20250617_143000/
cp security-audit.json evidence/20250617_143000/
cp performance-results.json evidence/20250617_143000/

# 3. Update Task Status
# Mark subtask 1.1 as completed
# Update progress tracking

# 4. Git Commit with Risk-Based Template
git add .
git commit -m "feat: Authentication Core Engine - Critical Risk Implementation

- Implements secure authentication architecture with comprehensive testing
- Risk Level: Critical (Score: 4.7/5.0)
- Testing: Unit + Integration + E2E + Security + Performance + Accessibility
- Coverage: 95%+ achieved
- Evidence: Full test suite + security audit + performance benchmarks
- Review: Security + Performance + Accessibility + Code + Architectural

Changes:
- Created authentication service with JWT token management
- Implemented secure password hashing with Argon2
- Added session management with Redis integration
- Built authentication middleware with role-based access control

Security Notes:
- Implemented Argon2id password hashing with proper salt
- Added rate limiting to prevent brute force attacks
- Secured JWT tokens with proper expiration and refresh mechanisms
- Implemented secure session management with Redis

Performance Notes:
- Optimized token validation with Redis caching
- Implemented connection pooling for database operations
- Added performance benchmarks for authentication flows
- Achieved <100ms response time for authentication requests

Accessibility Notes:
- Implemented ARIA labels for authentication forms
- Added keyboard navigation support
- Ensured screen reader compatibility
- Validated color contrast for error states

Related: 0001-prd-user-authentication | Task-1.0" \
-m "Risk Assessment: Critical (4.7/5.0)" \
-m "Testing Coverage: 95%+ achieved" \
-m "Security Audit: Passed" \
-m "Performance Benchmarks: Met requirements" \
-m "Accessibility Audit: WCAG AA compliant" \
-m "Reviews: Security + Performance + Accessibility + Code + Architectural completed"

# 5. Continue with Next Subtask
echo "Subtask 1.1 completed successfully. Ready to continue with subtask 1.2"
```

## Complete Workflow Integration Example

### File Interactions and Data Flow

**1. create-prd.md → generate-tasks.md Integration**
```bash
# PRD output from create-prd.md
PRD_FILE="0001-prd-user-authentication.md"

# Process PRD to generate tasks
node scripts/process-prd.js "$PRD_FILE" > "tasks-0001-prd-user-authentication.md"

# Risk assessment data flows between files
RISK_DATA=$(jq '.risk_assessment' "$PRD_FILE")
echo "$RISK_DATA" | jq '.critical_risk_areas[]' > "critical-risk-areas.json"
echo "$RISK_DATA" | jq '.high_risk_areas[]' > "high-risk-areas.json"
```

**2. generate-tasks.md → process-task-list.md Integration**
```bash
# Task list from generate-tasks.md
TASK_FILE="tasks-0001-prd-user-authentication.md"

# Extract risk levels and create implementation plan
node scripts/analyze-tasks.js "$TASK_FILE" > "implementation-plan.json"

# Generate risk-based testing scripts
node scripts/generate-testing-scripts.js "$TASK_FILE" > "testing-protocols.json"

# Create progress tracking templates
node scripts/create-progress-templates.js "$TASK_FILE" > "progress-templates.json"
```

**3. process-task-list.md Execution with Risk Protocols**
```bash
#!/bin/bash
# automated-implementation.sh - Complete workflow execution

TASK_FILE="$1"
PRD_FILE="$2"

# Step 1: Load and validate files
echo "Loading task list and PRD..."
node scripts/validate-workflow-files.js "$TASK_FILE" "$PRD_FILE"

# Step 2: Analyze risk levels
echo "Analyzing risk levels..."
RISK_ANALYSIS=$(node scripts/analyze-risk-levels.js "$TASK_FILE")
HIGHEST_RISK=$(echo "$RISK_ANALYSIS" | jq -r '.highest_risk_level')
echo "Highest risk level: $HIGHEST_RISK"

# Step 3: Setup environment based on risk
echo "Setting up environment for $HIGHEST_RISK risk level..."
setup-testing-environment "$HIGHEST_RISK"
setup-monitoring "$HIGHEST_RISK"

# Step 4: Execute tasks with risk-based protocols
echo "Starting task implementation..."
node scripts/execute-tasks.js "$TASK_FILE" --risk-aware

# Step 5: Quality gate validation
echo "Running quality gate validation..."
node scripts/validate-quality-gates.js "$TASK_FILE"

# Step 6: Generate deployment artifacts
echo "Generating deployment artifacts..."
node scripts/generate-deployment-package.js "$TASK_FILE"
```

### Evidence Collection and Progress Tracking

**Evidence Archive Structure:**
```
evidence/
├── 20250617_143000/  # Timestamp
│   ├── task-1.1-auth-architecture/
│   │   ├── test-reports/
│   │   │   ├── unit-test-results.json
│   │   │   ├── integration-test-results.json
│   │   │   └── e2e-test-results.json
│   │   ├── coverage/
│   │   │   └── coverage-final.json
│   │   ├── security/
│   │   │   ├── audit-report.json
│   │   │   └── vulnerability-scan.json
│   │   ├── performance/
│   │   │   └── benchmark-results.json
│   │   └── evidence-summary.md
│   └── task-1.2-password-hashing/
│       └── [similar structure]
└── evidence-summary.json  # Overall summary
```

**Progress Tracking by Risk Level:**
```markdown
## Progress Tracking by Risk Level

### Critical Risk Tasks (P0)
- **Total Tasks:** 2
- **Completed:** 1/2 (50%)
- **In Progress:** 1
- **Blocked:** 0
- **Testing Progress:** 50% - Full test suite required
- **Evidence Collected:** [task-1.1-test-reports, task-1.1-security-audit, task-1.1-performance-benchmarks]
- **Reviews Completed:** [Security, Performance, Accessibility, Code, Architectural]
- **Risk Indicators:** [All systems operational, no security concerns identified]

### High Risk Tasks (P1)
- **Total Tasks:** 1
- **Completed:** 0/1 (0%)
- **In Progress:** 0
- **Blocked:** 0
- **Testing Progress:** 0% - Required test types required
- **Evidence Collected:** []
- **Reviews Completed:** []

### Medium Risk Tasks (P2)
- **Total Tasks:** 0
- **Completed:** 0/0 (0%)

### Low Risk Tasks (P3)
- **Total Tasks:** 0
- **Completed:** 0/0 (0%)
```

### Quality Assurance Gates Validation

**Critical Risk Quality Gates (Passed):**
- [x] All tests passing (95%+ coverage) - ✅ 96.2%
- [x] Security audit passed - ✅ No vulnerabilities found
- [x] Performance benchmarks met - ✅ <100ms response time
- [x] Accessibility audit passed (WCAG AA) - ✅ All tests passed
- [x] All required reviews completed - ✅ Security + Performance + Accessibility + Code + Architectural
- [x] Evidence collected and validated - ✅ Complete documentation
- [x] Documentation updated - ✅ API docs and user guides

**High Risk Quality Gates (Pending):**
- [ ] All tests passing (90%+ coverage) - ⏳ Not started
- [ ] Performance benchmarks met - ⏳ Not started
- [ ] Required reviews completed - ⏳ Not started
- [ ] Evidence collected and validated - ⏳ Not started
- [ ] Documentation updated - ⏳ Not started

### Git Workflow with Risk-Based Commits

**Commit History Example:**
```bash
# Critical Risk Commit
git show --stat
commit 7a8b9c0d (HEAD -> feature/user-authentication)
Author: factory-droid[bot] <138933559+factory-droid[bot]@users.noreply.github.com>
Date:   Tue Jun 17 14:30:00 2025 +0000

feat: Authentication Core Engine - Critical Risk Implementation

- Implements secure authentication architecture with comprehensive testing
- Risk Level: Critical (Score: 4.7/5.0)
- Testing: Unit + Integration + E2E + Security + Performance + Accessibility
- Coverage: 95%+ achieved
- Evidence: Full test suite + security audit + performance benchmarks
- Review: Security + Performance + Accessibility + Code + Architectural

 23 files changed, 456 insertions(+)
 src/services/auth.service.ts | 156 ++++++++++++++++++++++++++
 src/middleware/auth.middleware.ts | 89 +++++++++++++++++++++
 src/utils/password-hasher.ts | 67 +++++++++++++++++++++
 src/tests/auth.test.ts | 78 ++++++++++++++++++++++
 src/types/auth.types.ts | 45 +++++++++++++++++++++
 coverage/lcov.info | 1 +-
 security-audit.json | 12 +++
 performance-results.json | 8 ++

Risk Assessment: Critical (4.7/5.0)
Testing Coverage: 95%+ achieved
Security Audit: Passed
Performance Benchmarks: Met requirements
Accessibility Audit: WCAG AA compliant
Reviews: Security + Performance + Accessibility + Code + Architectural completed
```

### Deployment Preparation

**Final Integration Validation:**
```bash
# Complete validation checklist
echo "Running pre-deployment validation..."

# Full test suite across all implemented tasks
npm run test:all

# Security audit for entire system
npm audit --audit-level high

# Performance validation for all critical components
npm run test:performance -- --production

# Build validation
npm run build
npm run build:test

# Documentation validation
npm run docs:build
npm run docs:test

# Generate final evidence archive
tar -czf "evidence-user-authentication-$(date +%Y%m%d_%H%M%S).tar.gz" evidence/

echo "Deployment preparation complete for User Authentication System"
```

## Integration Benefits

### 1. Risk-Based Development
- **Prioritization:** High-risk tasks get immediate attention and resources
- **Testing:** Appropriate testing levels based on risk assessment
- **Quality Gates:** Risk-specific validation ensures comprehensive coverage
- **Evidence:** Systematic evidence collection for audit and compliance

### 2. Workflow Automation
- **Consistency:** Standardized processes across all risk levels
- **Traceability:** Clear mapping from requirements to implementation
- **Documentation:** Comprehensive evidence and progress tracking
- **Quality:** Automated validation and quality gate enforcement

### 3. Team Collaboration
- **Clarity:** Clear task definitions with risk context
- **Visibility:** Progress tracking by risk level for stakeholders
- **Accountability:** Evidence collection and review processes
- **Scalability:** Framework can be applied to projects of any size

This integrated workflow ensures that projects are developed systematically with appropriate risk management, testing, and quality assurance throughout the entire development lifecycle.
