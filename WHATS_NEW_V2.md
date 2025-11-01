# 🎉 What's New in AI Dev Tasks v2

## TL;DR
**50-70% faster, simpler, more accurate.** Discovery questions instead of forms, pattern matching instead of manual scoring, micro-tasks for precision.

## 🔄 Major Changes

### PRD Creation (create-prd.md v2.0)
**Before:** 45-60 minutes, 45+ questions, risk workshops
**Now:** 15-30 minutes with discovery-driven questions
- Starts with "Tell me about the problem"
- Progressive questions based on answers
- Right-sized output (Micro/Standard/Full)
- No more risk workshops

### Task Generation (generate-tasks.md v2.0)
**Before:** Manual complexity scoring, risk assessment
**Now:** Pattern-based with AI reasoning
- Recognizes common patterns (CRUD, Forms, APIs)
- AI explains complexity scores
- Provides time estimates
- Inherits risk from PRD (no re-assessment)

### Task Processing (process-task-list.md v2.1)
**Before:** Complex delegation, evidence collection
**Now:** Focused micro-tasks with minimal context
- EVERY task broken into micro-tasks
- One file per micro-task when possible
- <500 lines of context ideal
- No evidence collection

## 📊 Quick Comparison

| What Changed | v1 (Old) | v2 (New) |
|--------------|----------|----------|
| **PRD Questions** | 45+ questions | 5-10 progressive questions |
| **Risk Assessment** | Every phase | Once in PRD only |
| **Complexity Scoring** | Manual with rubric | AI-driven with reasoning |
| **Testing** | Coverage percentages | "Does it work?" |
| **Context Size** | Often 5000+ lines | <500 lines per micro-task |
| **Documentation** | Always required | Right-sized or optional |
| **Time to Complete** | 4-6 hours typical | 1-3 hours typical |

## 🚀 How to Migrate

### If you're in the middle of a v1 workflow:
1. **Finish it with v1** - Don't switch mid-stream
2. **Start fresh features with v2** - Use the new approach

### If you're starting fresh:
1. **Use the v2 files** - They have version headers
2. **Ignore old documentation** - Focus on the 3 core files
3. **Trust the AI** - It will explain its reasoning

## 🎯 Key Insights for v2 Success

### 1. Discovery > Specification
Don't jump to solutions. Let the AI help discover the real problem through stories and examples.

### 2. Patterns Save Time
70% of features match common patterns. Let AI check for patterns before custom work.

### 3. Micro-Tasks = Accuracy
Small context + specific task = better results. This is especially important for less sophisticated AI models.

### 4. Right-Sized Everything
- Simple feature? Micro PRD (1 page)
- Medium feature? Standard PRD (2-3 pages)
- Complex system? Full PRD (when needed)

## ❓ FAQ

**Q: Do I need risk assessment workshops?**
No. Risk is assessed once during PRD creation, then inherited.

**Q: What about test coverage percentages?**
Gone. Focus on "does it work?" and risk-appropriate testing.

**Q: Do I need context documents?**
Only for complex features with architectural decisions.

**Q: Why micro-tasks for everything?**
Smaller context prevents AI drift and improves accuracy, especially with less sophisticated models.

**Q: Can I still use the old way?**
Yes, v1 files are in `/archive` folder.

## 📁 File Status

### Updated to v2
✅ `create-prd.md` (v2.0)
✅ `generate-tasks.md` (v2.0)
✅ `process-task-list.md` (v2.1)
✅ `README.md` (updated)
✅ `context-template.md` (simplified)

### Mostly Deprecated
⚠️ `docs/risk-assessment-framework.md` - Risk now inherited from PRD
⚠️ `docs/testing-guidelines.md` - Coverage % replaced with practical testing
⚠️ `docs/complexity-rubric.md` - AI does this now

### Still Useful
✅ `AGENTS.md` - Token-optimized rules
✅ `docs/security-scan-exclusions.md` - Still relevant
✅ Example config files - Still useful

## 💬 Bottom Line

v2 is about:
- **Working software over process**
- **Discovery over specification**
- **Patterns over custom work**
- **Focus over broad context**

The goal remains the same: Build features effectively with AI assistance. We just removed the friction.

---

*Questions? Start with the new README.md or try a simple feature with v2!*