# Testing Guidelines for AI Development

## Overview
This document provides comprehensive testing guidelines for AI-assisted development, ensuring consistent quality and reliability across all risk levels.

## Testing Philosophy

### AI-Driven Development Testing
**With AI development tools, comprehensive testing becomes not just feasible but essential:**

- **Unit test for every task**: AI tools enable efficient test creation for every single coding task
- **Tests document behavior**: Each test serves as living documentation of intended functionality
- **Micro-task testing**: Every small change should have corresponding test coverage
- **Test-first mindset**: Write tests alongside or before implementation
- **Automated test generation**: Leverage AI to create comprehensive test suites efficiently

### Testing-as-Code Development
- **Write tests alongside code**: Create test files as you implement functionality
- **Quality-first approach**: Focus tests on critical paths and business risks, not coverage targets
- **Risk-proportional testing**: Match testing effort to actual risk assessment, not one-size-fits-all
- **Evidence collection**: Generate focused evidence that proves critical functionality works

### Core Principles
1. **Test what matters most**: Focus on high-impact functionality and failure scenarios
2. **Risk-based test selection**: Choose test types based on actual risk assessment
3. **Each test tells a story**: Tests should validate specific business risks or user scenarios
4. **Quality gates over coverage percentages**: Use scenario-based success metrics
5. **Efficiency over volume**: Right tests, not just more tests
6. **Every task gets a test**: In AI-driven development, create unit tests for every coding task

## Risk-Based Testing Requirements

### Critical Risk Tasks (4.5-5.0)

#### Quality-First Testing Strategy
**Focus:** Proving correctness and resilience under all conditions, not achieving coverage numbers

#### Testing Types Required
- **Unit Tests:** Exhaustive testing of all business logic, edge cases, and failure modes
- **Integration Tests:** All external systems with failure simulation and error handling validation
- **E2E Tests:** Critical user journeys spanning entire system, including error scenarios
- **Security Tests:** Comprehensive vulnerability assessment and penetration testing
- **Performance Tests:** Load testing under realistic conditions and benchmarking
- **Accessibility Tests:** Full WCAG AA compliance with assistive technology validation

#### Success Metrics
- **Critical Path Coverage:** All identified critical scenarios tested and passing
- **Edge Case Handling:** All identified edge cases properly handled
- **Failure Recovery:** System gracefully recovers from simulated failures
- **Security Audit:** No critical or high-severity vulnerabilities
- **Performance Benchmarks:** Meets all defined performance criteria under load

#### Testing Protocols
```bash
# Critical Risk Testing Protocol
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":95,"functions":95,"lines":95,"statements":95}}'
npm run test:integration
npm run test:e2e
npm run test:security
npm run test:performance
npm run test:a11y
npm run test:load
```

#### Evidence Collection
- **Coverage Reports:** Detailed coverage analysis with line-by-line metrics
- **Test Results:** JSON and HTML reports for all test types
- **Security Audit:** Vulnerability scan results and remediation reports
- **Performance Benchmarks:** Response time, throughput, and resource usage metrics
- **Accessibility Reports:** Screen reader testing and keyboard navigation validation

### High Risk Tasks (3.6-4.4) - Orange Path

#### Quality-First Testing Strategy
**Focus:** Ensuring primary feature works correctly and integrates well under all conditions

#### Testing Types Required
- **Unit Tests:** Full coverage of new business logic and important edge cases
- **Integration Tests:** Key integration points with success and failure scenario testing
- **E2E Tests:** "Happy path" and most common error-path user scenarios
- **Performance Tests:** Load testing under expected usage conditions
- **Security Tests:** Authentication and authorization validation with vulnerability scanning

#### Success Metrics
- **Feature Validation:** Primary functionality works as specified
- **Integration Success:** All key dependencies communicate correctly
- **User Journey Completion:** Critical user paths tested and working
- **Security Compliance:** No unauthorized access or data exposure

### Medium Risk Tasks (2.1-3.5) - Yellow Path

#### Quality-First Testing Strategy
**Focus:** Validating core functionality of the change works correctly

#### Testing Types Required
- **Unit Tests:** Coverage of main business logic and positive cases
- **Integration Tests:** Verify direct dependencies work as expected
- **E2E Tests:** Key functionality validation through user interface
- **Security Tests:** Input validation and basic authorization checks

#### Success Metrics
- **Core Functionality:** Primary feature works as specified
- **Integration Validation:** Direct dependencies communicate correctly
- **User Acceptance:** Feature is usable through interface
- **Basic Security:** No unauthorized access or data exposure

### Low Risk Tasks (0.0-2.0) - Green Path

#### Quality-First Testing Strategy
**Focus:** Confirming change doesn't break anything obvious and works as intended

#### Testing Types Required
- **Unit Tests:** Focused tests for specific code that was changed
- **Basic Validation:** Quick checks that change functions correctly
- **Manual Testing:** Developer or QA engineer verification of functionality

#### Success Metrics
- **Functionality Verification:** Change works as specified
- **No Obvious Regressions:** Existing features continue to work
- **Basic Security:** No unauthorized access or data exposure

### Enhanced Risk-Based Testing Protocol Workflow

#### Pre-Testing Risk Validation
```bash
# Validate risk level and configure testing environment
RISK_LEVEL=$(node scripts/get-risk-level.js "$TASK_FILE")
echo "Configuring testing for risk level: $RISK_LEVEL"

# Set up quality-based testing environment based on risk level
case "$RISK_LEVEL" in
  "critical")
    # Critical risk testing setup - comprehensive coverage
    npm install --save-dev @types/jest @types/supertest
    npm install --save-dev @testing-library/jest-dom @testing-library/user-event
    npm install --save-dev @testing-library/cypress
    npm install --save-dev axe-core
    
    # Comprehensive testing for all critical scenarios
    npm install --save-dev @typescript-eslint/eslint-plugin
    npm install --save-dev eslint-plugin-jest
    
    # Performance and security tools for thorough validation
    npm install --save-dev artillery lighthouse-ci
    npm install --save-dev axe-core
    
    ;;
  "high")
    # High risk testing setup - focused on critical paths
    npm install --save-dev @types/jest @types/supertest
    npm install --save-dev @testing-library/jest-dom @testing-library/user-event
    npm install --save-dev cypress
    
    # Performance tools for expected usage conditions
    npm install --save-dev artillery
    
    ;;
  "medium")
    # Medium risk testing setup - core functionality focus
    npm install --save-dev @types/jest @types/supertest
    npm install --save-dev @testing-library/jest-dom
    
    # Basic validation tools
    npm install --save-dev eslint-plugin-jest
    
    ;;
  "low")
    # Low risk testing setup - targeted change validation
    npm install --save-dev @types/jest @types/supertest
    
    # Minimal testing overhead
    npm install --save-dev eslint-plugin-jest
    
    ;;
esac

echo "Testing environment configured for $RISK_LEVEL risk level"
```

#### Evidence Collection Framework
```bash
# Collect evidence based on risk level
collect_evidence() {
  local TASK_FILE="$1"
  local RISK_LEVEL=$(node scripts/get-risk-level.js "$TASK_FILE")
  local EVIDENCE_DIR="evidence/$(date +%Y%m%d_%H%M%S)_${RISK_LEVEL}"
  
  mkdir -p "$EVIDENCE_DIR"
  
  case "$RISK_LEVEL" in
    "critical")
      # Comprehensive evidence collection
      npm run test:unit -- --coverage --coverageReporters=text-lcov > "$EVIDENCE_DIR/unit-tests.txt"
      npm run test:integration > "$EVIDENCE_DIR/integration-tests.txt"
      npm run test:e2e > "$EVIDENCE_DIR/e2e-tests.txt"
      npm run test:security -- --coverage > "$EVIDENCE_DIR/security-tests.txt"
      npm run test:performance -- --profile > "$EVIDENCE_DIR/performance-benchmarks.json"
      
      # Generate comprehensive reports
      cp coverage/ coverage-final.json "$EVIDENCE_DIR/coverage.json"
      cp coverage/lcov-report/index.html "$EVIDENCE_DIR/coverage-report.html"
      
      # Security audit
      npm audit --audit-level high > "$EVIDENCE_DIR/security-audit.txt"
      ;;
    "high")
      # Comprehensive testing with performance focus
      npm run test:unit -- --coverage --coverageReporters=text-lcov > "$EVIDENCE_DIR/unit-tests.txt"
      npm run test:integration > "$EVIDENCE_DIR/integration-tests.txt"
      npm run test:e2e > "$EVIDENCE_DIR/e2e-tests.txt"
      npm run test:performance -- --profile > "$EVIDENCE_DIR/performance-benchmarks.json"
      
      # Generate reports
      cp coverage/ coverage-final.json "$EVIDENCE_DIR/coverage.json"
      cp coverage/lcov-report/index.html "$EVIDENCE_DIR/coverage-report.html"
      ;;
    "medium")
      # Standard testing with basic security
      npm run test:unit -- --coverage --coverageReporters=text-lcov > "$EVIDENCE_DIR/unit-tests.txt"
      npm run test:integration > "$EVIDENCE_DIR/integration-tests.txt"
      
      # Generate reports
      cp coverage/ coverage-final.json "$EVIDENCE_DIR/coverage.json"
      cp coverage/lcov-report/index.html "$EVIDENCE_DIR/coverage-report.html"
      ;;
    "low")
      # Basic testing with minimal validation
      npm run test:unit -- --coverage --coverageReporters=text-lcov > "$EVIDENCE_DIR/unit-tests.txt"
      
      # Generate reports
      cp coverage/ coverage-final.json "$EVIDENCE_DIR/coverage.json"
      cp coverage/lcov-report/index.html "$EVIDENCE_DIR/coverage-report.html"
      ;;
  esac
  
  echo "Evidence collected for $RISK_LEVEL risk level in: $EVIDENCE_DIR"
}
```

#### Quality Gate Validation
```bash
validate_quality_gates() {
  local TASK_FILE="$1"
  local RISK_LEVEL=$(node scripts/get-risk-level.js "$TASK_FILE")
  
  case "$RISK_LEVEL" in
    "critical")
      validate_critical_quality_gates "$EVIDENCE_DIR"
      ;;
    "high")
      validate_high_quality_gates "$EVIDENCE_DIR"
      ;;
    "medium")
      validate_medium_quality_gates "$EVIDENCE_DIR"
      ;;
    "low")
      validate_low_quality_gates "$EVIDENCE_DIR"
      ;;
  esac
}

validate_critical_quality_gates() {
  local EVIDENCE_DIR="$1"
  
  # Test coverage
  COVERAGE=$(jq -r '.total.lines.pct' "$EVIDENCE_DIR/coverage.json")
  if (( $(echo "$COVERAGE < 95" | bc -l))); then
    echo "ERROR: Coverage threshold not met for critical risk. Current: $COVERAGE%, Required: 95%"
    return 1
  fi
  
  # Security audit
  if ! grep -q "0 vulnerabilities" "$EVIDENCE_DIR/security-audit.txt"; then
    echo "ERROR: Security vulnerabilities found in critical risk implementation"
    return 1
  fi
  
  # Performance benchmarks
  if ! grep -q "All benchmarks passed" "$EVIDENCE_DIR/performance-benchmarks.json"; then
    echo "ERROR: Performance benchmarks not met for critical risk implementation"
    return 1
  fi
  
  # Accessibility compliance
  if ! grep -q "WCAG AA compliant" "$EVIDENCE_DIR/accessibility-tests.txt"); then
    echo "ERROR: Accessibility requirements not met for critical risk implementation"
    return 1
  fi
  
  echo "✅ All Critical Risk quality gates passed"
  return 0
}

validate_high_quality_gates() {
  local EVIDENCE_DIR="$1"
  
  # Test coverage
  COVERAGE=$(jq -r '.total.lines.pct' "$EVIDENCE_DIR/coverage.json")
  if (( $(echo "$COVERAGE < 90" | bc -l))); then
    echo "ERROR: Coverage threshold not met for high risk. Current: $COVERAGE%, Required: 90%"
    return 1
  fi
  
  # Performance benchmarks
  if ! grep -q "All benchmarks passed" "$EVIDENCE_DIR/performance-benchmarks.json"; then
    echo "ERROR: Performance benchmarks not met for high risk implementation"
    return 1
  fi
  
  echo "✅ All High Risk quality gates passed"
  return 0
}

validate_medium_quality_gates() {
  local EVIDENCE_DIR="$1"
  
  # Test coverage
  COVERAGE=$(jq -r '.total.lines.pct' "$EVIDENCE_DIR/coverage.json")
  if ((echo "$COVERAGE < 80" | bc -l))); then
    echo "ERROR: Coverage threshold not met for medium risk. Current: $COVERAGE%, Required: 80%"
    return 1
  fi
  
  echo "✅ All Medium Risk quality gates passed"
  return 0
}

validate_low_quality_gates() {
  local EVIDENCE_DIR="$1"
  
  # Test coverage
  COVERAGE=$(jq -r '.total.lines.pct' "$EVIDENCE_DIR/coverage.json")
  if ((echo "$COVERAGE < 70" | bc -l))); then
    echo "ERROR: Coverage threshold not met for low risk. Current: $COVERAGE%, Required: 70%"
    return 1
  fi
  
  echo "✅ All Low Risk quality gates passed"
  return 0
}
```

### Testing Templates by Risk Level

#### Critical Risk Test Template
```typescript
// Critical Risk Test Template - User Authentication
describe('Authentication System - Critical Risk', () => {
  describe('Password Security', () => {
    it('should enforce strong password requirements', async () => {
      // Test password complexity requirements
      const weakPasswords = ['password', '123456', 'qwerty'];
      const strongPassword = '***REDACTED_PASSWORD**';
      
      for (const weakPassword of weakPasswords) {
        expect(() => authService.validatePassword(weakPassword)).toThrow();
      }
      
      expect(() => authService.validatePassword(strongPassword)).not.toThrow();
    });
    
    it('should use secure password hashing algorithm', async () => {
      const password = 'TestPassword123!';
      const hash = await authService.hashPassword(password);
      
      expect(hash).not.toBe(password);
      expect(hash.length).toBeGreaterThan(60); // Argon2 hash length
      expect(hash).toMatch(/^\$2[ab-zA-Z0-9]{22,86}$/); // Argon2 format
    });
  });
  
  describe('Data Protection', () => {
    it('should encrypt sensitive user data', async () => {
      const userData = { email: 'user@example.com', name: 'John Doe' };
      const encrypted = await encryptionService.encrypt(userData);
      
      expect(encrypted).toBeDefined();
      expect(encrypted.iv).toBeDefined();
      expect(encrypted.data).not.toBe(userData);
      
      const decrypted = await encryptionService.decrypt(encrypted);
      expect(decrypted).toEqual(userData);
    });
    
    it('should implement proper access controls', async () => {
      const adminUser = { role: 'admin', permissions: ['all'] };
      const userUser = { role: 'user', permissions: ['read:own'] };
      
      const result = await authService.checkPermissions(adminUser, 'sensitive-data');
      expect(result).toBe(true);
      
      const result2 = await authService.checkPermissions(userUser, 'sensitive-data');
      expect(result2).toBe(false);
    });
  });
  
  describe('Performance Under Load', () => {
    it('should handle concurrent authentication requests', async () => {
      const requests = Array(100).fill().map((_, i) => 
        authService.authenticate(`user${i}@example.com`, `password${i}`)
      );
      
      const results = await Promise.allSettled(requests);
      
      expect(results.every(r => r.success)).toBe(true);
      expect(results.length).toBe(100);
    });
    
    it('should meet response time requirements', async () => {
      const startTime = Date.now();
      await authService.authenticate('user@example.com', '***REDACTED_PASSWORD**');
      const responseTime = Date.now() - startTime;
      
      expect(responseTime).toBeLessThan(100); // <100ms for critical features
    });
  });
  
  describe('Legal Compliance', () => {
    it('should comply with GDPR data minimization', () => {
      const userProfile = await userService.getUserProfile('123');
      
      expect(userProfile.email).toBeDefined();
      expect(userProfile.dateOfBirth).toBeUndefined(); // No DOB unless required
    });
    
    it('should handle data deletion requests properly', () => {
      const deleteRequest = await dataController.deleteUserData('user123');
      expect(deleteRequest.status).toBe(200);
      
      // Verify data is actually deleted
      const deletedUser = await userService.getUser('user123');
      expect(deletedUser).toBeNull();
    });
  });
});

// Security-focused test utilities
const createSecurityTestUser = () => ({
  id: 'test-user-123',
  email: 'test@example.com',
  name: 'Test User',
  permissions: ['read:own'],
  isActive: true,
  createdAt: new Date(),
  updatedAt: new Date()
});

const createSecurityTestSession = () => ({
  id: 'session-123',
  userId: 'test-user-123',
  token: '***REDACTED_TOKEN**',
  expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000),
  ipAddress: '192.168.1.100'
});
```

#### High Risk Test Template
```typescript
// High Risk Test Template - API Integration
describe('API Integration - High Risk', () => {
  describe('External API Reliability', () => {
    it('should handle external service failures gracefully', async () => {
      // Mock external service failure
      jest.spy(externalService, 'getUserData').mockRejectedValue(new Error('Service unavailable'));
      
      const result = await apiService.getUser('user123');
      expect(result.status).toBe('error');
      expect(result.error.message).toContain('Service unavailable');
    });
    
    it('should implement retry logic for external services', async () => {
      const retryConfig = { maxRetries: 3, backoffMs: 1000 };
      
      // First attempt fails
      jest.spy(externalService, 'getUserData')
        .mockRejectedValueOnce(new Error('Temporary failure'))
        .mockResolvedValueOnce({ id: '123', name: 'User' });
      
      const result = await apiService.getUserWithRetry('user123', retryConfig);
      expect(result.success).toBe(true);
      expect(result.data.name).toBe('User');
    });
  });
  
  describe('Data Volume Handling', () => {
    it('should handle large datasets efficiently', async () => {
      const largeDataSet = Array(10000).fill().map((_, i) => ({
        id: `record-${i}`,
        data: `Large data payload ${i}`
      }));
      
      const startTime = Date.now();
      const result = await dataService.processBatch(largeDataSet);
      const processingTime = Date.now() - startTime;
      
      expect(result.processedCount).toBe(10000);
      expect(processingTime).toBeLessThan(5000); // <5s for large datasets
    });
    
    it('should implement data pagination', async () => {
      const page1 = await dataService.getUsers(1, 100);
      const page2 = await dataService.getUsers(2, 100);
      
      expect(page1.data).toHaveLength(100);
      expect(page2.data).toHaveLength(100);
      expect(page1.pageInfo.page).toBe(1);
      expect(page2.pageInfo.page).toBe(2);
    });
  });
  
  describe('Performance Monitoring', () => {
    it('should track performance metrics', async () => {
      const metrics = performanceMonitor.getMetrics();
      
      expect(metrics.averageResponseTime).toBeDefined();
      expect(metrics.errorRate).toBeDefined();
      expect(metrics.throughputput).toBeDefined();
    });
  });
});

// Performance test utilities
const measurePerformance = async (fn: () => Promise<any>) => {
  const start = performance.now();
  const result = await fn();
  const end = performance.now();
  return { result, duration: end - start };
};
```

#### Medium Risk Test Template
```typescript
// Medium Risk Test Template - Core Functionality
describe('User Service - Medium Risk', () => {
  describe('Business Logic Validation', () => {
    it('should validate email format correctly', async () => {
      const invalidEmails = ['invalid-email', 'user@', '@example.com', 'user..email'];
      const validEmail = 'user@example.com';
      
      for (const email of invalidEmails) {
        expect(() => userService.validateEmail(email)).toThrow();
      }
      
      expect(() => userService.validateEmail(validEmail)).not.toThrow();
    });
    
    it('should enforce business rules for user creation', async () => {
      const existingUser = await userService.findByEmail('existing@example.com');
      
      expect(async () => {
        await userService.createUser('existing@example.com', 'Test User');
      }).toThrow('User already exists');
    });
    
    it('should handle user updates correctly', async () => {
      const user = await userService.getUser('123');
      const updatedUser = await userService.updateUser('123', { name: 'Updated Name' });
      
      expect(updatedUser.name).toBe('Updated Name');
      expect(updatedUser.updatedAt).not.toBe(user.updatedAt);
    });
  });
  
  describe('Integration Testing', () => {
    it('should integrate with database correctly', async () => {
      const user = await userService.create({
        email: 'test@example.com',
        name: 'Test User',
        role: 'user'
      });
      
      expect(user.id).toBeDefined();
      expect(user.createdAt).toBeDefined();
      
      const retrievedUser = await userService.getUser(user.id);
      expect(retrievedUser.email).toBe('test@example.com');
    });
    
    it('should handle database connection failures', async () => {
      jest.spy(database, 'query').mockRejectedValue(new Error('Connection failed'));
      
      const result = await userService.create({
        email: 'test@example.com',
        name: 'Test User',
        role: 'user'
      });
      
      expect(result.status).toBe('error');
    });
  });
  
  describe('Input Validation', () => {
    it('should sanitize user input', async () => {
      const maliciousInput = '<script>alert("xss")</script>';
      const sanitizedInput = inputSanitizer.sanitize(maliciousInput);
      
      expect(sanitizedInput).toBe('&lt;script&gt;alert("xss")&lt;/script&gt;');
    });
    
    it('validate required fields', async () => {
      const incompleteUser = { email: 'test@example.com' }; // Missing name
      const result = await userService.createUser(incompleteUser);
      
      expect(result.status).toBe('error');
      expect(result.error.message).toContain('Name is required');
    });
  });
});
```

#### Low Risk Test Template
```typescript
// Low Risk Test Template - Basic Functionality
describe('Utility Functions - Low Risk', () => {
  describe('String Utilities', () => {
    it('should format names correctly', () => {
      expect(formatName('john doe')).toBe('John Doe');
      expect(formatName('')).toBe('John'));
      expect(formatName('    ')).toBe('');
    });
    
    it('should validate UUID format', () => {
      const validUUID = '550e8400-e29b-41d4-a716-446655440000';
      const invalidUUID = 'invalid-uuid-format';
      
      expect(validateUUID(validUUID)).toBe(true);
      expect(validateUUID(invalidUUID)).toBe(false);
    });
    
    it('should parse date strings correctly', () => {
      const validDate = '2024-01-15';
      const invalidDate = '2024-13-32';
      
      expect(parseDate(validDate)).toBe(new Date('2024-01-15'));
      expect(() => parseDate(invalidDate)).toThrow();
    });
  });
  
  describe('Configuration Management', () => {
    it('should load configuration correctly', () => {
      const config = configLoader.loadConfig();
      
      expect(config.databaseUrl).toBeDefined();
      expect(config.apiPort).toBeDefined();
      expect(config.environment).toBeDefined();
    });
    
    it('should handle missing configuration gracefully', () => {
      const config = configLoader.loadConfig();
      
      expect(config.databaseUrl).toBeUndefined();
      expect(() => config.connect()).toThrow('Database connection failed');
    });
  });
  
  describe('Basic Functionality', () => {
    it('should calculate correct totals', () => {
      const items = [
        { name: 'Item 1', price: 10.00 },
        { name: 'Item 2', price: 20.00 },
        { name: 'Item 3', price: 30.00 }
      ];
      
      const total = calculateTotal(items);
      expect(total).toBe(60.00);
    });
    
    it('should filter data correctly', () => {
      const data = [
        { name: 'Item 1', active: true },
        { name: 'Item 2', active: false },
        { name: 'Item 3', active: true }
      ];
      
      const activeItems = filterActive(data);
      expect(activeItems).toHaveLength(2);
      expect(activeItems.map(item => item.name)).toEqual(['Item 1', 'Item 3']);
    });
  });
});
```

#### Evidence Collection
- **Coverage Reports:** 70%+ coverage
- **Basic Validation:** Manual verification

## Test Organization and Security Scanning

### Critical: Test Folder Structure
**All tests MUST be organized in dedicated test folders to exclude from security scanning:**

#### Standard Test Folder Patterns
```
project-root/
├── src/
│   ├── components/
│   │   └── Button.tsx
│   └── utils/
│       └── formatters.ts
├── tests/              # Unit tests
│   ├── unit/
│   │   ├── components/
│   │   │   └── Button.test.tsx
│   │   └── utils/
│   │       └── formatters.test.ts
│   ├── integration/
│   │   └── api/
│   │       └── users.integration.test.ts
│   └── e2e/
│       └── authentication.e2e.test.ts
├── __tests__/          # Alternative Jest pattern
│   ├── unit/
│   └── integration/
└── test/               # Alternative pattern
    ├── fixtures/
    └── helpers/
```

#### Framework-Specific Patterns

**Jest/Vitest:**
- Primary folder: `tests/` or `__tests__/`
- Test files: `*.test.ts`, `*.test.tsx`, `*.spec.ts`
- Location: Root-level test folders, NOT co-located with source

**Playwright/Cypress:**
- Primary folder: `tests/e2e/` or `e2e/`
- Test files: `*.e2e.test.ts`, `*.spec.ts`
- Location: Dedicated E2E test directory

**React Testing Library:**
- Primary folder: `tests/unit/` or `tests/integration/`
- Test files: `*.test.tsx`, `*.test.ts`
- Location: Organized by component/feature structure

### Excluding Tests from Security Scans

#### Why Exclude Test Folders?
1. **False positives**: Test code often contains mock credentials, test data, and intentional vulnerabilities
2. **Performance**: Reduces scan time and resource usage
3. **Focus**: Security tools should focus on production code, not test fixtures
4. **Noise reduction**: Eliminates irrelevant security warnings from test code

#### Configuration for Security Tools

**Snyk Configuration (.snyk):**
```yaml
# Snyk configuration
exclude:
  # Test directories
  - tests/**
  - __tests__/**
  - test/**
  - e2e/**
  - cypress/**
  
  # Test files
  - "**/*.test.ts"
  - "**/*.test.tsx"
  - "**/*.spec.ts"
  - "**/*.spec.tsx"
  - "**/*.e2e.test.ts"
  
  # Test fixtures and mocks
  - "**/fixtures/**"
  - "**/mocks/**"
  - "**/__mocks__/**"
```

**SonarCloud Configuration (sonar-project.properties):**
```properties
# SonarCloud exclusions
sonar.exclusions=\
  tests/**,\
  __tests__/**,\
  test/**,\
  e2e/**,\
  cypress/**,\
  **/*.test.ts,\
  **/*.test.tsx,\
  **/*.spec.ts,\
  **/*.spec.tsx,\
  **/*.e2e.test.ts,\
  **/fixtures/**,\
  **/mocks/**,\
  **/__mocks__/**

# Coverage exclusions
sonar.coverage.exclusions=\
  tests/**,\
  __tests__/**,\
  test/**
```

**GitHub Advanced Security (CodeQL):**
```yaml
# .github/codeql/codeql-config.yml
name: "CodeQL Configuration"

paths-ignore:
  - "tests/**"
  - "__tests__/**"
  - "test/**"
  - "e2e/**"
  - "cypress/**"
  - "**/*.test.ts"
  - "**/*.test.tsx"
  - "**/*.spec.ts"
  - "**/*.e2e.test.ts"
  - "**/fixtures/**"
  - "**/mocks/**"
```

**GitLab Security Scanning (.gitlab-ci.yml):**
```yaml
sast:
  variables:
    SAST_EXCLUDED_PATHS: "tests/,__tests__/,test/,e2e/,cypress/,spec/,**/*.test.ts,**/*.spec.ts"

dependency_scanning:
  variables:
    DS_EXCLUDED_PATHS: "tests/,__tests__/,test/,e2e/,cypress/"
```

**ESLint Configuration (.eslintrc.json):**
```json
{
  "ignorePatterns": [
    "tests/**",
    "__tests__/**",
    "test/**",
    "e2e/**",
    "cypress/**",
    "**/*.test.ts",
    "**/*.test.tsx",
    "**/*.spec.ts"
  ]
}
```

#### Git Ignore Considerations
**DO NOT** add test folders to `.gitignore`:
- Tests should be version controlled
- Security scan exclusions are separate from git tracking
- Configure security tools directly, not via `.gitignore`

#### Test Organization Checklist
- [ ] All tests are in dedicated test folders (`tests/`, `__tests__/`, `test/`, `e2e/`)
- [ ] No test files co-located with source code in `src/`
- [ ] Test files follow naming convention (`*.test.ts`, `*.spec.ts`)
- [ ] Security scanning tools configured to exclude test folders
- [ ] `.snyk` file includes test exclusions
- [ ] `sonar-project.properties` includes test exclusions
- [ ] CI/CD pipelines configured to skip security scans on test folders
- [ ] Tests are committed to version control
- [ ] Test fixtures and mocks are in separate directories

### Verification Commands

**Verify test organization:**
```bash
# Find all test files
find . -name "*.test.ts" -o -name "*.spec.ts" -o -name "*.e2e.test.ts"

# Verify tests are in test folders
find tests __tests__ test e2e -name "*.test.ts" -o -name "*.spec.ts"

# Check for test files in src/ (should return empty)
find src -name "*.test.ts" -o -name "*.spec.ts"
```

**Verify security scan exclusions:**
```bash
# Check Snyk exclusions
snyk test --exclude=tests/,__tests__/,test/

# Check SonarCloud exclusions
sonar-scanner -Dsonar.exclusions="tests/**,__tests__/**,test/**"
```

## Testing Best Practices

### Unit Testing
```typescript
// Good unit test example
describe('AuthService', () => {
  it('should authenticate valid credentials', async () => {
    // Arrange
    const credentials = { email: 'test@example.com', password: '***REDACTED_PASSWORD**' };
    const expectedUser = { id: '123', email: 'test@example.com' };
    
    // Act
    const result = await authService.authenticate(credentials);
    
    // Assert
    expect(result.success).toBe(true);
    expect(result.user).toEqual(expectedUser);
  });

  it('should reject invalid credentials', async () => {
    // Arrange
    const credentials = { email: 'test@example.com', password: '***REDACTED_PASSWORD**' };
    
    // Act
    const result = await authService.authenticate(credentials);
    
    // Assert
    expect(result.success).toBe(false);
    expect(result.error).toBe('Invalid credentials');
  });
});
```

### Integration Testing
```typescript
// Integration test example
describe('User API Integration', () => {
  it('should create and retrieve user', async () => {
    // Arrange
    const userData = { email: 'test@example.com', name: 'Test User' };
    
    // Act
    const createResponse = await api.post('/users', userData);
    const userId = createResponse.data.id;
    const getResponse = await api.get(`/users/${userId}`);
    
    // Assert
    expect(createResponse.status).toBe(201);
    expect(getResponse.status).toBe(200);
    expect(getResponse.data.email).toBe(userData.email);
  });
});
```

### E2E Testing
```typescript
// E2E test example
describe('User Authentication Flow', () => {
  it('should complete full login flow', async () => {
    // Navigate to login page
    await page.goto('/login');
    
    // Fill login form
    await page.fill('[data-testid=email]', 'test@example.com');
    await page.fill('[data-testid=password]', '***REDACTED_PASSWORD**');
    await page.click('[data-testid=login-button]');
    
    // Verify successful login
    await expect(page.locator('[data-testid=dashboard]')).toBeVisible();
    await expect(page.locator('[data-testid=user-email]')).toHaveText('test@example.com');
  });
});
```

## Testing Tools and Configuration

### Jest Configuration (package.json)
```json
{
  "scripts": {
    "test:unit": "jest --testPathPattern=unit",
    "test:integration": "jest --testPathPattern=integration",
    "test:e2e": "playwright test",
    "test:security": "npm audit --audit-level high",
    "test:performance": "artillery run performance-test.yml",
    "test:a11y": "pa11y-ci --sitemap http://localhost:3000",
    "test:coverage": "jest --coverage",
    "test:all": "npm run test:unit && npm run test:integration && npm run test:e2e"
  }
}
```

### Coverage Configuration (jest.config.js)
```javascript
module.exports = {
  collectCoverageFrom: [
    'src/**/*.{js,jsx,ts,tsx}',
    '!src/**/*.d.ts',
    '!src/index.ts',
    '!src/**/*.stories.{js,jsx,ts,tsx}'
  ],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80
    }
  },
  coverageReporters: ['text', 'lcov', 'html']
};
```

## Evidence Management

### Directory Structure
```
evidence/
├── [timestamp]/
│   ├── test-reports/
│   │   ├── unit-test-results.json
│   │   ├── integration-test-results.json
│   │   └── e2e-test-results.json
│   ├── coverage/
│   │   ├── coverage-final.json
│   │   └── lcov.info
│   ├── security/
│   │   ├── audit-report.json
│   │   └── vulnerability-scan.json
│   ├── performance/
│   │   ├── benchmark-results.json
│   │   └── load-test-results.json
│   ├── accessibility/
│   │   ├── lighthouse-report.html
│   │   └── a11y-audit.json
│   └── evidence-summary.md
```

### Evidence Summary Template
```markdown
# Evidence Summary - [Task Title]

**Task Number:** [Task-Number]
**Risk Level:** [Critical/High/Medium/Low]
**Risk Score:** [X.X/5.0]
**Completion Date:** [YYYY-MM-DD HH:MM:SS]

## Testing Evidence
- **Unit Tests:** [Status] - [Coverage]%
- **Integration Tests:** [Status] - [Coverage]%
- **E2E Tests:** [Status] - [Coverage]%
- **Security Tests:** [Status] (if applicable)
- **Performance Tests:** [Status] (if applicable)
- **Accessibility Tests:** [Status] (if applicable)

## Quality Gate Validation
- [ ] All required tests passed
- [ ] Coverage thresholds met
- [ ] Security requirements met (if applicable)
- [ ] Performance requirements met (if applicable)
- [ ] Accessibility requirements met (if applicable)
- [ ] All required reviews completed
- [ ] Evidence collected and archived
```

## Quality Assurance

### Automated Quality Gates
- **Pre-commit hooks:** Run linting and unit tests
- **CI/CD pipelines:** Full test suite execution
- **Coverage thresholds:** Automatic failure if coverage drops
- **Security scans:** Automated vulnerability detection

### Manual Quality Reviews
- **Code reviews:** Peer review of all changes
- **Architecture reviews:** Review of significant design changes
- **Security reviews:** Assessment of security-sensitive changes
- **Performance reviews:** Analysis of performance-critical features

## Continuous Improvement

### Metrics Tracking
- **Test coverage trends:** Monitor coverage over time
- **Defect rates:** Track bugs found in production vs. testing
- **Test execution time:** Optimize test performance
- **Flaky tests:** Identify and fix unreliable tests

### Process Refinement
- **Regular retrospectives:** Review testing effectiveness
- **Tool evaluation:** Assess and upgrade testing tools
- **Training updates:** Keep team skills current
- **Documentation maintenance:** Keep guidelines up to date
