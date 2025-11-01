# Security Checklist

## Input Validation
- [ ] **All user inputs validated** with Zod or similar schema
- [ ] **SQL injection prevention** - Use parameterized queries only
- [ ] **XSS prevention** - Encode all output, use React's default escaping
- [ ] **Path traversal prevention** - Validate file paths
- [ ] **Command injection prevention** - Never pass user input to shell commands

## Authentication & Authorization
- [ ] **Authentication required** for protected routes
- [ ] **Authorization checks** - Verify user owns resource
- [ ] **Session management** - Secure cookies, proper timeouts
- [ ] **Password requirements** - Minimum 8 chars, complexity rules
- [ ] **Rate limiting** - Prevent brute force attacks

## Data Protection
- [ ] **Sensitive data encrypted** at rest
- [ ] **HTTPS only** in production
- [ ] **No secrets in code** - Use environment variables
- [ ] **No sensitive data in logs** - Redact passwords, tokens
- [ ] **CORS configured** properly

## Code Examples

### Input Validation
```typescript
// GOOD: Using Zod schema
const userInput = z.object({
  email: z.string().email(),
  age: z.number().min(0).max(150),
  role: z.enum(["user", "admin"]),
});

// BAD: No validation
const email = req.body.email; // DANGEROUS!
```

### SQL Injection Prevention
```typescript
// GOOD: Parameterized query
await db
  .select()
  .from(users)
  .where(eq(users.email, email));

// BAD: String concatenation
await db.execute(`SELECT * FROM users WHERE email = '${email}'`); // NEVER DO THIS!
```

### XSS Prevention
```typescript
// GOOD: React auto-escapes
<div>{userContent}</div>

// BAD: dangerouslySetInnerHTML without sanitization
<div dangerouslySetInnerHTML={{ __html: userContent }} /> // DANGEROUS!

// If HTML needed, sanitize first:
import DOMPurify from 'isomorphic-dompurify';
<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(userContent) }} />
```

### Authorization Check
```typescript
// GOOD: Verify ownership
const item = await db
  .select()
  .from(items)
  .where(and(
    eq(items.id, itemId),
    eq(items.userId, session.user.id) // Check ownership
  ));

if (!item) {
  throw new TRPCError({ code: "FORBIDDEN" });
}

// BAD: No ownership check
const item = await db
  .select()
  .from(items)
  .where(eq(items.id, itemId)); // Missing auth check!
```

### Environment Variables
```typescript
// GOOD: Using environment variables
const apiKey = process.env.API_KEY;
if (!apiKey) {
  throw new Error("API_KEY not configured");
}

// BAD: Hardcoded secrets
const apiKey = "sk-1234567890abcdef"; // NEVER DO THIS!
```

### Rate Limiting
```typescript
// Using express-rate-limit
import rateLimit from "express-rate-limit";

const loginLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // 5 requests per window
  message: "Too many login attempts, please try again later",
});

app.post("/api/login", loginLimiter, loginHandler);
```

### Secure Headers
```typescript
// Using helmet for Express
import helmet from "helmet";

app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      scriptSrc: ["'self'"],
      imgSrc: ["'self'", "data:", "https:"],
    },
  },
  hsts: {
    maxAge: 31536000,
    includeSubDomains: true,
    preload: true,
  },
}));
```

## Security Testing
- [ ] Run dependency audit: `npm audit`
- [ ] Check for secrets in code: `git secrets --scan`
- [ ] Test input validation with edge cases
- [ ] Verify auth on all protected routes
- [ ] Test rate limiting
- [ ] Check HTTPS redirect
- [ ] Verify CORS settings

## Common Vulnerabilities to Check
1. **OWASP Top 10**
   - Broken Access Control
   - Cryptographic Failures
   - Injection
   - Insecure Design
   - Security Misconfiguration
   - Vulnerable Components
   - Authentication Failures
   - Data Integrity Failures
   - Security Logging Failures
   - Server-Side Request Forgery

2. **Additional Checks**
   - CSRF tokens for state-changing operations
   - Clickjacking protection (X-Frame-Options)
   - Content-Type validation
   - File upload restrictions
   - API versioning and deprecation