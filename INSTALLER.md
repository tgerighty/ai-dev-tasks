# AI Dev Tasks - Installation Guide

**Version**: 2.0.0
**Last Updated**: 2025-10-31

## Quick Installation

### Option 1: Installation Script (Recommended)

**Minimal Install** (core workflow files only):
```bash
# Clone the repository
git clone https://github.com/snarktank/ai-dev-tasks.git
cd ai-dev-tasks

# Install to your project
./install-to-project.sh /path/to/your/project
```

**Full Install** (includes docs and examples):
```bash
./install-to-project.sh /path/to/your/project --full
```

**Install to current directory**:
```bash
./install-to-project.sh . --minimal
```

### Option 2: Direct from GitHub

```bash
curl -sSL https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/install-to-project.sh | bash -s /path/to/your/project
```

### Option 3: Manual Copy

Copy just the essentials:
```bash
# Create directory
mkdir -p /path/to/your/project/ai-dev-tasks

# Copy core files
cp create-prd.md generate-tasks.md process-task-list.md \
   AGENTS.md context-template.md QUICK_REFERENCE.md \
   /path/to/your/project/ai-dev-tasks/

# Create tasks directory
mkdir -p /path/to/your/project/tasks
```

## What Gets Installed

### Minimal Install (Default)
```
your-project/
├── ai-dev-tasks/
│   ├── create-prd.md          # PRD creation (v2.0)
│   ├── generate-tasks.md      # Task generation (v2.0)
│   ├── process-task-list.md   # Implementation (v2.1)
│   ├── AGENTS.md              # Coding rules (v2.0)
│   ├── context-template.md    # Context template
│   ├── QUICK_REFERENCE.md     # Quick start guide
│   └── README.md              # Integration guide
└── tasks/                     # Your PRDs and task lists
    └── README.md
```

### Full Install
```
your-project/
├── ai-dev-tasks/
│   ├── [all minimal files]
│   ├── docs/                  # Full documentation
│   ├── examples/              # Config examples
│   ├── references/            # Code examples (if available)
│   ├── README.md              # Full README
│   └── WHATS_NEW_V2.md       # Migration guide
└── tasks/
```

## Installation Features

### Automatic Detection
- **Claude Code**: Auto-creates slash commands if `.claude/` exists
- **Directory structure**: Creates `/tasks` directory
- **README files**: Generates helpful guides

### Claude Code Integration

If Claude Code is detected (`.claude` directory exists), the script creates:

#### Custom Commands
- `/create-prd` - Start PRD creation workflow
- `/generate-tasks` - Generate tasks from PRD
- `/process-tasks` - Begin implementation

**Usage after installation:**
1. Restart Claude Code: `/exit` then reopen
2. Use commands: `/create-prd`, `/generate-tasks`, `/process-tasks`

#### Manual Integration

Add to your project's `CLAUDE.md`:
```markdown
# AI Dev Tasks
When I request structured feature development:
- Use /ai-dev-tasks/create-prd.md for requirements
- Use /ai-dev-tasks/generate-tasks.md for task lists
- Use /ai-dev-tasks/process-task-list.md for implementation
```

## Tool-Specific Usage

### Cursor

Reference files with `@` in chat:
```
@ai-dev-tasks/create-prd.md
I want to build a notification system
```

### Claude Code

Use custom commands:
```
/create-prd
/generate-tasks
/process-tasks
```

### Windsurf / Other Tools

Reference according to your tool's syntax:
```
Use /ai-dev-tasks/create-prd.md
Build a user authentication system
```

## Usage Examples

### Complete Workflow

**1. Create PRD:**
```bash
# Cursor
@ai-dev-tasks/create-prd.md
I want to add dark mode to my app

# Claude Code
/create-prd
```

**2. Generate Tasks:**
```bash
# Cursor
@ai-dev-tasks/generate-tasks.md @tasks/PRD-2025-10-31-dark-mode.md

# Claude Code
/generate-tasks
```

**3. Implement:**
```bash
# Cursor
@ai-dev-tasks/process-task-list.md @tasks/tasks-2025-10-31-dark-mode.md
Start with task 1.1

# Claude Code
/process-tasks
```

## Directory Organization

### Recommended Structure
```
your-project/
├── ai-dev-tasks/           # Workflow files
├── tasks/                  # Your PRDs and task lists
│   ├── PRD-2025-10-31-dark-mode.md
│   ├── tasks-2025-10-31-dark-mode.md
│   ├── context-dark-mode.md (optional)
│   └── completed/          # Archive completed work
├── src/                    # Your source code
└── .gitignore             # Generated suggestions
```

### Naming Conventions

**PRDs:**
- Simple: `PRD-YYYY-MM-DD-feature-name.md`
- Complex: `PRD-0001-feature-name.md`

**Tasks:**
- Simple: `tasks-YYYY-MM-DD-feature-name.md`
- Complex: `tasks-0001-feature-name.md`

**Context (optional):**
- `context-feature-name.md`

## Updating

To update to the latest version:

```bash
# Backup your tasks first
cp -r your-project/tasks your-project/tasks-backup

# Remove old version
rm -rf your-project/ai-dev-tasks

# Install new version
./install-to-project.sh your-project

# Or with full docs
./install-to-project.sh your-project --full
```

## Uninstallation

To remove AI Dev Tasks:

```bash
# Remove workflow files
rm -rf your-project/ai-dev-tasks

# Optionally remove tasks (your PRDs)
rm -rf your-project/tasks

# Remove Claude Code commands (if applicable)
rm -rf your-project/.claude/commands/create-prd.md
rm -rf your-project/.claude/commands/generate-tasks.md
rm -rf your-project/.claude/commands/process-tasks.md
```

## Troubleshooting

### Script Won't Run

```bash
# Make executable
chmod +x install-to-project.sh

# Or run with bash
bash install-to-project.sh /path/to/project
```

### Claude Code Commands Not Working

1. Completely restart Claude Code (`/exit`)
2. Check `.claude/commands/` directory exists
3. Verify command files were created
4. Try running commands with `/`

### Files Not Found

```bash
# Ensure you're in the ai-dev-tasks directory
pwd
ls -la create-prd.md generate-tasks.md process-task-list.md

# If cloned from git
cd ai-dev-tasks
./install-to-project.sh /path/to/project
```

### Permission Denied

```bash
# Fix permissions
chmod +x install-to-project.sh

# Or use sudo if needed (not recommended)
sudo ./install-to-project.sh /path/to/project
```

## Advanced Usage

### Multiple Projects

```bash
# Install to multiple projects
./install-to-project.sh ~/projects/app1
./install-to-project.sh ~/projects/app2 --full
./install-to-project.sh ~/projects/app3
```

### Custom Installation Location

```bash
# Install with custom name
mkdir -p your-project/custom-ai-tools
# Then manually copy files to custom location
```

### CI/CD Integration

```bash
# In your CI script
curl -sSL https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/install-to-project.sh | \
  bash -s /workspace/project --minimal
```

## Version Control

### What to Commit

**Commit:**
- `/ai-dev-tasks/` - The workflow files
- `/tasks/*.md` - Your PRDs and task lists (optional)
- `.claude/commands/` - Custom commands (if using Claude Code)

**Don't Commit:**
- Temporary files
- Generated evidence
- Cache directories

### .gitignore Suggestions

Add to your `.gitignore`:
```gitignore
# AI Dev Tasks - Optional exclusions
# Uncomment if you don't want to track PRDs/tasks
# /tasks/*.md
# !/tasks/README.md

# Never commit these
.ai-dev-cache/
.ai-dev-temp/
evidence/
```

## Support

- **Quick Reference**: See `QUICK_REFERENCE.md` in your project
- **Full Docs**: See `README.md` in ai-dev-tasks folder
- **Migration Guide**: `WHATS_NEW_V2.md` for v1 to v2 changes
- **Issues**: https://github.com/snarktank/ai-dev-tasks/issues

## Best Practices

1. **Start minimal**: Use `--minimal` until you need full docs
2. **Version control**: Commit the ai-dev-tasks folder
3. **Archive completed work**: Move finished PRDs to `/tasks/completed`
4. **Keep it updated**: Check for updates periodically
5. **Use the tools**: Reference files in your AI tool for best results

---

*AI Dev Tasks v2 - Simple, fast, effective*