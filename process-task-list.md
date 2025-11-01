# Processing Task Lists - Focused Micro-Task Approach

**Version:** 2.1
**Last Updated:** 2025-10-31
**Previous Version:** Archived in `/archive/process-task-list-v1.0-20251031.md`

## Goal
Guide AI assistants in implementing tasks through focused micro-tasks, ensuring precise, surgical changes with minimal context to prevent errors and maintain quality.

## Core Philosophy
- **Micro-task precision** - Break everything into small, focused units
- **One file per task** - Each micro-task touches one file when possible
- **Minimal context** - Small context prevents drift and errors
- **Surgical changes** - Specific, targeted modifications
- **Quality through focus** - Better results from constrained scope

## Why Micro-Tasks Matter

Micro-tasks are essential because:
1. **Less sophisticated models need specificity** - Clear, narrow scope prevents confusion
2. **Small context = better accuracy** - Models perform better with focused context
3. **One task, one file** - Reduces chance of unintended side effects
4. **Easier to validate** - Small changes are easier to test and verify
5. **Prevents drift** - Constrained scope keeps models on track

## The Micro-Task Implementation Process

### Step 1: Load and Analyze

```
1. Load the task list
2. Identify all tasks and their complexity
3. Plan micro-task breakdown for EVERY task
4. Map dependencies between micro-tasks
```

### Step 2: Universal Micro-Task Breakdown

**ALL tasks get broken into micro-tasks, regardless of complexity:**

#### Simple Task (Complexity 1-2) → 2-3 Micro-tasks
```
Example: "Add dark mode toggle"
├── Micro-task 1: Add toggle component to settings.tsx
├── Micro-task 2: Connect toggle to theme context in theme.ts
└── Micro-task 3: Add localStorage persistence in storage.ts
```

#### Moderate Task (Complexity 3) → 4-6 Micro-tasks
```
Example: "Implement form validation"
├── Micro-task 1: Create validation rules in validators.ts
├── Micro-task 2: Add validation to form component in form.tsx
├── Micro-task 3: Create error display component in errors.tsx
├── Micro-task 4: Add validation triggers in handlers.ts
├── Micro-task 5: Update form styles in form.css
└── Micro-task 6: Add validation tests in form.test.ts
```

#### Complex Task (Complexity 4+) → 6-10 Micro-tasks
```
Example: "Add authentication"
├── Micro-task 1: Create auth types in types/auth.ts
├── Micro-task 2: Add auth context in contexts/auth.tsx
├── Micro-task 3: Create login component in components/login.tsx
├── Micro-task 4: Add auth API calls in api/auth.ts
├── Micro-task 5: Create auth middleware in middleware/auth.ts
├── Micro-task 6: Add protected route wrapper in routes/protected.tsx
├── Micro-task 7: Update app router in app.tsx
├── Micro-task 8: Add auth utils in utils/auth.ts
├── Micro-task 9: Create auth tests in auth.test.ts
└── Micro-task 10: Update main layout in layout.tsx
```

### Step 3: Micro-Task Execution Pattern

For each micro-task, follow this focused pattern:

```
MICRO-TASK EXECUTION:
1. Define specific change (1 file, 1 purpose)
2. Load ONLY relevant context
3. Make surgical change
4. Verify change works
5. Move to next micro-task
```

#### Example Micro-Task Execution

```
Micro-task 2.3: Add email validation to form
Target file: validators.ts
Context needed: Email validation regex pattern
Specific change: Add validateEmail function
Lines affected: ~10-15 lines

Implementation:
1. Open validators.ts
2. Add email validation function
3. Export the function
4. Verify it validates correctly
5. Done - move to next
```

### Step 4: Context Management for Micro-Tasks

Keep context minimal and focused:

#### Good Context (Focused)
```
For micro-task: "Add user avatar to header"
Context provided:
- Current header.tsx structure
- Avatar component API
- User data shape
- Where avatar should appear
Total context: <500 lines
```

#### Bad Context (Too Broad)
```
For same micro-task:
Context provided:
- Entire application structure
- All components
- Full user system
- Complete styling system
Total context: >5000 lines (TOO MUCH!)
```

### Step 5: Micro-Task Templates by Type

Common micro-task patterns with specific focus:

#### UI Component Micro-Tasks
```
1. Create component file (component.tsx)
2. Add props interface (types.ts)
3. Add styles (component.css)
4. Add to parent (parent.tsx)
5. Add story/demo (component.stories.tsx)
```

#### API Endpoint Micro-Tasks
```
1. Define route (routes.ts)
2. Add types (api-types.ts)
3. Create handler (handlers/endpoint.ts)
4. Add validation (validators/endpoint.ts)
5. Add to router (router.ts)
6. Add tests (endpoint.test.ts)
```

#### Database Change Micro-Tasks
```
1. Create migration (migrations/001_change.sql)
2. Update schema types (schema.ts)
3. Update queries (queries/table.ts)
4. Update models (models/table.ts)
5. Run migration (execute)
6. Verify data (test query)
```

#### State Management Micro-Tasks
```
1. Add state slice (store/slice.ts)
2. Create actions (actions/feature.ts)
3. Create reducers (reducers/feature.ts)
4. Add selectors (selectors/feature.ts)
5. Connect to component (component.tsx)
6. Add tests (slice.test.ts)
```

## AI Assistant Micro-Task Guide

### Starting Implementation

```
"I'll implement this feature using focused micro-tasks for precision.

Task: Add user profile editing (Complexity: 3)

Breaking into 5 micro-tasks:
1. Create profile form component - profile-form.tsx (20 min)
2. Add validation rules - validators/profile.ts (15 min)
3. Create API endpoint - api/profile.ts (20 min)
4. Connect form to API - profile-form.tsx (15 min)
5. Add success feedback - profile-form.tsx (10 min)

Starting with Micro-task 1..."
```

### During Micro-Task Execution

```
"Micro-task 1: Create profile form component
Target: components/profile-form.tsx
Context: Need form with name, email, bio fields
Action: Creating new component file

[Make focused change]

✓ Micro-task 1 complete: Form component created
Moving to Micro-task 2..."
```

### Micro-Task Status Tracking

```markdown
## Task 2.0: User Profile Editing

### Micro-Tasks:
- [x] MT 2.1: Create form component (profile-form.tsx)
- [x] MT 2.2: Add validation (validators/profile.ts)
- [→] MT 2.3: Create API endpoint (api/profile.ts)
- [ ] MT 2.4: Connect form to API
- [ ] MT 2.5: Add success feedback

Progress: 2/5 complete (40%)
Current: Creating API endpoint
```

## Best Practices for Micro-Tasks

### 1. Keep Scope Narrow
```
Good: "Add email validation function to validators.ts"
Bad: "Add all validation to the form"
```

### 2. One File When Possible
```
Good: "Update header.tsx to include avatar"
Bad: "Update header, nav, and footer components"
```

### 3. Specific Line Targets
```
Good: "Add validateEmail function at line 45 in validators.ts"
Bad: "Add validation somewhere in the file"
```

### 4. Clear Success Criteria
```
Good: "Function returns true for valid@email.com"
Bad: "Make validation work"
```

### 5. Minimal Dependencies
```
Good: "Import only EmailValidator type"
Bad: "Import entire validation library"
```

## Micro-Task Patterns for Common Features

### Adding a Button
```
Micro-tasks:
1. Add button to UI file (button location)
2. Add click handler (handler file)
3. Add button styles (CSS file)
Time: ~30 minutes total
```

### Creating a Form
```
Micro-tasks:
1. Create form component structure
2. Add form fields
3. Add validation rules
4. Create submit handler
5. Add error display
6. Add success feedback
Time: ~2 hours total
```

### Adding API Endpoint
```
Micro-tasks:
1. Define route in router
2. Create handler function
3. Add input validation
4. Add business logic
5. Add error handling
6. Add response formatting
7. Add endpoint tests
Time: ~2-3 hours total
```

### Database Table Creation
```
Micro-tasks:
1. Create migration file
2. Define table schema
3. Create model file
4. Add CRUD queries
5. Add model types
6. Run migration
7. Verify with test data
Time: ~2-3 hours total
```

## Handling Dependencies Between Micro-Tasks

Some micro-tasks depend on others:

```
Dependency Chain Example:
MT 1: Create types (types.ts)
    ↓ blocks
MT 2: Create component using types (component.tsx)
    ↓ blocks
MT 3: Create tests for component (component.test.tsx)

Parallel Example:
MT 1: Add button ─┐
MT 2: Add styles  ├─→ MT 4: Test complete feature
MT 3: Add handler ─┘
```

## Risk-Based Testing Within Micro-Tasks

Apply testing based on risk, but at micro-task level:

#### High Risk Micro-Tasks
```
Example: Payment processing function
Micro-task includes:
- Implementation (10 lines)
- Unit test (20 lines)
- Edge case test (15 lines)
- Security check (5 lines)
```

#### Medium Risk Micro-Tasks
```
Example: Form validation
Micro-task includes:
- Implementation (15 lines)
- Basic test (10 lines)
- Error case test (10 lines)
```

#### Low Risk Micro-Tasks
```
Example: Add CSS class
Micro-task includes:
- Implementation (2 lines)
- Visual verification (manual)
```

## Progress Reporting Template

```markdown
## Current Status

### Active Task: User Authentication
Complexity: 4
Total Micro-tasks: 8
Completed: 5
In Progress: 1
Remaining: 2

### Completed Micro-Tasks:
✓ MT 1: Auth types defined (types/auth.ts)
✓ MT 2: Auth context created (contexts/auth.tsx)
✓ MT 3: Login component built (components/login.tsx)
✓ MT 4: API calls added (api/auth.ts)
✓ MT 5: Middleware created (middleware/auth.ts)

### Current Micro-Task:
→ MT 6: Adding protected routes (routes/protected.tsx)
  - Started: 10:30 AM
  - Est. completion: 10:45 AM
  - Status: 70% complete

### Remaining:
- MT 7: Update app router
- MT 8: Add tests

Estimated time to complete: 45 minutes
```

## Common Pitfalls to Avoid

### 1. Micro-Tasks Too Large
❌ "Implement entire authentication system"
✓ "Add login function to auth.ts"

### 2. Multiple Files in One Micro-Task
❌ "Update all components to use new theme"
✓ "Update header.tsx to use theme"

### 3. Vague Specifications
❌ "Make it work better"
✓ "Fix null check on line 45"

### 4. Missing Context
❌ "Add the thing"
✓ "Add user avatar (32x32px) to header right corner"

### 5. No Success Criteria
❌ "Update the function"
✓ "Function should return user object with id, name, email"

## Quick Reference

### Micro-Task Size Guide
- **Tiny:** 1-10 lines (5 min)
- **Small:** 10-30 lines (10-15 min)
- **Medium:** 30-50 lines (15-30 min)
- **Large:** 50-100 lines (30-45 min)
- **Too Large:** >100 lines (SPLIT IT!)

### Files Per Micro-Task
- **Ideal:** 1 file
- **Acceptable:** 2 files (if tightly coupled)
- **Maximum:** 3 files (only if necessary)
- **Too Many:** 4+ files (SPLIT IT!)

### Context Size Guide
- **Ideal:** <200 lines
- **Good:** 200-500 lines
- **Acceptable:** 500-1000 lines
- **Too Much:** >1000 lines (REDUCE!)

## Summary: Why This Approach Works

**The Problem:**
- Large tasks with broad context lead to errors
- Less sophisticated models get confused with too much scope
- Unfocused changes create unexpected side effects

**The Solution:**
- Micro-tasks with focused scope
- One file per change when possible
- Minimal context prevents drift
- Surgical precision improves quality

**The Result:**
- More accurate implementation
- Fewer errors and side effects
- Easier to test and verify
- Better results with any model sophistication level

The key is: **Small context + Specific task = Better results**

## Version History

- **v2.1 (2025-10-31):** Focused micro-task approach with minimal context
- **v2.0 (2025-10-31):** Implementation-focused approach with adaptive complexity
- **v1.0 (Original):** Micro-task grinding with extensive delegation and evidence collection