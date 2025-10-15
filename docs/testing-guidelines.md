# Testing Guidelines for AI Development

## Overview
This document provides comprehensive testing guidelines for AI-assisted development, ensuring consistent quality and reliability across all risk levels.

## Testing Philosophy

### Testing-as-Code Development
- **Write tests alongside code**: Create test files as you implement functionality
- **Test-first approach**: Write failing tests first, then make them pass (TDD)
- **Risk-based testing**: Apply appropriate testing levels based on task risk assessment
- **Evidence collection**: Generate and archive all testing evidence for audit and review

### Core Principles
1. **Every new feature requires tests**
2. **Bug fixes require regression tests**
3. **Tests must be deterministic and independent**
4. **Maintain appropriate coverage thresholds**
5. **Validate functionality through automated testing**

## Risk-Based Testing Requirements

### Critical Risk Tasks (4.5-5.0)

#### Testing Types Required
- **Unit Tests:** 95%+ coverage of business logic
- **Integration Tests:** All external integrations
- **E2E Tests:** Complete user workflows
- **Security Tests:** Vulnerability scanning and penetration testing
- **Performance Tests:** Load testing and benchmarking
- **Accessibility Tests:** WCAG AA compliance validation

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

### High Risk Tasks (3.6-4.4)

#### Testing Types Required
- **Unit Tests:** 90%+ coverage
- **Integration Tests:** Critical integrations
- **E2E Tests:** Key user workflows
- **Performance Tests:** Load testing and benchmarking

#### Testing Protocols
```bash
# High Risk Testing Protocol
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":90,"functions":90,"lines":90,"statements":90}}'
npm run test:integration
npm run test:e2e
npm run test:performance
```

#### Evidence Collection
- **Coverage Reports:** 90%+ coverage with detailed analysis
- **Test Results:** JSON and HTML reports
- **Performance Benchmarks:** Response time and throughput metrics

### Medium Risk Tasks (2.1-3.5)

#### Testing Types Required
- **Unit Tests:** 80%+ coverage
- **Integration Tests:** Major component interactions

#### Testing Protocols
```bash
# Medium Risk Testing Protocol
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":80,"functions":80,"lines":80,"statements":80}}'
npm run test:integration
```

#### Evidence Collection
- **Coverage Reports:** 80%+ coverage with analysis
- **Test Results:** JSON and HTML reports

### Low Risk Tasks (0.0-2.0)

#### Testing Types Required
- **Unit Tests:** 70%+ coverage

#### Testing Protocols
```bash
# Low Risk Testing Protocol
npm run test:unit -- --coverage --coverageThreshold='{"global":{"branches":70,"functions":70,"lines":70,"statements":70}}'
```

#### Evidence Collection
- **Coverage Reports:** 70%+ coverage
- **Basic Validation:** Manual verification

## Testing Best Practices

### Unit Testing
```typescript
// Good unit test example
describe('AuthService', () => {
  it('should authenticate valid credentials', async () => {
    // Arrange
    const credentials = { email: 'test@example.com', password: 'password123' };
    const expectedUser = { id: '123', email: 'test@example.com' };
    
    // Act
    const result = await authService.authenticate(credentials);
    
    // Assert
    expect(result.success).toBe(true);
    expect(result.user).toEqual(expectedUser);
  });

  it('should reject invalid credentials', async () => {
    // Arrange
    const credentials = { email: 'test@example.com', password: 'wrongpassword' };
    
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
    await page.fill('[data-testid=password]', 'password123');
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
