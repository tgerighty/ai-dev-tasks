#!/bin/bash

# AI Dev Tasks - Project Installation Script
# Version: 2.0.0
# Usage: ./install-to-project.sh <target-directory> [--minimal|--full]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory (where this script is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Usage function
usage() {
    echo "Usage: $0 <target-directory> [--minimal|--full]"
    echo ""
    echo "Options:"
    echo "  --minimal   Install only core workflow files (default)"
    echo "  --full      Install everything including docs and examples"
    echo ""
    echo "Examples:"
    echo "  $0 /path/to/my-project"
    echo "  $0 ~/projects/my-app --full"
    echo "  $0 . --minimal"
    exit 1
}

# Check arguments
if [ $# -lt 1 ]; then
    usage
fi

TARGET_DIR="$1"
INSTALL_MODE="${2:---minimal}"

# Validate install mode
if [[ "$INSTALL_MODE" != "--minimal" && "$INSTALL_MODE" != "--full" ]]; then
    echo -e "${RED}Error: Invalid install mode. Use --minimal or --full${NC}"
    usage
fi

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}Target directory doesn't exist. Creating: $TARGET_DIR${NC}"
    mkdir -p "$TARGET_DIR"
fi

# Convert to absolute path
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║        AI Dev Tasks - Project Installation            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Source:${NC} $SCRIPT_DIR"
echo -e "${GREEN}Target:${NC} $TARGET_DIR"
echo -e "${GREEN}Mode:${NC}   $INSTALL_MODE"
echo ""

# Create directory structure
AI_DEV_DIR="$TARGET_DIR/ai-dev-tasks"

echo -e "${YELLOW}📁 Creating directory structure...${NC}"
mkdir -p "$AI_DEV_DIR"

if [ "$INSTALL_MODE" == "--full" ]; then
    mkdir -p "$AI_DEV_DIR/docs"
    mkdir -p "$AI_DEV_DIR/examples"
    mkdir -p "$AI_DEV_DIR/references"
fi

# Function to copy file with feedback
copy_file() {
    local src="$1"
    local dest="$2"
    local desc="$3"

    if [ -f "$src" ]; then
        cp "$src" "$dest"
        echo -e "${GREEN}✓${NC} $desc"
    else
        echo -e "${YELLOW}⚠${NC} Skipped (not found): $desc"
    fi
}

# Copy core workflow files
echo ""
echo -e "${YELLOW}📋 Installing core workflow files...${NC}"
copy_file "$SCRIPT_DIR/create-prd.md" "$AI_DEV_DIR/create-prd.md" "PRD Creation Guide (v2.0)"
copy_file "$SCRIPT_DIR/generate-tasks.md" "$AI_DEV_DIR/generate-tasks.md" "Task Generation Guide (v2.0)"
copy_file "$SCRIPT_DIR/process-task-list.md" "$AI_DEV_DIR/process-task-list.md" "Task Processing Guide (v2.1)"

# Copy essential reference files
echo ""
echo -e "${YELLOW}📚 Installing reference files...${NC}"
copy_file "$SCRIPT_DIR/AGENTS.md" "$AI_DEV_DIR/AGENTS.md" "Agents Guide (v2.0)"
copy_file "$SCRIPT_DIR/context-template.md" "$AI_DEV_DIR/context-template.md" "Context Template"

if [ "$INSTALL_MODE" == "--minimal" ]; then
    copy_file "$SCRIPT_DIR/QUICK_REFERENCE.md" "$AI_DEV_DIR/QUICK_REFERENCE.md" "Quick Reference Card"
fi

# Copy full documentation if requested
if [ "$INSTALL_MODE" == "--full" ]; then
    echo ""
    echo -e "${YELLOW}📖 Installing full documentation...${NC}"
    copy_file "$SCRIPT_DIR/README.md" "$AI_DEV_DIR/README.md" "Main README"
    copy_file "$SCRIPT_DIR/WHATS_NEW_V2.md" "$AI_DEV_DIR/WHATS_NEW_V2.md" "Version 2 Migration Guide"
    copy_file "$SCRIPT_DIR/QUICK_REFERENCE.md" "$AI_DEV_DIR/QUICK_REFERENCE.md" "Quick Reference Card"

    # Copy docs folder
    if [ -d "$SCRIPT_DIR/docs" ]; then
        echo ""
        echo -e "${YELLOW}📄 Installing docs folder...${NC}"
        cp -r "$SCRIPT_DIR/docs/"* "$AI_DEV_DIR/docs/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} Documentation files"
    fi

    # Copy examples folder
    if [ -d "$SCRIPT_DIR/examples" ]; then
        echo ""
        echo -e "${YELLOW}📝 Installing examples folder...${NC}"
        cp -r "$SCRIPT_DIR/examples/"* "$AI_DEV_DIR/examples/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} Example configurations"
    fi

    # Copy references folder if it exists
    if [ -d "$SCRIPT_DIR/references" ]; then
        echo ""
        echo -e "${YELLOW}🔗 Installing references folder...${NC}"
        cp -r "$SCRIPT_DIR/references/"* "$AI_DEV_DIR/references/" 2>/dev/null || true
        echo -e "${GREEN}✓${NC} Reference files"
    fi
fi

# Create a tasks directory for PRDs and task lists
mkdir -p "$TARGET_DIR/tasks"

# Create README in ai-dev-tasks folder
cat > "$AI_DEV_DIR/README.md" << 'EOF'
# AI Dev Tasks Workflow

This folder contains the AI Dev Tasks workflow files for structured feature development.

## Quick Start

1. **Create PRD**: `@ai-dev-tasks/create-prd.md`
2. **Generate Tasks**: `@ai-dev-tasks/generate-tasks.md`
3. **Implement**: `@ai-dev-tasks/process-task-list.md`

## Core Files

- `create-prd.md` - Discovery-driven PRD creation
- `generate-tasks.md` - Pattern-based task generation
- `process-task-list.md` - Focused micro-task implementation
- `AGENTS.md` - Rules for AI coding agents
- `context-template.md` - Optional context documentation

## Usage

### For Cursor
Reference files with `@` in chat:
```
@ai-dev-tasks/create-prd.md
I want to build a user notification system
```

### For Claude Code
Add to your project's `CLAUDE.md`:
```markdown
# AI Dev Tasks
When I request structured feature development:
- Use /ai-dev-tasks/create-prd.md for requirements
- Use /ai-dev-tasks/generate-tasks.md for task lists
- Use /ai-dev-tasks/process-task-list.md for implementation
```

### For Other AI Tools
Reference the files according to your tool's syntax.

## File Storage

- PRDs: Save to `/tasks/PRD-[date]-[name].md`
- Task Lists: Save to `/tasks/tasks-[date]-[name].md`
- Context: Save to `/tasks/context-[name].md` (if needed)

## Documentation

See `QUICK_REFERENCE.md` for a one-page guide.

For detailed documentation: https://github.com/snarktank/ai-dev-tasks

---

*AI Dev Tasks v2 - Working software over perfect process*
EOF

# Create Claude Code integration guide if .claude directory exists
if [ -d "$TARGET_DIR/.claude" ]; then
    echo ""
    echo -e "${YELLOW}🤖 Detected Claude Code project. Creating integration files...${NC}"

    mkdir -p "$TARGET_DIR/.claude/commands"

    # Create /create-prd command
    cat > "$TARGET_DIR/.claude/commands/create-prd.md" << 'EOF'
Please use the structured workflow in /ai-dev-tasks/create-prd.md to help me create a PRD for a new feature.

Start by asking me what I want to build, then guide me through discovery questions.
EOF
    echo -e "${GREEN}✓${NC} Created /create-prd command"

    # Create /generate-tasks command
    cat > "$TARGET_DIR/.claude/commands/generate-tasks.md" << 'EOF'
Please generate tasks from the PRD using /ai-dev-tasks/generate-tasks.md

If not explicitly told which PRD to use:
1. List PRD files in /tasks/ directory starting with "PRD-"
2. Show only PRDs that don't have corresponding task lists
3. Ask me to select one
4. Generate tasks from the selected PRD

Make sure to provide numbered options so I can respond easily.
EOF
    echo -e "${GREEN}✓${NC} Created /generate-tasks command"

    # Create /process-tasks command
    cat > "$TARGET_DIR/.claude/commands/process-tasks.md" << 'EOF'
Please process the task list using /ai-dev-tasks/process-task-list.md

Use focused micro-task implementation:
- Break tasks into micro-tasks (one file each when possible)
- Keep context minimal (<500 lines)
- Make surgical changes
- Track progress clearly
EOF
    echo -e "${GREEN}✓${NC} Created /process-tasks command"

    echo -e "${BLUE}Note:${NC} Restart Claude Code to use the new commands (/exit)"
fi

# Create .gitignore entry suggestion
GITIGNORE_ENTRY="
# AI Dev Tasks - Keep workflow files, ignore generated content
/tasks/*.md
!/tasks/README.md
"

if [ -f "$TARGET_DIR/.gitignore" ]; then
    if ! grep -q "AI Dev Tasks" "$TARGET_DIR/.gitignore"; then
        echo ""
        echo -e "${YELLOW}📝 .gitignore suggestion:${NC}"
        echo "Add this to your .gitignore if you want to version control PRDs/tasks:"
        echo "$GITIGNORE_ENTRY"
    fi
fi

# Create tasks/README.md
cat > "$TARGET_DIR/tasks/README.md" << 'EOF'
# Tasks Directory

Store your PRDs, task lists, and context documents here.

## Naming Conventions

- **PRDs**: `PRD-YYYY-MM-DD-feature-name.md` or `PRD-0001-feature-name.md`
- **Tasks**: `tasks-YYYY-MM-DD-feature-name.md` or `tasks-0001-feature-name.md`
- **Context**: `context-feature-name.md` (optional, for complex features)

## Example Workflow

1. Create PRD: `PRD-2025-10-31-user-notifications.md`
2. Generate tasks: `tasks-2025-10-31-user-notifications.md`
3. Optionally create: `context-user-notifications.md`

## Tips

- Use consistent naming to easily match PRDs with task lists
- Archive completed work in a `completed/` subfolder
- Keep active work in the root of this directory
EOF

# Summary
echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║              Installation Complete! ✨                 ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Installed to:${NC} $AI_DEV_DIR"
echo ""
echo -e "${YELLOW}What was installed:${NC}"
if [ "$INSTALL_MODE" == "--minimal" ]; then
    echo "  • 3 core workflow files (create-prd, generate-tasks, process-task-list)"
    echo "  • AGENTS.md (coding rules)"
    echo "  • context-template.md"
    echo "  • QUICK_REFERENCE.md"
    echo "  • Integration README"
else
    echo "  • All core workflow files"
    echo "  • Complete documentation"
    echo "  • Examples and references"
    echo "  • Integration files"
fi
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Review $AI_DEV_DIR/README.md"
echo "  2. See $AI_DEV_DIR/QUICK_REFERENCE.md for quick start"
if [ -d "$TARGET_DIR/.claude" ]; then
    echo "  3. Restart Claude Code to use new commands"
    echo "  4. Try: /create-prd to start your first feature"
else
    echo "  3. Reference @ai-dev-tasks/create-prd.md in your AI tool"
fi
echo ""
echo -e "${GREEN}Happy building! 🚀${NC}"
echo ""
