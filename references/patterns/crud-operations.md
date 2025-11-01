# CRUD Operations Pattern

## Implementation Order
1. **Database Schema** - Define data model
2. **API Endpoints** - Create CRUD operations
3. **UI Components** - Build interface
4. **Tests** - Validate functionality

## Database Schema (Drizzle)
```typescript
// src/server/db/schema.ts
export const items = pgTable("items", {
  id: uuid("id").primaryKey().defaultRandom(),
  name: varchar("name", { length: 255 }).notNull(),
  description: text("description"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
  userId: uuid("user_id").references(() => users.id),
});
```

## API Endpoints (tRPC)
```typescript
// src/server/api/routers/items.ts
export const itemsRouter = createTRPCRouter({
  // CREATE
  create: protectedProcedure
    .input(z.object({
      name: z.string().min(1).max(255),
      description: z.string().optional(),
    }))
    .mutation(async ({ ctx, input }) => {
      return await ctx.db.insert(items).values({
        ...input,
        userId: ctx.session.user.id,
      }).returning();
    }),

  // READ (List)
  list: protectedProcedure
    .input(z.object({
      limit: z.number().min(1).max(100).default(10),
      offset: z.number().min(0).default(0),
    }))
    .query(async ({ ctx, input }) => {
      return await ctx.db
        .select()
        .from(items)
        .where(eq(items.userId, ctx.session.user.id))
        .limit(input.limit)
        .offset(input.offset);
    }),

  // READ (Single)
  get: protectedProcedure
    .input(z.object({ id: z.string().uuid() }))
    .query(async ({ ctx, input }) => {
      const item = await ctx.db
        .select()
        .from(items)
        .where(and(
          eq(items.id, input.id),
          eq(items.userId, ctx.session.user.id)
        ))
        .limit(1);

      if (!item[0]) {
        throw new TRPCError({ code: "NOT_FOUND" });
      }
      return item[0];
    }),

  // UPDATE
  update: protectedProcedure
    .input(z.object({
      id: z.string().uuid(),
      name: z.string().min(1).max(255).optional(),
      description: z.string().optional(),
    }))
    .mutation(async ({ ctx, input }) => {
      const { id, ...data } = input;
      const updated = await ctx.db
        .update(items)
        .set({ ...data, updatedAt: new Date() })
        .where(and(
          eq(items.id, id),
          eq(items.userId, ctx.session.user.id)
        ))
        .returning();

      if (!updated[0]) {
        throw new TRPCError({ code: "NOT_FOUND" });
      }
      return updated[0];
    }),

  // DELETE
  delete: protectedProcedure
    .input(z.object({ id: z.string().uuid() }))
    .mutation(async ({ ctx, input }) => {
      const deleted = await ctx.db
        .delete(items)
        .where(and(
          eq(items.id, input.id),
          eq(items.userId, ctx.session.user.id)
        ))
        .returning();

      if (!deleted[0]) {
        throw new TRPCError({ code: "NOT_FOUND" });
      }
      return deleted[0];
    }),
});
```

## UI Components (React)
```typescript
// src/components/items/items-list.tsx
export function ItemsList() {
  const { data: items, isLoading } = api.items.list.useQuery({
    limit: 20,
    offset: 0,
  });

  const deleteMutation = api.items.delete.useMutation({
    onSuccess: () => {
      utils.items.list.invalidate();
      toast.success("Item deleted");
    },
  });

  if (isLoading) return <Skeleton />;

  return (
    <div className="space-y-4">
      {items?.map((item) => (
        <ItemCard
          key={item.id}
          item={item}
          onDelete={() => deleteMutation.mutate({ id: item.id })}
        />
      ))}
    </div>
  );
}
```

## Tests
```typescript
// tests/integration/items.test.ts
describe("Items CRUD", () => {
  it("should create an item", async () => {
    const item = await caller.items.create({
      name: "Test Item",
      description: "Test Description",
    });
    expect(item.name).toBe("Test Item");
  });

  it("should list items", async () => {
    const items = await caller.items.list({ limit: 10 });
    expect(Array.isArray(items)).toBe(true);
  });

  it("should update an item", async () => {
    const updated = await caller.items.update({
      id: itemId,
      name: "Updated Name",
    });
    expect(updated.name).toBe("Updated Name");
  });

  it("should delete an item", async () => {
    const deleted = await caller.items.delete({ id: itemId });
    expect(deleted.id).toBe(itemId);
  });
});
```

## Micro-Task Breakdown
1. **MT 1.1**: Create database schema (15 min)
2. **MT 1.2**: Create tRPC router with create endpoint (20 min)
3. **MT 1.3**: Add list and get endpoints (15 min)
4. **MT 1.4**: Add update and delete endpoints (15 min)
5. **MT 1.5**: Create list UI component (20 min)
6. **MT 1.6**: Create form UI component (20 min)
7. **MT 1.7**: Add edit functionality (15 min)
8. **MT 1.8**: Write integration tests (20 min)