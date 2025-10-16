#!/bin/bash

# AI Dev Tasks Installer
# Usage: ./install.sh [target_directory] [options]
# Example: ./install.sh ./my-project --gitignore --overwrite

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
DEFAULT_TARGET_DIR="./ai-dev-tasks"
CREATE_GITIGNORE=true
OVERWRITE=true
DRY_RUN=false
VERBOSE=false

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to prompt for installation directory
prompt_for_directory() {
    echo ""
    print_status "📁 AI Dev Tasks Installation Location"
    echo ""
    echo "Please specify where you want to install AI Dev Tasks files."
    echo "This can be an absolute path or relative to the current directory."
    echo ""
    
    while true; do
        # Show current directory as reference
        echo "Current directory: $(pwd)"
        echo ""
        
        # Prompt for directory
        read -p "Enter installation directory (or 'q' to quit): " user_input
        
        # Handle quit
        if [[ "$user_input" == "q" || "$user_input" == "quit" || "$user_input" == "exit" ]]; then
            print_status "Installation cancelled by user."
            exit 0
        fi
        
        # Handle empty input (use default)
        if [[ -z "$user_input" ]]; then
            user_input="$DEFAULT_TARGET_DIR"
        fi
        
        # Expand relative paths and resolve to absolute path
        if [[ "$user_input" == /* ]]; then
            # Absolute path
            TARGET_DIR="$user_input"
        else
            # Relative path - expand against current directory
            TARGET_DIR="$(pwd)/$user_input"
        fi
        
        # Normalize path (remove redundant slashes, etc.)
        TARGET_DIR="$(realpath -m "$TARGET_DIR" 2>/dev/null || echo "$TARGET_DIR")"
        
        echo ""
        print_status "Selected installation directory: $TARGET_DIR"
        
        # Check if directory exists and show contents
        if [[ -d "$TARGET_DIR" ]]; then
            local file_count=$(find "$TARGET_DIR" -type f | wc -l)
            echo "⚠️  Directory already exists with $file_count file(s)."
            
            if [[ "$file_count" -gt 0 ]]; then
                echo "Contents:"
                ls -la "$TARGET_DIR" | head -10
                if [[ $file_count -gt 10 ]]; then
                    echo "... and $((file_count - 10)) more file(s)"
                fi
                echo ""
            fi
        else
            echo "📂 Directory will be created."
        fi
        
        # Ask for confirmation
        read -p "Continue with this location? (y/n): " confirm
        if [[ "$confirm" == "y" || "$confirm" == "yes" || "$confirm" == "Y" ]]; then
            echo ""
            print_success "✓ Installation location confirmed: $TARGET_DIR"
            return 0
        elif [[ "$confirm" == "n" || "$confirm" == "no" || "$confirm" == "N" ]]; then
            echo ""
            print_status "Let's try a different location..."
            continue
        else
            echo ""
            print_warning "Please enter 'y' or 'n'."
            continue
        fi
    done
}

# Function to show usage
show_usage() {
    cat << EOF
AI Dev Tasks Installer

USAGE:
    $0 [OPTIONS]

OPTIONS:
    --gitignore         Create a .gitignore file for AI Dev Tasks projects (default: enabled)
    --overwrite          Overwrite existing files in target directory (default: enabled)
    --dry-run            Show what would be installed without actually installing
    --verbose            Show detailed output during installation
    --help, -h           Show this help message

EXAMPLES:
    # Interactive installation (will prompt for directory)
    $0

    # Dry run to see what would be installed
    $0 --dry-run --verbose

    # Installation without .gitignore creation
    $0 --no-gitignore

    # Installation without overwrite protection
    $0 --no-overwrite

NOTES:
    - The installer will prompt you for the installation location
    - You can specify absolute paths (like /home/user/my-project) 
    - Or relative paths (like ./my-project or ../workspace)
    - The installer will show directory contents if the location exists
    - You can cancel at any time by typing 'q'

EOF
}

# Function to check if directory exists and handle overwrite
check_directory() {
    local target_dir="$1"
    
    if [[ -d "$target_dir" ]]; then
        if [[ "$OVERWRITE" == "false" ]]; then
            local file_count=$(find "$target_dir" -type f -name "*.md" | wc -l)
            if [[ $file_count -gt 0 ]]; then
                print_error "Directory '$target_dir' already exists and contains files."
                print_error "Use --overwrite flag to replace existing files."
                exit 1
            fi
        fi
    fi
}

# Function to create target directory
create_directory() {
    local target_dir="$1"
    
    if [[ ! -d "$target_dir" ]]; then
        if [[ "$DRY_RUN" == "false" ]]; then
            mkdir -p "$target_dir"
            print_success "Created directory: $target_dir"
        else
            print_status "Would create directory: $target_dir"
        fi
    else
        if [[ "$VERBOSE" == "true" ]]; then
            print_status "Directory already exists: $target_dir"
        fi
    fi
}

# Function to copy files
copy_files() {
    local source_dir="$1"
    local target_dir="$2"
    
    # Files to copy from ROOT directory
    local files=(
        "create-prd.md"
        "generate-tasks.md"
        "process-task-list.md"
    )
    
    # Files to move from ROOT directory to docs/
    local files_to_move=(
        "MIGRATION_GUIDE.md"
    )
    
    # Directories to copy from ROOT directory
    local dirs=(
        "docs"
        "examples"
    )
    
    if [[ "$DRY_RUN" == "false" ]]; then
        # Create ai-dev-tasks directory in target
        mkdir -p "$target_dir/ai-dev-tasks"
        
        if [[ "$VERBOSE" == "true" ]]; then
            print_status "Creating AI Dev Tasks directory in: $target_dir/ai-dev-tasks"
        fi
        
        # Copy files from ROOT directory to ai-dev-tasks subdirectory
        for file in "${files[@]}"; do
            if [[ -f "$source_dir/$file" ]]; then
                cp "$source_dir/$file" "$target_dir/ai-dev-tasks/"
                if [[ "$VERBOSE" == "true" ]]; then
                    print_success "Copied: $file to ai-dev-tasks/"
                fi
            else
                print_warning "File not found: $source_dir/$file"
            fi
        done
        
        # Copy directories from ROOT directory to ai-dev-tasks subdirectory
        for dir in "${dirs[@]}"; do
            if [[ -d "$source_dir/$dir" ]]; then
                # Copy directory to ai-dev-tasks subdirectory
                cp -r "$source_dir/$dir" "$target_dir/ai-dev-tasks/"
                if [[ "$VERBOSE" == "true" ]]; then
                    print_success "Copied directory: $dir/ to ai-dev-tasks/"
                fi
            else
                print_warning "Directory not found: $source_dir/$dir"
            fi
        done
        
        # Move migration guide to docs subdirectory
        for file in "${files_to_move[@]}"; do
            if [[ -f "$source_dir/$file" ]]; then
                # Ensure docs directory exists in ai-dev-tasks
                mkdir -p "$target_dir/ai-dev-tasks/docs"
                # Copy the file to docs directory
                cp "$source_dir/$file" "$target_dir/ai-dev-tasks/docs/"
                if [[ "$VERBOSE" == "true" ]]; then
                    print_success "Moved: $file to ai-dev-tasks/docs/"
                fi
            else
                print_warning "File not found: $source_dir/$file"
            fi
        done
        
        if [[ "$VERBOSE" == "true" ]]; then
            print_success "Copied AI Dev Tasks files to: $target_dir/ai-dev-tasks/"
        fi
    else
        print_status "Would create AI Dev Tasks directory in: $target_dir/ai-dev-tasks"
        print_status "Would copy files from ROOT directory: $source_dir"
        print_status "Files to be copied to ai-dev-tasks/:"
        for file in "${files[@]}"; do
            if [[ -f "$source_dir/$file" ]]; then
                print_status "  - $file"
            fi
        done
        for dir in "${dirs[@]}"; do
            if [[ -d "$source_dir/$dir" ]]; then
                print_status "  - $dir/"
            fi
        done
        print_status "Files to be moved to ai-dev-tasks/docs/:"
        for file in "${files_to_move[@]}"; do
            if [[ -f "$source_dir/$file" ]]; then
                print_status "  - $file"
            fi
        done
    fi
}

# Function to create .gitignore file
create_gitignore() {
    local target_dir="$1"
    local gitignore_file="$target_dir/.gitignore"
    
    if [[ -f "$gitignore_file" && "$OVERWRITE" == "false" ]]; then
        print_warning ".gitignore already exists in $target_dir. Use --overwrite to replace."
        return
    fi
    
    local gitignore_content=$(cat << 'EOF'
# AI Dev Tasks - Generated Files
tasks-*.md
*-prd-*.md
evidence/
docs/generated-*.md

# AI Development Artifacts
.ai-dev-cache/
.ai-dev-temp/
.ai-dev-backup/

# Node.js
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
lerna-debug.log*

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/
*.lcov

# nyc test coverage
.nyc_output

# Dependency directories
node_modules/
jspm_packages/

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Optional REPL history
.node_repl_history

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity

# dotenv environment variables file
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# parcel-bundler cache (https://parceljs.org/)
.cache
.parcel-cache

# Next.js build output
.next
out

# Nuxt.js build / generate output
.nuxt
dist

# Gatsby files
.cache/
public

# Storybook build outputs
.out
.storybook-out

# Temporary folders
tmp/
temp/

# Editor directories and files
.vscode/*
!.vscode/extensions.json
.idea
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# Local Netlify folder
.netlify

# End of AI Dev Tasks .gitignore
EOF
)
    
    if [[ "$DRY_RUN" == "false" ]]; then
        echo "$gitignore_content" > "$gitignore_file"
        print_success "Created .gitignore file in: $target_dir"
    else
        print_status "Would create .gitignore file in: $target_dir"
    fi
}

# Function to create setup script
create_setup_script() {
    local target_dir="$1"
    local ai_dev_tasks_dir="$target_dir/ai-dev-tasks"
    local setup_file="$ai_dev_tasks_dir/setup.sh"
    
    if [[ -f "$setup_file" && "$OVERWRITE" == "false" ]]; then
        print_warning "setup.sh already exists in $ai_dev_tasks_dir. Use --overwrite to replace."
        return
    fi
    
    local setup_content=$(cat << 'EOF'
#!/bin/bash

# AI Dev Tasks Setup Script
# This script helps set up the AI Dev Tasks workflow in your project

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [[ ! -f "create-prd.md" ]]; then
    print_error "AI Dev Tasks files not found in current directory."
    print_error "Please run this script from the directory where AI Dev Tasks was installed."
    exit 1
fi

print_status "AI Dev Tasks setup detected! 🚀"

# Check for AI tools
if command -v cursor &> /dev/null; then
    print_success "✓ Cursor found"
elif command -v claude &> /dev/null; then
    print_success "✓ Claude Code found"
else
    print_warning "⚠️  No supported AI tools found (Cursor, Claude Code)"
    print_warning "    Install one of these tools for best experience:"
    print_warning "    - Cursor: https://cursor.sh/"
    print_warning "    - Claude Code: https://docs.anthropic.com/claude/docs/claude-code"
fi

# Check for Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version | cut -d' ' -f2)
    print_success "✓ Node.js $NODE_VERSION found"
else
    print_warning "⚠️  Node.js not found - may be needed for some workflows"
fi

# Check for Git
if command -v git &> /dev/null; then
    print_success "✓ Git found"
else
    print_warning "⚠️  Git not found - recommended for version control"
fi

# Create tasks directory if it doesn't exist
if [[ ! -d "tasks" ]]; then
    mkdir -p tasks
    print_status "Created tasks directory"
fi

# Create docs directory if it doesn't exist
if [[ ! -d "docs" ]]; then
    mkdir -p docs
    print_status "Created docs directory"
fi

# Create evidence directory if it doesn't exist
if [[ ! -d "evidence" ]]; then
    mkdir -p evidence
    print_status "Created evidence directory for testing artifacts"
fi

print_success "🎉 AI Dev Tasks setup complete!"
print_status ""
print_status "Next steps:"
print_status "1. Create your first PRD: Use your AI tool with create-prd.md"
print_status "2. Generate tasks: Use your AI tool with generate-tasks.md"
print_status "3. Implement tasks: Use your AI tool with process-task-list.md"
print_status ""
print_status "For help and examples, see:"
print_status "  - README.md for comprehensive usage guide"
print_status "  - docs/ for detailed documentation"
print_status "  - examples/ for workflow demonstrations"
EOF
)
    
    if [[ "$DRY_RUN" == "false" ]]; then
        echo "$setup_content" > "$setup_file"
        chmod +x "$setup_file"
        print_success "Created setup script: $setup_file"
    else
        print_status "Would create setup script: $setup_file"
    fi
}

# Function to show post-installation information
show_post_install_info() {
    local target_dir="$1"
    local ai_dev_tasks_dir="$target_dir/ai-dev-tasks"
    
    echo ""
    print_success "🎉 AI Dev Tasks installation complete!"
    echo ""
    echo "📁 Installation Location: $(realpath "$ai_dev_tasks_dir")"
    echo ""
    echo "🚀 Quick Start:"
    echo "1. cd $ai_dev_tasks_dir"
    echo "2. Start using your AI tool with the workflow files:"
    echo "   - create-prd.md    # Generate a PRD"
    echo "   - generate-tasks.md  # Create tasks from PRD"
    echo "   - process-task-list.md  # Implement tasks"
    echo ""
    echo "📚 Documentation:"
    echo "   - README.md           # Comprehensive usage guide"
    echo "   - docs/               # Detailed documentation"
    echo "   - docs/MIGRATION_GUIDE.md  # Migration guide for legacy PRDs"
    echo "   - examples/           # Workflow examples"
    echo ""
    echo "💡 Tips:"
    echo "   - Use risk-based development for complex features"
    echo "   - Collect evidence for all completed tasks"
    echo "   - Follow the testing guidelines for your AI tool"
    echo "   - Check examples/ for complete workflow demonstrations"
}

# Parse command line arguments
CREATE_GITIGNORE=true
OVERWRITE=true
DRY_RUN=false
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --gitignore)
            CREATE_GITIGNORE=true
            shift
            ;;
        --no-gitignore)
            CREATE_GITIGNORE=false
            shift
            ;;
        --overwrite)
            OVERWRITE=true
            shift
            ;;
        --no-overwrite)
            OVERWRITE=false
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        --help|-h)
            show_usage
            exit 0
            ;;
        -*)
            print_error "Unknown option: $1"
            show_usage
            exit 1
            ;;
        *)
            print_error "Unknown argument: $1"
            print_error "The installer now prompts for the installation directory interactively."
            print_error "Run './install.sh --help' for usage information."
            exit 1
            ;;
    esac
done

# Show welcome message
echo "🚀 AI Dev Tasks Installer"
echo "========================="
echo ""

# Show what will be installed
if [[ "$DRY_RUN" == "true" || "$VERBOSE" == "true" ]]; then
    print_status "AI Dev Tasks Installer (Dry Run Mode)"
    echo ""
fi

# Prompt for installation directory
if [[ "$DRY_RUN" == "false" ]]; then
    prompt_for_directory
else
    # For dry run, use default directory
    TARGET_DIR="$DEFAULT_TARGET_DIR"
    print_status "Dry run mode - would prompt for installation directory"
    print_status "Using default target: $TARGET_DIR"
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Validate target directory
if [[ ! -d "$SCRIPT_DIR" ]]; then
    print_error "Script directory not found: $SCRIPT_DIR"
    exit 1
fi

# Check if required files exist in ROOT directory
REQUIRED_FILES=("create-prd.md" "generate-tasks.md" "process-task-list.md")
for file in "${REQUIRED_FILES[@]}"; do
    if [[ ! -f "$SCRIPT_DIR/$file" ]]; then
        print_error "Required file not found: $file"
        print_error "Please ensure you're running this script from the AI Dev Tasks repository."
        exit 1
    fi
done

# Show installation details
if [[ "$DRY_RUN" == "true" || "$VERBOSE" == "true" ]]; then
    print_status "Installation Details:"
    print_status "Target Directory: $TARGET_DIR"
    print_status "AI Dev Tasks will be installed in: $TARGET_DIR/ai-dev-tasks"
    print_status "Create .gitignore: $CREATE_GITIGNORE"
    print_status "Overwrite Files: $OVERWRITE"
    print_status "Source Directory: $SCRIPT_DIR"
    echo ""
fi

# Check directory and handle overwrite
check_directory "$TARGET_DIR"

# Create target directory
create_directory "$TARGET_DIR"

# Copy files
copy_files "." "$TARGET_DIR"

# Create .gitignore if requested
if [[ "$CREATE_GITIGNORE" == "true" ]]; then
    create_gitignore "$TARGET_DIR"
fi

# Create setup script


# Show dry run results
if [[ "$DRY_RUN" == "true" ]]; then
    echo ""
    print_status "Dry run completed. No files were actually installed."
    echo "Run without --dry-run flag to perform actual installation."
else
    # Show post-installation information
    show_post_install_info "$TARGET_DIR"
fi

echo ""
print_success "Installation process completed successfully! 🚀"
