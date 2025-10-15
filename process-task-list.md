# Task List Management

Guidelines for managing task lists in markdown files to track progress on completing a PRD

## Risk-Based Task Implementation

Tasks are implemented based on their risk level, with appropriate testing and evidence collection requirements.

### Risk-Based Implementation Protocol

#### Critical Risk Tasks (4.5-5.0)
- **Testing Requirements:** Unit + Integration + E2E + Security + Performance + Accessibility (95%+ coverage)
- **Evidence Collection:** All test reports + security audit + performance benchmarks
- **Review Process:** Security + Performance + Accessibility + Code reviews
- **Timeline:** +50% buffer for comprehensive testing

#### High Risk Tasks (3.6-4.4)
- **Testing Requirements:** Unit + Integration + E2E + Performance (90%+ coverage)
- **Evidence Collection:** All test reports + performance benchmarks
- **Review Process:** Performance + Code reviews
- **Timeline:** +30% buffer for thorough testing

#### Medium Risk Tasks (2.1-3.5)
- **Testing Requirements:** Unit + Integration (80%+ coverage)
- **Evidence Collection:** Unit + Integration test reports
- **Review Process:** Code review
- **Timeline:** +15% buffer for standard testing

#### Low Risk Tasks (0.0-2.0)
- **Testing Requirements:** Unit Tests Only (70%+ coverage)
- **Evidence Collection:** Unit test reports
- **Review Process:** Basic validation
- **Timeline:** Standard timeline

## Task Implementation Protocol

### Risk-Based Completion Steps
1. **Before Starting:** Identify task risk level and required testing
2. **During Implementation:** Follow risk-appropriate testing requirements
3. **Evidence Collection:** Gather required evidence based on risk level
4. **Review Process:** Complete required reviews for risk level
5. **Progress Tracking:** Update risk-level specific progress metrics

### Risk-Based Testing Execution
- **Critical Risk:** Run full test suite including security and performance tests
- **High Risk:** Run unit, integration, E2E, and performance tests
- **Medium Risk:** Run unit and integration tests
- **Low Risk:** Run unit tests only

### Evidence Collection Requirements
- **Critical Risk:** Collect all test reports, security audit, performance benchmarks
- **High Risk:** Collect test reports and performance benchmarks
- **Medium Risk:** Collect unit and integration test reports
- **Low Risk:** Collect unit test reports only

## Task Implementation
- **One sub-task at a time:** Do **NOT** start the next sub‑task until you ask the user for permission and they say "yes" or "y"
- **Risk-aware completion:** Follow risk-level specific protocols
- **Completion protocol:**  
  1. When you finish a **sub‑task**, immediately mark it as completed by changing `[ ]` to `[x]`.
  2. If **all** subtasks underneath a parent task are now `[x]`, follow this sequence:
    - **First**: Run the appropriate test suite based on risk level
    - **Evidence Collection**: Gather required evidence based on risk level
    - **Only if all tests pass**: Stage changes (`git add .`)
    - **Clean up**: Remove any temporary files and temporary code before committing
    - **Commit**: Use a descriptive commit message that:
      - Uses conventional commit format (`feat:`, `fix:`, `refactor:`, etc.)
      - Summarizes what was accomplished in the parent task
      - Lists key changes and additions
      - References the task number and PRD context
      - **Formats the message as a single-line command using `-m` flags**, e.g.:

        ```
        git commit -m "feat: add payment validation logic" -m "- Validates card type and expiry" -m "- Adds unit tests for edge cases" -m "Related to T123 in PRD"
        ```
  3. Once all the subtasks are marked completed and changes have been committed, mark the **parent task** as completed.

Current TODO List:
completed [high] Review current create-prd.md, generate-tasks.md, and process-task-list.md files
in_progress [high] Integrate risk assessment framework into create-prd.md
pending [high] Add risk-based task prioritization to generate-tasks.md
pending [high] Include risk-based testing requirements in process-task-list.md
pending [medium] Remove separate risk-based testing files after integration