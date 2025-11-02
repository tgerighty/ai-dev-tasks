#!/bin/bash

# AI Dev Tasks - Unified Installer with Nano-Agents
# Version: 3.0.0
# Usage: ./install-unified.sh [options]
# Example: ./install-unified.sh --interactive

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Script directory (where this script is located)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default values
TARGET_DIR=""
INSTALL_MODE="standard"  # minimal, standard, full
CREATE_GITIGNORE=true
OVERWRITE=false
DRY_RUN=false
VERBOSE=false
INTERACTIVE=true
INSTALL_CLAUDE_AGENTS=false
INSTALL_FACTORY_DROIDS=false
INSTALL_NANO=false

# Tool detection results
CLAUDE_CODE_DETECTED=false
FACTORY_AI_DETECTED=false
CURSOR_DETECTED=false
WINDSURF_DETECTED=false

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_header() {
    echo ""
    echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${BOLD}        AI Dev Tasks Unified Installer v3.0.0          ${NC}${CYAN}║${NC}"
    echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Function to detect AI tools
detect_tools() {
    print_status "🔍 Detecting AI coding tools..."

    # Check for Claude Code
    if [[ -d "$HOME/.claude" ]] || command -v claude-code &> /dev/null; then
        CLAUDE_CODE_DETECTED=true
        print_success "Claude Code detected"
    fi

    # Check for Factory.ai
    if [[ -d "$HOME/.factory" ]] || [[ -f "./.factory/AGENTS.md" ]]; then
        FACTORY_AI_DETECTED=true
        print_success "Factory.ai detected"
    fi

    # Check for Cursor
    if command -v cursor &> /dev/null || [[ -d "/Applications/Cursor.app" ]]; then
        CURSOR_DETECTED=true
        print_success "Cursor detected"
    fi

    # Check for Windsurf
    if command -v windsurf &> /dev/null || [[ -d "$HOME/.windsurf" ]]; then
        WINDSURF_DETECTED=true
        print_success "Windsurf detected"
    fi

    if [[ "$CLAUDE_CODE_DETECTED" == false && "$FACTORY_AI_DETECTED" == false &&
          "$CURSOR_DETECTED" == false && "$WINDSURF_DETECTED" == false ]]; then
        print_warning "No AI tools detected - will install standard files only"
    fi
}

# Function to show usage
usage() {
    cat << EOF
Usage: $0 [OPTIONS]

Options:
    -d, --dir PATH          Target directory (default: interactive prompt)
    -m, --mode MODE         Install mode: minimal, standard, full (default: standard)
    -i, --interactive       Interactive mode with wizard (default)
    -n, --non-interactive   Non-interactive mode
    --dry-run              Preview what would be installed
    --overwrite            Overwrite existing files without prompting
    --no-gitignore         Don't update .gitignore
    --verbose              Verbose output
    --help                 Show this help message

Install Modes:
    minimal   - Core workflow files only (PRD, tasks, process)
    standard  - Core files + AGENTS.md + Nano-AGENTS.md
    full      - Everything including docs, examples, and agents

Examples:
    $0                                    # Interactive wizard
    $0 --dir ./my-project                 # Install to specific directory
    $0 --mode full --dir /path/to/project # Full installation
    $0 --dry-run                          # Preview installation

EOF
    exit 0
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--dir)
            TARGET_DIR="$2"
            INTERACTIVE=false
            shift 2
            ;;
        -m|--mode)
            INSTALL_MODE="$2"
            shift 2
            ;;
        -i|--interactive)
            INTERACTIVE=true
            shift
            ;;
        -n|--non-interactive)
            INTERACTIVE=false
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --overwrite)
            OVERWRITE=true
            shift
            ;;
        --no-gitignore)
            CREATE_GITIGNORE=false
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            print_error "Unknown option: $1"
            usage
            ;;
    esac
done

# Interactive setup wizard
run_wizard() {
    print_header

    # Step 1: Welcome and tool detection
    echo -e "${BOLD}Welcome to the AI Dev Tasks Installation Wizard!${NC}"
    echo ""
    echo "This installer will help you set up the ai-dev-tasks workflow"
    echo "with optimized nano-agents for your AI coding assistant."
    echo ""

    detect_tools
    echo ""

    # Step 2: Choose installation directory
    echo -e "${BOLD}📁 Installation Directory${NC}"
    echo ""
    echo "Where would you like to install ai-dev-tasks?"
    echo "  1) Current directory: $(pwd)"
    echo "  2) Home directory: $HOME/ai-dev-tasks"
    echo "  3) Custom path"
    echo ""

    while true; do
        read -p "Select option (1-3): " dir_choice
        case $dir_choice in
            1)
                TARGET_DIR="$(pwd)/ai-dev-tasks"
                break
                ;;
            2)
                TARGET_DIR="$HOME/ai-dev-tasks"
                break
                ;;
            3)
                read -p "Enter custom path: " custom_path
                if [[ -z "$custom_path" ]]; then
                    print_warning "Path cannot be empty"
                else
                    # Resolve path
                    if [[ "$custom_path" == /* ]]; then
                        TARGET_DIR="$custom_path"
                    else
                        TARGET_DIR="$(pwd)/$custom_path"
                    fi
                    TARGET_DIR="$(realpath -m "$TARGET_DIR" 2>/dev/null || echo "$TARGET_DIR")"
                    break
                fi
                ;;
            *)
                print_warning "Please select 1, 2, or 3"
                ;;
        esac
    done

    echo ""
    print_success "Installation directory: $TARGET_DIR"

    # Step 3: Choose installation mode
    echo ""
    echo -e "${BOLD}📦 Installation Mode${NC}"
    echo ""
    echo "Select installation type:"
    echo "  1) Minimal - Core workflow files only (~50KB)"
    echo "  2) Standard - Core + AGENTS.md + Nano-AGENTS.md (~100KB)"
    echo "  3) Full - Everything including docs, examples, nano-agents (~500KB)"
    echo ""

    while true; do
        read -p "Select mode (1-3): " mode_choice
        case $mode_choice in
            1)
                INSTALL_MODE="minimal"
                break
                ;;
            2)
                INSTALL_MODE="standard"
                break
                ;;
            3)
                INSTALL_MODE="full"
                INSTALL_CLAUDE_AGENTS=true
                INSTALL_FACTORY_DROIDS=true
                INSTALL_NANO=true
                break
                ;;
            *)
                print_warning "Please select 1, 2, or 3"
                ;;
        esac
    done

    print_success "Installation mode: $INSTALL_MODE"

    # Step 4: Tool-specific installations
    if [[ "$INSTALL_MODE" != "minimal" ]]; then
        echo ""
        echo -e "${BOLD}🤖 AI Tool Configuration${NC}"
        echo ""

        if [[ "$CLAUDE_CODE_DETECTED" == true ]]; then
            read -p "Install Claude Code nano-agents? (y/n): " install_claude
            if [[ "$install_claude" == "y" || "$install_claude" == "Y" ]]; then
                INSTALL_CLAUDE_AGENTS=true
            fi
        fi

        if [[ "$FACTORY_AI_DETECTED" == true ]]; then
            read -p "Install Factory.ai nano-droids? (y/n): " install_factory
            if [[ "$install_factory" == "y" || "$install_factory" == "Y" ]]; then
                INSTALL_FACTORY_DROIDS=true
            fi
        fi

        read -p "Install Nano-AGENTS.md for micro-tasks? (y/n): " install_nano
        if [[ "$install_nano" == "y" || "$install_nano" == "Y" ]]; then
            INSTALL_NANO=true
        fi
    fi

    # Step 5: Confirmation
    echo ""
    echo -e "${BOLD}📋 Installation Summary${NC}"
    echo ""
    echo "  Directory:      $TARGET_DIR"
    echo "  Mode:           $INSTALL_MODE"
    echo "  Claude agents:  $([[ "$INSTALL_CLAUDE_AGENTS" == true ]] && echo "Yes" || echo "No")"
    echo "  Factory droids: $([[ "$INSTALL_FACTORY_DROIDS" == true ]] && echo "Yes" || echo "No")"
    echo "  Nano-AGENTS:    $([[ "$INSTALL_NANO" == true ]] && echo "Yes" || echo "No")"
    echo ""

    read -p "Proceed with installation? (y/n): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        print_status "Installation cancelled."
        exit 0
    fi
}

# Function to copy file with feedback
copy_file() {
    local src="$1"
    local dest="$2"
    local desc="$3"

    if [[ "$DRY_RUN" == true ]]; then
        echo -e "${CYAN}[DRY-RUN]${NC} Would copy: $desc"
        return 0
    fi

    if [[ -f "$src" ]]; then
        if [[ -f "$dest" && "$OVERWRITE" == false ]]; then
            read -p "File exists: $(basename "$dest"). Overwrite? (y/n): " overwrite
            if [[ "$overwrite" != "y" && "$overwrite" != "Y" ]]; then
                print_warning "Skipped: $desc"
                return 0
            fi
        fi

        cp "$src" "$dest"
        local cp_result=$?
        if [[ $cp_result -eq 0 ]]; then
            print_success "$desc"
            [[ "$VERBOSE" == true ]] && echo "    $src -> $dest"
            return 0
        else
            print_error "Failed to copy: $desc (exit code: $cp_result)"
            return $cp_result
        fi
    else
        print_warning "Source not found: $desc"
        return 1
    fi
}

# Function to create directory
create_dir() {
    local dir="$1"
    local desc="$2"

    if [[ "$DRY_RUN" == true ]]; then
        echo -e "${CYAN}[DRY-RUN]${NC} Would create: $desc"
        return
    fi

    if [[ ! -d "$dir" ]]; then
        mkdir -p "$dir"
        print_success "Created: $desc"
    fi
}

# Main installation function
perform_installation() {
    echo ""
    echo -e "${BOLD}🚀 Starting Installation${NC}"
    echo ""

    # Create main directory structure
    create_dir "$TARGET_DIR" "Main directory"
    create_dir "$TARGET_DIR/tasks" "Tasks directory"

    # Copy core workflow files (always)
    print_status "📋 Installing core workflow files..."
    copy_file "$SCRIPT_DIR/create-prd.md" "$TARGET_DIR/create-prd.md" "PRD Creation Guide (v2.0)"
    copy_file "$SCRIPT_DIR/generate-tasks.md" "$TARGET_DIR/generate-tasks.md" "Task Generation Guide (v2.0)"
    copy_file "$SCRIPT_DIR/process-task-list.md" "$TARGET_DIR/process-task-list.md" "Task Processing Guide (v2.1)"

    # Copy standard files
    if [[ "$INSTALL_MODE" == "standard" || "$INSTALL_MODE" == "full" ]]; then
        print_status "📄 Installing configuration files..."
        copy_file "$SCRIPT_DIR/AGENTS.md" "$TARGET_DIR/AGENTS.md" "AGENTS.md (v2.0.0)"
        copy_file "$SCRIPT_DIR/context-template.md" "$TARGET_DIR/context-template.md" "Context Template"
        copy_file "$SCRIPT_DIR/QUICK_REFERENCE.md" "$TARGET_DIR/QUICK_REFERENCE.md" "Quick Reference Guide"
        copy_file "$SCRIPT_DIR/WHATS_NEW_V2.md" "$TARGET_DIR/WHATS_NEW_V2.md" "What's New in v2"
        copy_file "$SCRIPT_DIR/README.md" "$TARGET_DIR/README.md" "Main README"
    fi

    # Copy Nano-AGENTS.md if requested
    if [[ "$INSTALL_NANO" == true ]]; then
        print_status "⚡ Installing Nano-AGENTS.md..."
        copy_file "$SCRIPT_DIR/Nano-AGENTS.md" "$TARGET_DIR/Nano-AGENTS.md" "Nano-AGENTS.md (2K tokens)"
    fi

    # Install Claude Code agents - GO TO PROJECT ROOT .claude/
    if [[ "$INSTALL_CLAUDE_AGENTS" == true ]]; then
        # Extract project root directory (remove AI DevTools folder)
        PROJECT_ROOT_DIR="$(dirname "$TARGET_DIR")"
        print_status "🤖 Installing Claude Code nano-agents to project root..."
        create_dir "$PROJECT_ROOT_DIR/.claude/agents" "Claude agents directory"

        for agent_file in "$SCRIPT_DIR/.claude/agents/"*.md; do
            if [[ -f "$agent_file" ]]; then
                basename_file=$(basename "$agent_file")
                copy_file "$agent_file" "$PROJECT_ROOT_DIR/.claude/agents/$basename_file" "Claude agent: $basename_file"
            fi
        done

        # Install CLAUDE.md configuration for Claude Code
        print_status "📄 Installing CLAUDE.md for Claude Code..."
        if [[ -f "$SCRIPT_DIR/.claude/CLAUDE.md" ]]; then
            copy_file "$SCRIPT_DIR/.claude/CLAUDE.md" "$PROJECT_ROOT_DIR/.claude/CLAUDE.md" "Claude Code configuration"
        elif [[ -f "$SCRIPT_DIR/CLAUDE.md" ]]; then
            create_dir "$PROJECT_ROOT_DIR/.claude" "Claude configuration directory"
            copy_file "$SCRIPT_DIR/CLAUDE.md" "$PROJECT_ROOT_DIR/.claude/CLAUDE.md" "Claude Code configuration"
        fi
    fi

    # Install Factory.ai droids - GO TO PROJECT ROOT .factory/
    if [[ "$INSTALL_FACTORY_DROIDS" == true ]]; then
        # Extract project root directory (remove AI DevTools folder)
        PROJECT_ROOT_DIR="$(dirname "$TARGET_DIR")"
        print_status "🏭 Installing Factory.ai nano-droids to project root..."
        create_dir "$PROJECT_ROOT_DIR/.factory/droids" "Factory droids directory"

        for droid_file in "$SCRIPT_DIR/.factory/droids/"*.md; do
            if [[ -f "$droid_file" ]]; then
                basename_file=$(basename "$droid_file")
                copy_file "$droid_file" "$PROJECT_ROOT_DIR/.factory/droids/$basename_file" "Factory droid: $basename_file"
            fi
        done
    fi

    # Install full documentation and examples
    if [[ "$INSTALL_MODE" == "full" ]]; then
        print_status "📚 Installing documentation..."
        create_dir "$TARGET_DIR/docs" "Documentation directory"
        create_dir "$TARGET_DIR/examples" "Examples directory"
        create_dir "$TARGET_DIR/archive" "Archive directory"
        create_dir "$TARGET_DIR/references" "References directory"

        # Copy docs
        for doc_file in "$SCRIPT_DIR/docs/"*.md; do
            if [[ -f "$doc_file" ]]; then
                basename_file=$(basename "$doc_file")
                copy_file "$doc_file" "$TARGET_DIR/docs/$basename_file" "Doc: $basename_file"
            fi
        done

        # Copy examples
        for example_file in "$SCRIPT_DIR/examples/"*; do
            if [[ -f "$example_file" ]]; then
                basename_file=$(basename "$example_file")
                copy_file "$example_file" "$TARGET_DIR/examples/$basename_file" "Example: $basename_file"
            fi
        done

        # Copy archive
        for archive_file in "$SCRIPT_DIR/archive/"*.md; do
            if [[ -f "$archive_file" ]]; then
                basename_file=$(basename "$archive_file")
                copy_file "$archive_file" "$TARGET_DIR/archive/$basename_file" "Archive: $basename_file"
            fi
        done
    fi

    # Create .gitignore (only if it doesn't exist)
    if [[ "$CREATE_GITIGNORE" == true && "$DRY_RUN" == false ]]; then
        GITIGNORE_FILE="$TARGET_DIR/.gitignore"
        
        if [[ -f "$GITIGNORE_FILE" ]]; then
            print_status ".gitignore already exists in $TARGET_DIR. Skipping creation."
        else
            print_status "📝 Creating .gitignore..."
            cat > "$GITIGNORE_FILE" << 'EOF'
# AI Dev Tasks - task and PRD files
/tasks/
tasks/

# AI Dev Tasks - cache and temp files
.ai-dev-cache/
.ai-dev-temp/
.ai-dev-backup/

# Backup files
*.bak
*.bak*
*.backup
*.old

# OS files
.DS_Store
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo

# Environment
.env
.env.local
EOF
            print_success "Created .gitignore file"
        fi
    fi
}

# Post-installation setup
post_install_setup() {
    echo ""
    echo -e "${BOLD}✅ Installation Complete!${NC}"
    echo ""

    # Show tool-specific instructions
    if [[ "$CLAUDE_CODE_DETECTED" == true && "$INSTALL_CLAUDE_AGENTS" == true ]]; then
        PROJECT_ROOT_DIR="$(dirname "$TARGET_DIR")"
        echo -e "${CYAN}Claude Code Setup:${NC}"
        echo "  Your nano-agents are installed in: $PROJECT_ROOT_DIR/.claude/agents/"
        echo "  Use them with: Task tool with subagent_type"
        echo ""
    fi

    if [[ "$FACTORY_AI_DETECTED" == true && "$INSTALL_FACTORY_DROIDS" == true ]]; then
        PROJECT_ROOT_DIR="$(dirname "$TARGET_DIR")"
        echo -e "${CYAN}Factory.ai Setup:${NC}"
        echo "  Your nano-droids are installed in: $PROJECT_ROOT_DIR/.factory/droids/"
        echo "  They will be automatically detected by Factory.ai"
        echo ""
    fi

    if [[ "$CURSOR_DETECTED" == true ]]; then
        echo -e "${CYAN}Cursor Setup:${NC}"
        echo "  Use @create-prd.md to start PRD creation"
        echo "  Use @generate-tasks.md to create task lists"
        echo "  Use @process-task-list.md to implement tasks"
        echo ""
    fi

    # Show quick start guide
    echo -e "${BOLD}🚀 Quick Start:${NC}"
    echo ""
    echo "1. Create a PRD:"
    echo "   - Cursor: @create-prd.md"
    echo "   - Claude Code: /create-prd (if slash command set up)"
    echo "   - Manual: Follow create-prd.md guide"
    echo ""
    echo "2. Generate tasks from PRD:"
    echo "   - Reference your PRD file with generate-tasks.md"
    echo ""
    echo "3. Process tasks:"
    echo "   - Use process-task-list.md with your task list"
    echo ""

    if [[ "$INSTALL_NANO" == true ]]; then
        echo -e "${YELLOW}💡 Tip:${NC} Use Nano-AGENTS.md for micro-task execution (2K tokens vs 7K)"
    fi

    echo ""
    echo -e "${GREEN}Installation directory: $TARGET_DIR${NC}"
    echo ""
}

# Main execution
main() {
    if [[ "$INTERACTIVE" == true && -z "$TARGET_DIR" ]]; then
        run_wizard
    else
        # Non-interactive mode validation
        if [[ -z "$TARGET_DIR" ]]; then
            print_error "Target directory required in non-interactive mode"
            usage
        fi

        # Resolve target directory
        if [[ "$TARGET_DIR" != /* ]]; then
            TARGET_DIR="$(pwd)/$TARGET_DIR"
        fi
        TARGET_DIR="$(realpath -m "$TARGET_DIR" 2>/dev/null || echo "$TARGET_DIR")"

        print_header
        detect_tools

        # Auto-enable agents/droids in full mode
        if [[ "$INSTALL_MODE" == "full" ]]; then
            INSTALL_CLAUDE_AGENTS=true
            INSTALL_FACTORY_DROIDS=true
            INSTALL_NANO=true
        fi
    fi

    # Perform installation
    perform_installation

    # Show post-installation instructions
    if [[ "$DRY_RUN" == false ]]; then
        post_install_setup
    else
        echo ""
        print_status "Dry run complete. No files were modified."
    fi
}

# Run main function
main