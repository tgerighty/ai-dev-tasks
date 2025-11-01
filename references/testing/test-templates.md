# Test Generation Templates

## Component Test Template

```typescript
// tests/unit/components/[ComponentName].test.tsx
import { render, fireEvent, waitFor, screen } from '@testing-library/react';
import { [ComponentName] } from '@/components/[ComponentName]';

describe('[ComponentName]', () => {
  // Rendering tests
  it('should render without crashing', () => {
    const { container } = render(<[ComponentName] />);
    expect(container).toBeInTheDocument();
  });

  it('should display correct initial content', () => {
    const { getByText, getByRole } = render(
      <[ComponentName] title="Test Title" />
    );
    expect(getByText('Test Title')).toBeInTheDocument();
  });

  // Props tests
  it('should handle required props', () => {
    const props = {
      // Add required props
    };
    const { container } = render(<[ComponentName] {...props} />);
    expect(container).toBeInTheDocument();
  });

  // Interaction tests
  it('should handle click events', async () => {
    const handleClick = jest.fn();
    const { getByRole } = render(
      <[ComponentName] onClick={handleClick} />
    );

    fireEvent.click(getByRole('button'));
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  // State tests
  it('should update state on user input', async () => {
    const { getByLabelText, getByText } = render(<[ComponentName] />);
    const input = getByLabelText('input-label');

    fireEvent.change(input, { target: { value: 'new value' } });

    await waitFor(() => {
      expect(input.value).toBe('new value');
    });
  });

  // Error handling
  it('should handle error states', () => {
    const { getByText } = render(
      <[ComponentName] error="Something went wrong" />
    );
    expect(getByText('Something went wrong')).toBeInTheDocument();
  });

  // Loading states
  it('should show loading state', () => {
    const { getByTestId } = render(<[ComponentName] loading />);
    expect(getByTestId('loading-spinner')).toBeInTheDocument();
  });
});
```

## API Endpoint Test Template

```typescript
// tests/integration/api/[endpoint].test.ts
import { createInnerTRPCContext } from '@/server/api/trpc';
import { appRouter } from '@/server/api/root';
import { db } from '@/server/db';

describe('[EndpointName] API', () => {
  let ctx: ReturnType<typeof createInnerTRPCContext>;
  let caller: ReturnType<typeof appRouter.createCaller>;

  beforeEach(async () => {
    // Reset database
    await db.delete(tableName);

    // Create context with mock session
    ctx = createInnerTRPCContext({
      session: {
        user: { id: 'test-user-id', email: 'test@example.com' },
        expires: '2099-01-01',
      },
    });

    caller = appRouter.createCaller(ctx);
  });

  // CREATE tests
  describe('create', () => {
    it('should create a new item', async () => {
      const input = {
        // Add input data
      };

      const result = await caller.[endpoint].create(input);

      expect(result).toMatchObject({
        id: expect.any(String),
        ...input,
      });
    });

    it('should validate required fields', async () => {
      const invalidInput = {
        // Missing required fields
      };

      await expect(
        caller.[endpoint].create(invalidInput)
      ).rejects.toThrow('validation');
    });

    it('should enforce authorization', async () => {
      const unauthorizedCtx = createInnerTRPCContext({ session: null });
      const unauthorizedCaller = appRouter.createCaller(unauthorizedCtx);

      await expect(
        unauthorizedCaller.[endpoint].create({ /* data */ })
      ).rejects.toThrow('UNAUTHORIZED');
    });
  });

  // READ tests
  describe('list', () => {
    it('should return paginated results', async () => {
      // Create test data
      for (let i = 0; i < 15; i++) {
        await caller.[endpoint].create({ /* data */ });
      }

      const page1 = await caller.[endpoint].list({ limit: 10, offset: 0 });
      expect(page1).toHaveLength(10);

      const page2 = await caller.[endpoint].list({ limit: 10, offset: 10 });
      expect(page2).toHaveLength(5);
    });

    it('should filter by user', async () => {
      // Create data for different users
      const otherUserCtx = createInnerTRPCContext({
        session: { user: { id: 'other-user' } },
      });
      const otherCaller = appRouter.createCaller(otherUserCtx);

      await caller.[endpoint].create({ name: 'My Item' });
      await otherCaller.[endpoint].create({ name: 'Other Item' });

      const myItems = await caller.[endpoint].list({});
      expect(myItems).toHaveLength(1);
      expect(myItems[0].name).toBe('My Item');
    });
  });

  // UPDATE tests
  describe('update', () => {
    it('should update existing item', async () => {
      const created = await caller.[endpoint].create({ name: 'Original' });

      const updated = await caller.[endpoint].update({
        id: created.id,
        name: 'Updated',
      });

      expect(updated.name).toBe('Updated');
      expect(updated.id).toBe(created.id);
    });

    it('should not update items of other users', async () => {
      const created = await caller.[endpoint].create({ name: 'Original' });

      const otherUserCtx = createInnerTRPCContext({
        session: { user: { id: 'other-user' } },
      });
      const otherCaller = appRouter.createCaller(otherUserCtx);

      await expect(
        otherCaller.[endpoint].update({ id: created.id, name: 'Hacked' })
      ).rejects.toThrow('FORBIDDEN');
    });
  });

  // DELETE tests
  describe('delete', () => {
    it('should delete item', async () => {
      const created = await caller.[endpoint].create({ name: 'To Delete' });

      await caller.[endpoint].delete({ id: created.id });

      await expect(
        caller.[endpoint].get({ id: created.id })
      ).rejects.toThrow('NOT_FOUND');
    });

    it('should not delete items of other users', async () => {
      const created = await caller.[endpoint].create({ name: 'Protected' });

      const otherUserCtx = createInnerTRPCContext({
        session: { user: { id: 'other-user' } },
      });
      const otherCaller = appRouter.createCaller(otherUserCtx);

      await expect(
        otherCaller.[endpoint].delete({ id: created.id })
      ).rejects.toThrow('FORBIDDEN');
    });
  });
});
```

## Utility Function Test Template

```typescript
// tests/unit/utils/[utilityName].test.ts
import { [functionName] } from '@/lib/utils/[utilityName]';

describe('[functionName]', () => {
  // Happy path tests
  it('should handle normal input correctly', () => {
    const input = /* normal input */;
    const expected = /* expected output */;

    const result = [functionName](input);

    expect(result).toBe(expected);
  });

  // Edge cases
  it('should handle empty input', () => {
    expect([functionName]('')).toBe(/* expected */);
    expect([functionName]([])).toEqual(/* expected */);
    expect([functionName]({})).toEqual(/* expected */);
  });

  it('should handle null/undefined', () => {
    expect([functionName](null)).toBe(/* expected */);
    expect([functionName](undefined)).toBe(/* expected */);
  });

  it('should handle boundary values', () => {
    expect([functionName](0)).toBe(/* expected */);
    expect([functionName](-1)).toBe(/* expected */);
    expect([functionName](Number.MAX_VALUE)).toBe(/* expected */);
  });

  // Error cases
  it('should throw on invalid input', () => {
    expect(() => [functionName](/* invalid */)).toThrow('error message');
  });

  // Performance tests (if relevant)
  it('should handle large datasets efficiently', () => {
    const largeInput = Array(10000).fill(/* data */);

    const startTime = performance.now();
    const result = [functionName](largeInput);
    const endTime = performance.now();

    expect(endTime - startTime).toBeLessThan(100); // ms
    expect(result).toBeDefined();
  });
});
```

## Schema Validation Test Template

```typescript
// tests/unit/schemas/[schemaName].test.ts
import { [schemaName] } from '@/lib/schemas/[schemaName]';

describe('[schemaName] validation', () => {
  // Valid cases
  it('should accept valid data', () => {
    const validData = {
      // Complete valid object
    };

    const result = [schemaName].safeParse(validData);

    expect(result.success).toBe(true);
    if (result.success) {
      expect(result.data).toEqual(validData);
    }
  });

  it('should handle optional fields', () => {
    const minimalData = {
      // Only required fields
    };

    const result = [schemaName].safeParse(minimalData);
    expect(result.success).toBe(true);
  });

  // Field validation
  describe('field validation', () => {
    it('should validate email format', () => {
      const invalidEmail = { email: 'not-an-email' };
      const result = [schemaName].safeParse(invalidEmail);

      expect(result.success).toBe(false);
      if (!result.success) {
        expect(result.error.issues[0].path).toContain('email');
      }
    });

    it('should validate string length', () => {
      const tooShort = { name: 'a' };
      const result = [schemaName].safeParse(tooShort);

      expect(result.success).toBe(false);
      if (!result.success) {
        expect(result.error.issues[0].message).toContain('at least');
      }
    });

    it('should validate number ranges', () => {
      const outOfRange = { age: 150 };
      const result = [schemaName].safeParse(outOfRange);

      expect(result.success).toBe(false);
      if (!result.success) {
        expect(result.error.issues[0].message).toContain('maximum');
      }
    });
  });

  // Type coercion
  it('should coerce compatible types', () => {
    const stringNumber = { age: '25' };
    const result = [schemaName].safeParse(stringNumber);

    if (result.success) {
      expect(result.data.age).toBe(25);
      expect(typeof result.data.age).toBe('number');
    }
  });

  // Custom validations
  it('should run custom refinements', () => {
    const invalidCustom = {
      // Data that fails custom validation
    };

    const result = [schemaName].safeParse(invalidCustom);

    expect(result.success).toBe(false);
    if (!result.success) {
      expect(result.error.issues[0].message).toContain('custom error');
    }
  });
});
```

## Hook Test Template

```typescript
// tests/unit/hooks/[hookName].test.ts
import { renderHook, act, waitFor } from '@testing-library/react';
import { [hookName] } from '@/hooks/[hookName]';

describe('[hookName]', () => {
  // Initial state
  it('should return initial state', () => {
    const { result } = renderHook(() => [hookName]());

    expect(result.current.[value]).toBe(/* initial */);
    expect(result.current.[loading]).toBe(false);
    expect(result.current.[error]).toBeNull();
  });

  // State updates
  it('should update state when called', async () => {
    const { result } = renderHook(() => [hookName]());

    act(() => {
      result.current.[action]('new value');
    });

    await waitFor(() => {
      expect(result.current.[value]).toBe('new value');
    });
  });

  // Async operations
  it('should handle async operations', async () => {
    const { result } = renderHook(() => [hookName]());

    // Check loading state
    act(() => {
      result.current.[fetchData]();
    });

    expect(result.current.[loading]).toBe(true);

    // Wait for completion
    await waitFor(() => {
      expect(result.current.[loading]).toBe(false);
      expect(result.current.[data]).toBeDefined();
    });
  });

  // Error handling
  it('should handle errors', async () => {
    // Mock error
    jest.spyOn(global, 'fetch').mockRejectedValueOnce(new Error('Failed'));

    const { result } = renderHook(() => [hookName]());

    act(() => {
      result.current.[action]();
    });

    await waitFor(() => {
      expect(result.current.[error]).toBe('Failed');
      expect(result.current.[loading]).toBe(false);
    });
  });

  // Cleanup
  it('should cleanup on unmount', () => {
    const { result, unmount } = renderHook(() => [hookName]());

    // Start an operation
    act(() => {
      result.current.[startOperation]();
    });

    // Unmount
    unmount();

    // Verify cleanup (no memory leaks, listeners removed, etc.)
    // This is specific to what the hook does
  });
});
```

## E2E Test Template

```typescript
// tests/e2e/flows/[flowName].test.ts
import { test, expect } from '@playwright/test';

test.describe('[FlowName] User Flow', () => {
  test.beforeEach(async ({ page }) => {
    // Setup: navigate to start page, login if needed
    await page.goto('/');
    // Add any common setup
  });

  test('should complete happy path', async ({ page }) => {
    // Step 1: Initial action
    await page.click('[data-testid="start-button"]');
    await expect(page).toHaveURL('/step1');

    // Step 2: Fill form
    await page.fill('input[name="field1"]', 'value1');
    await page.fill('input[name="field2"]', 'value2');
    await page.click('button[type="submit"]');

    // Step 3: Verify result
    await expect(page.locator('.success-message')).toBeVisible();
    await expect(page.locator('.result')).toContainText('Expected Result');
  });

  test('should handle validation errors', async ({ page }) => {
    // Submit invalid data
    await page.fill('input[name="email"]', 'invalid-email');
    await page.click('button[type="submit"]');

    // Check error display
    await expect(page.locator('.error-message')).toContainText('Invalid email');
    await expect(page).toHaveURL('/form'); // Should stay on same page
  });

  test('should handle network errors', async ({ page }) => {
    // Simulate network failure
    await page.route('**/api/**', route => route.abort());

    // Try action
    await page.click('[data-testid="save-button"]');

    // Check error handling
    await expect(page.locator('.error-toast')).toContainText('Network error');
  });

  test('should be accessible', async ({ page }) => {
    // Check keyboard navigation
    await page.keyboard.press('Tab');
    await expect(page.locator(':focus')).toHaveAttribute('data-testid', 'first-input');

    // Check ARIA labels
    const button = page.locator('button[type="submit"]');
    await expect(button).toHaveAttribute('aria-label', /submit/i);
  });

  test('should work on mobile', async ({ page, viewport }) => {
    // Set mobile viewport
    await page.setViewportSize({ width: 375, height: 667 });

    // Check mobile menu
    await page.click('[data-testid="mobile-menu"]');
    await expect(page.locator('.mobile-nav')).toBeVisible();

    // Complete flow on mobile
    // ... mobile-specific interactions
  });
});
```

## Quick Test Generation Guide

### For a new component:
1. Use Component Test Template
2. Replace `[ComponentName]` with actual name
3. Add specific props for your component
4. Add component-specific interactions
5. Remove irrelevant test cases

### For a new API endpoint:
1. Use API Endpoint Test Template
2. Replace `[endpoint]` with actual endpoint name
3. Define your data structure
4. Add endpoint-specific validations
5. Test authorization rules

### For a utility function:
1. Use Utility Function Test Template
2. Define input/output examples
3. Add edge cases specific to function
4. Test error conditions
5. Add performance tests if needed

### Test Coverage Checklist:
- [ ] Happy path (normal operation)
- [ ] Edge cases (boundaries, empty)
- [ ] Error cases (invalid input)
- [ ] Authorization (if applicable)
- [ ] Loading states (if async)
- [ ] User interactions (if UI)
- [ ] Accessibility (if UI)
- [ ] Performance (if critical)