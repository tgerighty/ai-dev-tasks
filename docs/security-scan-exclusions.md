# Security Scan Exclusions for Test Folders

## Overview

This guide provides detailed instructions for configuring security scanning tools to exclude test folders from analysis. Test code often contains mock credentials, intentional vulnerabilities for testing, and test data that triggers false positives in security scanners.

## Table of Contents

1. [Why Exclude Test Folders?](#why-exclude-test-folders)
2. [Standard Test Folder Structure](#standard-test-folder-structure)
3. [Security Tool Configurations](#security-tool-configurations)
4. [Verification and Validation](#verification-and-validation)
5. [Common Issues and Solutions](#common-issues-and-solutions)
6. [Best Practices](#best-practices)

## Why Exclude Test Folders?

### False Positives
Test code frequently contains:
- Mock API keys and credentials
- Intentional SQL injection tests
- XSS attack simulations
- Hard-coded test data
- Vulnerability reproduction cases

### Performance Benefits
- Reduces scan time by 30-50%
- Decreases CI/CD pipeline duration
- Lowers resource consumption
- Speeds up development feedback loops

### Focus on Production Code
- Security tools should focus on production code
- Test code is never deployed to production
- Reduces noise in security reports
- Improves signal-to-noise ratio

### Cost Optimization
- Many security tools charge per scan or LOC
- Excluding tests reduces costs
- More efficient use of security tool quotas

## Standard Test Folder Structure

### Recommended Structure

```
project-root/
├── src/                    # Source code (NO tests here)
│   ├── components/
│   ├── services/
│   ├── utils/
│   └── lib/
├── tests/                  # Primary test directory
│   ├── unit/              # Unit tests
│   │   ├── components/
│   │   ├── services/
│   │   └── utils/
│   ├── integration/       # Integration tests
│   │   ├── api/
│   │   └── database/
│   └── e2e/               # End-to-end tests
│       ├── user-flows/
│       └── critical-paths/
├── __tests__/             # Alternative Jest pattern
│   ├── unit/
│   └── integration/
├── test/                  # Alternative pattern
│   ├── fixtures/          # Test data and fixtures
│   ├── mocks/             # Mock implementations
│   └── helpers/           # Test utilities
└── e2e/                   # Standalone E2E directory
    └── playwright/
```

### Test File Naming Conventions

**Unit Tests:**
- `*.test.ts`
- `*.test.tsx`
- `*.spec.ts`
- `*.spec.tsx`

**Integration Tests:**
- `*.integration.test.ts`
- `*.integration.spec.ts`

**E2E Tests:**
- `*.e2e.test.ts`
- `*.e2e.spec.ts`

## Security Tool Configurations

### Snyk

**Configuration File:** `.snyk`

```yaml
# Snyk configuration
exclude:
  # Test directories
  - tests/**
  - __tests__/**
  - test/**
  - e2e/**
  - cypress/**
  - spec/**
  
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
  - "**/test-utils/**"

vulnerabilities:
  ignore:
    # Example: Ignore test dependency vulnerabilities
    # - id: SNYK-JS-JEST-1234567
    #   reason: "Only used in tests"
    #   expires: "2025-12-31"
```

**CLI Usage:**
```bash
# Test with exclusions
snyk test --exclude=tests/,__tests__/,test/

# Monitor with exclusions
snyk monitor --exclude=tests/,__tests__/,test/
```

### SonarCloud / SonarQube

**Configuration File:** `sonar-project.properties`

```properties
# Project identification
sonar.projectKey=your-org_your-project
sonar.organization=your-org

# Source and test locations
sonar.sources=src
sonar.tests=tests,__tests__,test,e2e

# Exclude tests from analysis
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

# Exclude tests from coverage calculation
sonar.coverage.exclusions=\
  tests/**,\
  __tests__/**,\
  test/**,\
  e2e/**

# Coverage paths
sonar.javascript.lcov.reportPaths=coverage/lcov.info
sonar.typescript.lcov.reportPaths=coverage/lcov.info
```

### GitHub Advanced Security (CodeQL)

**Configuration File:** `.github/codeql/codeql-config.yml`

```yaml
name: "CodeQL Configuration"

queries:
  - uses: security-extended
  - uses: security-and-quality

paths-ignore:
  # Test directories
  - "tests/**"
  - "__tests__/**"
  - "test/**"
  - "e2e/**"
  - "cypress/**"
  
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

paths:
  - "src/**"
  - "lib/**"
  - "app/**"
```

**Workflow File:** `.github/workflows/codeql.yml`

```yaml
name: "CodeQL"

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    
    strategy:
      matrix:
        language: [ 'javascript', 'typescript' ]
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
      
      - name: Initialize CodeQL
        uses: github/codeql-action/init@v3
        with:
          languages: ${{ matrix.language }}
          config-file: ./.github/codeql/codeql-config.yml
      
      - name: Perform CodeQL Analysis
        uses: github/codeql-action/analyze@v3
```

### GitLab Security Scanning

**Configuration File:** `.gitlab-ci.yml`

```yaml
include:
  - template: Security/SAST.gitlab-ci.yml
  - template: Security/Dependency-Scanning.gitlab-ci.yml
  - template: Security/Secret-Detection.gitlab-ci.yml

sast:
  variables:
    SAST_EXCLUDED_PATHS: >
      tests/,
      __tests__/,
      test/,
      e2e/,
      cypress/,
      **/*.test.ts,
      **/*.spec.ts,
      **/fixtures/**,
      **/mocks/**

dependency_scanning:
  variables:
    DS_EXCLUDED_PATHS: >
      tests/,
      __tests__/,
      test/,
      e2e/

secret_detection:
  variables:
    SECRET_DETECTION_EXCLUDED_PATHS: >
      tests/,
      __tests__/,
      test/,
      **/fixtures/**,
      **/mocks/**
```

### Checkmarx / Fortify / Veracode

**Checkmarx Configuration:** `.checkmarx/cx.config`

```json
{
  "project": "your-project",
  "exclude": {
    "folders": [
      "tests",
      "__tests__",
      "test",
      "e2e",
      "cypress",
      "fixtures",
      "mocks"
    ],
    "files": [
      "*.test.ts",
      "*.test.tsx",
      "*.spec.ts",
      "*.spec.tsx",
      "*.e2e.test.ts"
    ]
  }
}
```

**Fortify Configuration:** `fortify.properties`

```properties
# Exclude test directories
com.fortify.sca.exclude=tests/**,__tests__/**,test/**,e2e/**,**/fixtures/**,**/mocks/**

# Exclude test files
com.fortify.sca.exclude.pattern=**/*.test.ts,**/*.spec.ts,**/*.test.tsx,**/*.spec.tsx
```

### ESLint Security Plugin

**Configuration File:** `.eslintrc.json`

```json
{
  "extends": [
    "plugin:security/recommended"
  ],
  "ignorePatterns": [
    "tests/**",
    "__tests__/**",
    "test/**",
    "e2e/**",
    "cypress/**",
    "**/*.test.ts",
    "**/*.test.tsx",
    "**/*.spec.ts",
    "**/*.spec.tsx",
    "**/fixtures/**",
    "**/mocks/**"
  ],
  "rules": {
    "security/detect-object-injection": "warn",
    "security/detect-non-literal-regexp": "warn"
  }
}
```

### npm audit / yarn audit

**Configuration File:** `.npmrc` or `.yarnrc.yml`

```ini
# .npmrc
audit-level=moderate
omit=dev
```

```yaml
# .yarnrc.yml
auditLevel: moderate
excludePackages:
  - "@types/jest"
  - "@types/testing-library__react"
  - "vitest"
  - "playwright"
```

## Verification and Validation

### Manual Verification Commands

**Find all test files:**
```bash
find . -name "*.test.ts" -o -name "*.spec.ts" -o -name "*.e2e.test.ts"
```

**Verify tests are in test folders:**
```bash
find tests __tests__ test e2e -name "*.test.ts" -o -name "*.spec.ts"
```

**Check for test files in src/ (should return empty):**
```bash
find src -name "*.test.ts" -o -name "*.spec.ts"
```

### Automated Validation Script

Create `scripts/validate-test-organization.sh`:

```bash
#!/bin/bash

set -e

echo "Validating test organization..."

# Check for test files in src/
if find src -name "*.test.ts" -o -name "*.spec.ts" | grep -q .; then
  echo "❌ ERROR: Test files found in src/ directory"
  find src -name "*.test.ts" -o -name "*.spec.ts"
  exit 1
fi

# Verify tests exist in proper directories
if ! find tests __tests__ test e2e -name "*.test.ts" -o -name "*.spec.ts" 2>/dev/null | grep -q .; then
  echo "⚠️  WARNING: No test files found in test directories"
fi

# Check for proper test folder structure
if [ ! -d "tests" ] && [ ! -d "__tests__" ] && [ ! -d "test" ]; then
  echo "❌ ERROR: No standard test directory found (tests/, __tests__/, or test/)"
  exit 1
fi

echo "✅ Test organization validation passed"
```

### CI/CD Integration

**GitHub Actions:**
```yaml
name: Validate Test Organization

on:
  pull_request:
  push:
    branches: [ main, develop ]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Validate test organization
        run: |
          chmod +x scripts/validate-test-organization.sh
          ./scripts/validate-test-organization.sh
```

## Common Issues and Solutions

### Issue 1: Tests Still Being Scanned

**Problem:** Security tools are still scanning test files despite exclusion configuration.

**Solutions:**
1. Verify configuration file is in project root
2. Check file naming matches exclusion patterns
3. Ensure no spaces in path exclusions
4. Use absolute paths instead of relative paths
5. Clear security tool cache and re-run scan

### Issue 2: Exclusion Patterns Not Working

**Problem:** Glob patterns not matching expected files.

**Solutions:**
1. Use double asterisks for recursive matching (`**/*.test.ts`)
2. Ensure proper escaping in YAML/JSON
3. Test patterns with command-line glob tools
4. Check for trailing slashes in directory patterns

### Issue 3: False Positives from Test Fixtures

**Problem:** Mock credentials in test fixtures triggering security alerts.

**Solutions:**
1. Exclude fixtures directory explicitly
2. Use environment variables for test credentials
3. Add comments indicating mock data: `// MOCK_CREDENTIAL_FOR_TESTING`
4. Configure specific vulnerability ignore rules

### Issue 4: CI/CD Pipeline Failures

**Problem:** Security scans failing in CI/CD despite local success.

**Solutions:**
1. Ensure configuration files are committed to version control
2. Verify CI/CD environment has access to configuration files
3. Check that exclusion paths are relative to project root
4. Review CI/CD logs for configuration parsing errors

## Best Practices

### 1. Consistent Test Organization
- Use standard test folder names (`tests/`, `__tests__/`, `test/`)
- Never co-locate tests with source code in `src/`
- Organize tests by type (unit, integration, e2e)
- Use consistent naming conventions

### 2. Version Control Configuration Files
- Commit all security tool configuration files
- Document exclusion rationale in comments
- Review exclusions during code reviews
- Update exclusions when test structure changes

### 3. Regular Validation
- Add test organization validation to CI/CD
- Run validation before security scans
- Monitor for test files in source directories
- Audit exclusion patterns quarterly

### 4. Documentation
- Document test folder structure in README
- Explain exclusion rationale in configuration files
- Provide examples for common scenarios
- Update documentation when changing structure

### 5. Team Communication
- Educate team on test organization importance
- Include test organization in onboarding
- Review test placement in code reviews
- Share security scan reports regularly

### 6. Maintenance
- Review exclusion patterns with security team
- Update patterns when adding new test frameworks
- Clean up unused exclusion patterns
- Monitor for configuration drift

## Example Complete Setup

### Project Structure
```
my-project/
├── .github/
│   ├── codeql/
│   │   └── codeql-config.yml
│   └── workflows/
│       ├── codeql.yml
│       └── validate-tests.yml
├── src/
│   ├── components/
│   ├── services/
│   └── utils/
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── scripts/
│   └── validate-test-organization.sh
├── .snyk
├── .eslintrc.json
├── sonar-project.properties
└── README.md
```

### Configuration Checklist

- [ ] `.snyk` configured with test exclusions
- [ ] `sonar-project.properties` configured with test exclusions
- [ ] `.github/codeql/codeql-config.yml` configured with test exclusions
- [ ] `.eslintrc.json` ignores test patterns
- [ ] `.gitlab-ci.yml` SAST excludes test folders (if using GitLab)
- [ ] Test organization validation script created
- [ ] CI/CD includes test organization validation
- [ ] All configuration files committed to version control
- [ ] Team documentation updated
- [ ] README includes test organization guidelines

## Resources

### Documentation Links
- [Snyk CLI Documentation](https://docs.snyk.io/snyk-cli)
- [SonarCloud Analysis Parameters](https://docs.sonarcloud.io/advanced-setup/analysis-parameters/)
- [GitHub CodeQL Configuration](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/customizing-code-scanning)
- [GitLab SAST Configuration](https://docs.gitlab.com/ee/user/application_security/sast/)

### Example Projects
- See `examples/` directory for complete configuration examples
- Review `docs/testing-guidelines.md` for comprehensive testing approach

### Support
- For questions, open an issue on GitHub
- Review security tool vendor documentation
- Consult with your security team for organization-specific requirements
