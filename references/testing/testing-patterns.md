# Testing Patterns

## Test Organization
```
tests/
├── unit/              # Fast, isolated tests
│   ├── components/    # React component tests
│   ├── utils/        # Utility function tests
│   └── schemas/      # Validation tests
├── integration/       # API and database tests
│   ├── api/         # tRPC endpoint tests
│   └── db/          # Database query tests
└── e2e/              # End-to-end tests
    └── flows/       # User journey tests
```

## Unit Testing

### Component Testing (React Testing Library)
```typescript
// tests/unit/components/button.test.tsx
import { render, fireEvent } from "@testing-library/react";
import { Button } from "@/components/ui/button";

describe("Button", () => {
  it("should render children", () => {
    const { getByText } = render(<Button>Click me</Button>);
    expect(getByText("Click me")).toBeInTheDocument();
  });

  it("should handle click events", () => {
    const handleClick = jest.fn();
    const { getByRole } = render(
      <Button onClick={handleClick}>Click me</Button>
    );

    fireEvent.click(getByRole("button"));
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  it("should be disabled when prop is true", () => {
    const { getByRole } = render(
      <Button disabled>Disabled</Button>
    );

    const button = getByRole("button");
    expect(button).toBeDisabled();
  });
});
```

### Utility Function Testing
```typescript
// tests/unit/utils/format.test.ts
import { formatCurrency, formatDate, slugify } from "@/lib/utils";

describe("formatCurrency", () => {
  it("should format USD correctly", () => {
    expect(formatCurrency(1234.56)).toBe("$1,234.56");
    expect(formatCurrency(0)).toBe("$0.00");
    expect(formatCurrency(-500)).toBe("-$500.00");
  });
});

describe("slugify", () => {
  it("should convert text to slug", () => {
    expect(slugify("Hello World")).toBe("hello-world");
    expect(slugify("  Multiple   Spaces  ")).toBe("multiple-spaces");
    expect(slugify("Special!@#Characters")).toBe("special-characters");
  });
});
```

### Schema Validation Testing
```typescript
// tests/unit/schemas/user.test.ts
import { userSchema } from "@/lib/schemas/user";

describe("userSchema", () => {
  it("should validate correct data", () => {
    const validData = {
      email: "test@example.com",
      name: "John Doe",
      age: 25,
    };

    const result = userSchema.safeParse(validData);
    expect(result.success).toBe(true);
  });

  it("should reject invalid email", () => {
    const invalidData = {
      email: "not-an-email",
      name: "John Doe",
      age: 25,
    };

    const result = userSchema.safeParse(invalidData);
    expect(result.success).toBe(false);
    expect(result.error?.issues[0].path).toContain("email");
  });
});
```

## Integration Testing

### API Endpoint Testing (tRPC)
```typescript
// tests/integration/api/users.test.ts
import { createInnerTRPCContext } from "@/server/api/trpc";
import { appRouter } from "@/server/api/root";
import { db } from "@/server/db";

describe("Users API", () => {
  let ctx: ReturnType<typeof createInnerTRPCContext>;
  let caller: ReturnType<typeof appRouter.createCaller>;

  beforeEach(async () => {
    // Reset database
    await db.delete(users);

    // Create context with mock session
    ctx = createInnerTRPCContext({
      session: {
        user: { id: "test-user-id", email: "test@example.com" },
        expires: "2099-01-01",
      },
    });

    caller = appRouter.createCaller(ctx);
  });

  it("should create a user", async () => {
    const user = await caller.users.create({
      name: "Test User",
      email: "newuser@example.com",
    });

    expect(user.name).toBe("Test User");
    expect(user.email).toBe("newuser@example.com");
  });

  it("should list users with pagination", async () => {
    // Create test data
    for (let i = 0; i < 15; i++) {
      await caller.users.create({
        name: `User ${i}`,
        email: `user${i}@example.com`,
      });
    }

    const page1 = await caller.users.list({ limit: 10, offset: 0 });
    expect(page1).toHaveLength(10);

    const page2 = await caller.users.list({ limit: 10, offset: 10 });
    expect(page2).toHaveLength(5);
  });

  it("should enforce authorization", async () => {
    const otherUserCtx = createInnerTRPCContext({
      session: {
        user: { id: "other-user", email: "other@example.com" },
        expires: "2099-01-01",
      },
    });
    const otherCaller = appRouter.createCaller(otherUserCtx);

    // Create resource as first user
    const resource = await caller.resources.create({ name: "Private" });

    // Try to access as other user
    await expect(
      otherCaller.resources.get({ id: resource.id })
    ).rejects.toThrow("FORBIDDEN");
  });
});
```

### Database Testing
```typescript
// tests/integration/db/queries.test.ts
import { db } from "@/server/db";
import { users, posts } from "@/server/db/schema";
import { eq, and, gte } from "drizzle-orm";

describe("Database Queries", () => {
  beforeEach(async () => {
    // Clean tables
    await db.delete(posts);
    await db.delete(users);
  });

  it("should handle transactions", async () => {
    await db.transaction(async (tx) => {
      const [user] = await tx.insert(users).values({
        email: "test@example.com",
        name: "Test User",
      }).returning();

      await tx.insert(posts).values({
        title: "First Post",
        content: "Content",
        authorId: user.id,
      });

      // Verify within transaction
      const userPosts = await tx
        .select()
        .from(posts)
        .where(eq(posts.authorId, user.id));

      expect(userPosts).toHaveLength(1);
    });
  });

  it("should handle complex queries", async () => {
    // Insert test data
    const [user1, user2] = await db.insert(users).values([
      { email: "user1@example.com", name: "User 1", createdAt: new Date("2024-01-01") },
      { email: "user2@example.com", name: "User 2", createdAt: new Date("2024-02-01") },
    ]).returning();

    // Query with conditions
    const recentUsers = await db
      .select()
      .from(users)
      .where(gte(users.createdAt, new Date("2024-01-15")));

    expect(recentUsers).toHaveLength(1);
    expect(recentUsers[0].id).toBe(user2.id);
  });
});
```

## E2E Testing

### User Flow Testing (Playwright)
```typescript
// tests/e2e/flows/auth.test.ts
import { test, expect } from "@playwright/test";

test.describe("Authentication Flow", () => {
  test("should sign up new user", async ({ page }) => {
    await page.goto("/signup");

    // Fill form
    await page.fill('input[name="email"]', "newuser@example.com");
    await page.fill('input[name="password"]', "SecurePass123!");
    await page.fill('input[name="confirmPassword"]', "SecurePass123!");

    // Submit
    await page.click('button[type="submit"]');

    // Verify redirect to dashboard
    await expect(page).toHaveURL("/dashboard");
    await expect(page.locator("h1")).toContainText("Welcome");
  });

  test("should handle login errors", async ({ page }) => {
    await page.goto("/login");

    // Try invalid credentials
    await page.fill('input[name="email"]', "wrong@example.com");
    await page.fill('input[name="password"]', "wrongpass");
    await page.click('button[type="submit"]');

    // Verify error message
    await expect(page.locator(".error-message")).toContainText("Invalid credentials");
  });
});
```

## Test Helpers & Mocks

### Mock Data Factory
```typescript
// tests/helpers/factory.ts
import { faker } from "@faker-js/faker";

export const createMockUser = (overrides = {}) => ({
  id: faker.string.uuid(),
  email: faker.internet.email(),
  name: faker.person.fullName(),
  createdAt: faker.date.past(),
  ...overrides,
});

export const createMockPost = (overrides = {}) => ({
  id: faker.string.uuid(),
  title: faker.lorem.sentence(),
  content: faker.lorem.paragraphs(),
  authorId: faker.string.uuid(),
  publishedAt: faker.date.recent(),
  ...overrides,
});
```

### Test Database Setup
```typescript
// tests/helpers/db.ts
import { db } from "@/server/db";

export async function resetDatabase() {
  // Clear all tables in correct order (respecting foreign keys)
  await db.delete(posts);
  await db.delete(users);
}

export async function seedDatabase() {
  const users = await db.insert(usersTable).values([
    { email: "admin@example.com", name: "Admin", role: "admin" },
    { email: "user@example.com", name: "User", role: "user" },
  ]).returning();

  return { users };
}
```

## Testing Best Practices

### 1. Test Structure
- **Arrange**: Set up test data and conditions
- **Act**: Execute the code being tested
- **Assert**: Verify the results

### 2. Test Isolation
- Each test should be independent
- Clean up after each test
- Don't rely on test execution order

### 3. Test Coverage Goals
- **Critical paths**: 100% coverage
- **Business logic**: 80%+ coverage
- **UI components**: Key interactions
- **Edge cases**: Based on risk

### 4. Test Naming
```typescript
// Good: Descriptive and specific
it("should return 404 when user does not exist", ...)
it("should validate email format before submission", ...)

// Bad: Vague or unclear
it("should work", ...)
it("test user", ...)
```

### 5. Async Testing
```typescript
// Always await async operations
it("should fetch data", async () => {
  const data = await fetchData();
  expect(data).toBeDefined();
});

// Use waitFor for UI updates
await waitFor(() => {
  expect(screen.getByText("Loaded")).toBeInTheDocument();
});
```