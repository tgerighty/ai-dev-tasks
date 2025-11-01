# NANO-AGENTS

**Version**: 1.0.0 - Ultra-Minimal for Micro-Tasks
**Token Count**: ~2K (71% reduction from AGENTS.md)
**Purpose**: Surgical micro-task execution

---

## 🎯 QUICK REFERENCE

### Tech Stack
**Frontend**: Next.js 15, TypeScript, React, shadcn/ui, Tailwind
**Backend**: tRPC, PostgreSQL 18, Drizzle ORM, Valkey 8
**Auth**: Better Auth v1
**Test**: `npm test` | **Build**: `npm run build` | **Dev**: `npm run dev`

### Code Limits
| Item | Max | Ideal |
|------|-----|-------|
| File | 300 lines | <200 |
| Function | 50 lines | <30 |
| Params | 5 | ≤3 |
| Context | 500 lines | <200 |
| Micro-task | 30 min | 5-15 min |

---

## ⚡ ABSOLUTE RULES

1. **One file per micro-task** (exceptions rare)
2. **<500 lines context** (ideal <200)
3. **Test after each change** (compile minimum)
4. **Use existing patterns** (no invention)
5. **No `any` types** (explicit always)
6. **Validate inputs** (Zod schemas)
7. **No secrets in code** (use .env)
8. **Tests in /tests/** (never in src/)

---

## 📁 PROJECT STRUCTURE

```
src/
├── app/           # Next.js app router
├── components/    # React components
├── server/
│   ├── api/      # tRPC routers
│   ├── db/       # Drizzle schema
│   └── auth/     # Better Auth config
├── lib/          # Utilities
└── types/        # TypeScript types

tests/            # ALL tests here
├── unit/
├── integration/
└── e2e/
```

---

## 🔧 COMMON PATTERNS

### API Endpoint (tRPC)
```typescript
// src/server/api/routers/[feature].ts
export const featureRouter = createTRPCRouter({
  action: protectedProcedure
    .input(z.object({ /* schema */ }))
    .mutation(async ({ ctx, input }) => {
      // Implementation
    }),
});
```

### Database Query (Drizzle)
```typescript
// src/server/db/schema.ts
export const table = pgTable("table_name", {
  id: uuid("id").primaryKey().defaultRandom(),
  // fields
});

// Query
await db.select().from(table).where(eq(table.field, value));
```

### Component Pattern
```typescript
// src/components/feature.tsx
interface Props {
  // Explicit props
}

export function Component({ ...props }: Props) {
  // Implementation
}
```

### Auth Check
```typescript
// Using Better Auth
const session = await auth();
if (!session) throw new TRPCError({ code: "UNAUTHORIZED" });
```

---

## 📊 MICRO-TASK OUTPUT

**Always provide:**
```
Task: [What was done]
File: [Path modified]
Lines: [Count changed]
Status: [Success/Failed/Blocked]
Next: [Next micro-task ID or "Done"]
```

**On error:**
```
Error: [Message]
Fix: [Suggested solution]
Blocked by: [Dependency/issue]
```

---

## 🚀 EXECUTION FLOW

1. **Read micro-task** (e.g., MT 1.1)
2. **Load minimal context** (<500 lines)
3. **Make surgical change** (1 file)
4. **Verify works** (compile/test)
5. **Report status** (format above)
6. **Next micro-task** (or done)

---

## 🔍 VALIDATION CHECKLIST

Before marking complete:
- [ ] Code compiles
- [ ] Types explicit (no `any`)
- [ ] Inputs validated
- [ ] Pattern followed
- [ ] Tests pass (if exist)
- [ ] File <300 lines
- [ ] Function <50 lines

---

## 🎨 PATTERNS LIBRARY

### CRUD Operations
1. Schema → 2. API → 3. UI → 4. Tests

### Form Handling
1. Schema → 2. Component → 3. Validation → 4. Submit

### API Integration
1. Client → 2. Types → 3. Error handling → 4. Tests

### Report/Dashboard
1. Query → 2. Transform → 3. Display → 4. Export

### Authentication
1. Flow → 2. Guards → 3. Session → 4. Tests

---

## 🔗 REFERENCES

**Need details? Load on-demand:**
- Security: `/references/security/checklist.md`
- Testing: `/references/testing/patterns.md`
- Database: `/references/db/migrations.md`
- API: `/references/api/conventions.md`
- Git: `/references/git/workflow.md`

---

## 💡 REMEMBER

- **Small changes = fewer bugs**
- **One file = easier review**
- **Existing patterns = consistency**
- **Explicit types = catch errors early**
- **Test immediately = find issues fast**

**Focus**: Make it work → Make it right → Make it fast

---

*For full details, see AGENTS.md (7K tokens) or references/*