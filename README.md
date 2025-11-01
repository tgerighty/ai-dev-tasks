# 🚀 AI Dev Tasks - Simplified Workflow for AI-Powered Development

Welcome to **AI Dev Tasks v2**! This repository provides a streamlined workflow for building features with AI coding assistants. By using discovery-driven requirements, pattern-based task generation, and focused micro-task implementation, you can build features faster and more accurately.

Works with Cursor, Claude Code, Windsurf, and any AI coding assistant that can reference markdown files.

## ✨ What's New in v2

- **50-70% faster** - Discovery questions, pattern recognition, micro-tasks
- **Smarter** - AI explains its reasoning, not just following rules
- **Cleaner** - Right-sized documents, no process theater
- **More accurate** - Micro-tasks with minimal context prevent AI drift

## 🎯 The Core Workflow

Transform ideas into working code through three simple phases:

### 1. Discovery → 2. Planning → 3. Implementation

```
15-30 min     10-15 min      Varies
   PRD    →    Tasks    →   Micro-tasks → Working Software
```

## 📖 Quick Start Guide

### Step 1: Create Your PRD (15-30 minutes)

Start with discovery-driven questions to understand what you really need:

```
@create-prd.md
I want to add user notifications to my app
```

The AI will ask progressive questions like:
- "Tell me about the last time this was a problem"
- "Who needs notifications and why?"
- "What happens if users miss a notification?"

**Result:** Right-sized PRD (Micro/Standard/Full based on complexity)

### Step 2: Generate Task List (10-15 minutes)

Convert your PRD into actionable tasks with AI-driven complexity scoring:

```
@generate-tasks.md @MyFeature-PRD.md
Generate tasks from this PRD
```

The AI will:
- Check for pattern matches (CRUD, Forms, APIs, etc.)
- Apply templates when applicable
- Estimate complexity with reasoning
- Provide time estimates

**Result:** Organized task list with complexity scores and time estimates

### Step 3: Implementation with Micro-Tasks

Break every task into focused micro-tasks for precise implementation:

```
@process-task-list.md @MyFeature-Tasks.md
Start implementing task 1.1
```

Each micro-task:
- Targets ONE file
- Uses minimal context (<500 lines)
- Makes surgical changes
- Takes 5-30 minutes

**Result:** Working, tested features built incrementally

## 🔧 Example: Adding Dark Mode

### Old Way (v1)
1. 45-minute PRD with risk workshop
2. Complex task list with risk scoring
3. Break into micro-tasks with evidence collection
4. 95% test coverage requirement
5. Total time: 4-6 hours

### New Way (v2)
1. Quick PRD (10 min discovery questions)
2. Pattern match: "Settings toggle"
3. 3 micro-tasks:
   - Add toggle to settings.tsx
   - Connect to theme context
   - Add localStorage
4. Test: "Does it work?"
5. Total time: 1-2 hours

## 📁 Repository Structure

### Core Workflow Files (v2)
- `create-prd.md` - Discovery-driven PRD creation
- `generate-tasks.md` - Pattern-based task generation
- `process-task-list.md` - Focused micro-task implementation

### Supporting Files
- `context-template.md` - Optional for complex features
- `AGENTS.md` - Rules for AI agents (token-optimized)
- `/docs` - Additional documentation
- `/examples` - Configuration examples
- `/archive` - Previous versions

## 🚀 Tool-Specific Setup

### Cursor
1. Clone this repository
2. Reference files with `@filename.md` in chat
3. Follow the 3-step workflow

### Claude Code
1. Copy the 3 core `.md` files to your project
2. Add to your `CLAUDE.md`:
```markdown
# AI Dev Tasks
When I request structured feature development:
- Use /ai-dev-tasks/create-prd.md for requirements
- Use /ai-dev-tasks/generate-tasks.md for task lists
- Use /ai-dev-tasks/process-task-list.md for implementation
```

### Windsurf/Others
1. Copy the `.md` files to your project
2. Reference them according to your tool's syntax
3. Follow the same 3-step workflow

## 💡 Key Principles

### Discovery Over Specification
- Start with the problem, not the solution
- Use stories to uncover hidden requirements
- Progressive questions reveal true needs

### Patterns Over Custom
- Recognize common patterns (CRUD, Forms, APIs)
- Apply proven templates
- Customize only when needed

### Micro-Tasks Over Monoliths
- One file, one change
- Minimal context (<500 lines ideal)
- Surgical precision
- 5-30 minutes per micro-task

### Practical Over Perfect
- Test that it works, not coverage %
- Right-sized documents
- Focus on implementation, not process

## 📊 Workflow Comparison

| Phase | Old v1 | New v2 |
|-------|--------|--------|
| **PRD** | 45-60 min, 45+ questions, risk workshop | 15-30 min, 5-10 questions, discovery-driven |
| **Tasks** | Manual scoring, risk assessment | Pattern matching, AI reasoning |
| **Implementation** | Complex delegation, evidence | Focused micro-tasks, minimal context |
| **Testing** | Coverage percentages | Practical validation |
| **Documentation** | Always required | Right-sized as needed |

## 🎯 When to Use What

### Use Micro PRD (<1 page)
- Simple features (add button, toggle, etc.)
- Well-understood requirements
- Low risk changes

### Use Standard PRD (2-3 pages)
- Medium complexity features
- Some unknowns to explore
- Multiple user stories

### Use Full PRD (5+ pages)
- Complex systems
- High risk/compliance
- Multiple stakeholders

## ⚡ Quick Tips

1. **Start simple** - You can always add complexity
2. **Trust the AI** - It will explain its reasoning
3. **Use patterns** - 70% of features match common patterns
4. **Keep context small** - Better results with focused scope
5. **Iterate quickly** - Small changes are easier to fix

## 🔄 Migration from v1

If you have existing v1 workflows:
1. Complete current work with v1
2. Start new features with v2
3. Previous versions archived in `/archive`

## 📈 Metrics & Results

Users report with v2:
- **50-70% faster** feature development
- **Fewer errors** due to focused context
- **Better AI accuracy** with micro-tasks
- **Less overwhelm** with right-sized docs

## 🤝 Contributing

Found a common pattern? Have a workflow improvement? PRs welcome!

## 📚 Additional Resources

- [Video Demo](https://www.youtube.com/watch?v=fD4ktSkNCw4) - See it in action
- [Examples](/examples) - Configuration templates
- [Archive](/archive) - Previous versions

## ⚖️ License

MIT - Use freely in your projects

---

**Remember:** The goal is working software, not perfect process. Keep it simple, focused, and practical.

*Built by developers, for developers using AI.*