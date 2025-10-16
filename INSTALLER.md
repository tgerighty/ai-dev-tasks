# AI Dev Tasks Installer Guide

## Overview

The AI Dev Tasks installer provides a simple, automated way to set up the AI Dev Tasks workflow in any project directory. It copies all necessary files, creates appropriate directory structure, and generates helpful setup scripts.

## Quick Start

### Interactive Installation
```bash
# Clone the AI Dev Tasks repository
git clone https://github.com/snarktank/ai-dev-tasks.git
cd ai-dev-tasks

# Run installer (will prompt for installation location)
./install.sh
```

### Installation with Options
```bash
# Install without .gitignore file creation (defaults to enabled)
./install.sh --no-gitignore

# Install without overwrite protection (defaults to enabled)
./install.sh --no-overwrite

# Dry run to see what would be installed
./install.sh --dry-run --verbose

# Show help and usage information
./install.sh --help
```

## Installation Options

### Interactive Directory Selection
- **Installation Location**: The installer will prompt you to specify where to install AI Dev Tasks files
  - Supports absolute paths (e.g., `/home/user/my-project`)
  - Supports relative paths (e.g., `./my-project`, `../workspace`)
  - Shows directory contents if the location already exists
  - Allows cancellation at any time by typing 'q'
  - Provides confirmation before proceeding with installation

### Options
- `--gitignore`: Create a comprehensive .gitignore file for AI Dev Tasks projects (default: enabled)
- `--no-gitignore`: Skip .gitignore file creation
- `--overwrite`: Overwrite existing files in target directory (default: enabled)
- `--no-overwrite`: Skip overwriting existing files (prevents accidental file loss)
- `--dry-run`: Show what would be installed without actually installing
- `--verbose`: Show detailed output during installation
- `--help, -h`: Show help message and exit

### Installation Prompts
The installer will guide you through:
1. **Location Selection**: Choose where to install AI Dev Tasks files
2. **Directory Review**: See what exists in the selected location
3. **Confirmation**: Confirm the installation location before proceeding
4. **Installation**: Copy files and create setup structure

## Files and Directories Installed

### Core Workflow Files
- **`create-prd.md`**: Simplified PRD creation guide
- **`generate-tasks.md`**: Task generation guide with risk assessment
- **process-task-list.md`**: Implementation guide with testing protocols
- **`README.md`**: Comprehensive usage guide
- **`LICENSE`**: MIT license file

### Documentation Directory (`/docs`)
- **`complexity-rubric.md`**: Task complexity scoring framework (1-10 scale)
- **`risk-assessment-framework.md`**: Risk assessment protocols and quality gates
- **testing-guidelines.md`**: Risk-based testing requirements

### Examples Directory (`/examples`)
- **`workflow-integration-example.md`**: Complete end-to-end workflow demonstration

### Generated Files
- **`setup.sh`**: Automated setup script for the installed project
- **`.gitignore`**: Comprehensive ignore patterns for AI development projects

## Usage Examples

### Basic Setup
```bash
# Clone and run interactive installer
git clone https://github.com/snarktank/ai-dev-tasks.git
cd ai-dev-tasks
./install.sh

# The installer will prompt you for the installation location
# For example, you might enter: ./my-project or /home/user/my-project

# Run setup script in installed directory
cd [your-chosen-directory]
./setup.sh
```

### Custom Directory Setup
```bash
# Install to existing project directory
git clone https://github.com/snarktank/ai-dev-tasks.git
cd ai-dev-tasks
./install.sh

# When prompted, enter: ../my-project
# The installer will show the directory contents and ask for confirmation

# Navigate to your project
cd ../my-project
./setup.sh
```

### Development Setup
```bash
# Install with verbose output for development setup
git clone https://github.com/snarktank/ai-dev-tasks.git
cd ai-dev-tasks
./install.sh --verbose

# When prompted, enter your desired directory (e.g., ./dev-project)
# The installer will provide detailed information about the process

# Run initial setup
cd [your-chosen-directory]
./setup.sh
```

## Testing and Validation

### Dry Run Mode
```bash
# See what would be installed without actually installing
./install.sh --dry-run --verbose
```

### Verbose Installation
```bash
# See detailed output during installation
./install.sh --verbose
# When prompted, enter your desired directory to see detailed installation process
```

### Overwrite Existing Files
```bash
# Replace existing files (use with caution)
./install.sh --overwrite
# When prompted, choose a directory that contains existing files
```

### Interactive Testing
```bash
# Test the interactive prompts
./install.sh --dry-run
# This will show the prompt flow without actually installing files
```

## .gitignore Template

The installer creates a comprehensive `.gitignore` file that includes:

### AI Dev Tasks Specific Patterns
```gitignore
# Generated files
tasks-*.md
*-prd-*.md
evidence/
docs/generated-*.md

# AI development artifacts
.ai-dev-cache/
.ai-dev-temp/
.ai-dev-backup/
```

### Development Environment
```gitignore
# Node.js
node_modules/
*.log

# Build outputs
dist/
build/
coverage/
.nyc_output/
```

### IDE and Editor Files
```gitignore
# IDE files
.vscode/
.idea/
*.swp
*~

# OS files
.DS_Store
Thumbs.db
```

## Setup Script Features

The generated `setup.sh` script provides:

### Environment Detection
- Checks for AI tools (Cursor, Claude Code)
- Validates Node.js installation
- Checks Git availability

### Directory Structure
- Creates `tasks/` directory for task lists
- Creates `docs/` directory for documentation
- Creates `evidence/` directory for testing artifacts

### Quick Start Guidance
- Provides next steps for AI development
- References documentation locations
- Includes tips for successful workflow usage

## Advanced Usage

### Multiple Project Setup
```bash
# Install to multiple projects (interactive for each)
./install.sh
# When prompted, enter: ./project-a

./install.sh  
# When prompted, enter: ./project-b

./install.sh
# When prompted, enter: ./project-c
```

### CI/CD Integration
```bash
# For CI/CD, use the dry-run mode to check installations
./install.sh --dry-run --verbose

# Or use non-interactive installation by piping responses
echo "./project" | ./install.sh --gitignore
```

### Remote Installation
```bash
# Install from remote repository (interactive)
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/install.sh | bash

# Or save and run locally
curl -L https://raw.githubusercontent.com/snarktank/ai-dev-tasks/main/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

## Troubleshooting

### Permission Issues
```bash
# Make installer executable
chmod +x install.sh

# Or run with bash directly
bash install.sh ./my-project
```

### Directory Exists Error
```bash
# The installer will show directory contents and ask for confirmation
./install.sh

# When prompted, if the directory exists, you can:
# - Type 'y' to continue and overwrite files (default behavior)
# - Type 'n' to choose a different directory
# - Type 'q' to cancel installation

# Or prevent overwriting with --no-overwrite flag
./install.sh --no-overwrite
```

### File Not Found Errors
```bash
# Ensure you're running from the correct directory
ls -la
pwd

# Check for required files
ls -la create-prd.md generate-tasks.md process-task-list.md
```

### Git Integration
```bash
# Initialize git repository after installation
cd my-project
git init
git add .
git commit -m "feat: Add AI Dev Tasks workflow"

# Create feature branch for development
git checkout -b feature/user-authentication
```

## Best Practices

### Directory Organization
```bash
# Recommended project structure
my-project/
├── ai-dev-tasks/          # AI Dev Tasks workflow files
├── tasks/                  # Generated PRDs and task lists
├── docs/                   # Generated documentation
├── examples/               # Examples and demos
├── src/                    # Your project source code
└── .gitignore             # Git ignore patterns
```

### Team Collaboration
```bash
# Install for team environments (gitignore and overwrite are enabled by default)
./install.sh ./team-project

# Share setup instructions with team
echo "Run ./setup.sh to configure your environment"
```

### Version Control
```bash
# Track AI Dev Tasks version in your project
git add ai-dev-tasks/
git commit -m "feat: Add AI Dev Tasks v1.0.0"

# Update to latest version (overwrite is enabled by default)
git pull origin main
./install.sh .
```

### Backup and Restore
```bash
# Backup current installation
cp -r ai-dev-tasks/ backup-ai-dev-tasks-$(date +%Y%m%d)

# Restore from backup
cp -r backup-ai-dev-tasks-20251015/ ./ai-dev-tasks
```

## Integration Examples

### Next.js Project
```bash
./install.sh
# When prompted, enter: ./my-nextjs-app
cd my-nextjs-app
./setup.sh
```

### React Project
```bash
./install.sh
# When prompted, enter: ./my-react-app
cd my-react-app
./setup.sh
```

### TypeScript Project
```bash
./install.sh
# When prompted, enter: ./my-ts-project
cd my-ts-project
./setup.sh
```

### Full-Stack Application
```bash
# Create project structure first
mkdir -p fullstack-app/frontend
mkdir -p fullstack-app/backend
mkdir -p fullstack-app/docs

# Install for frontend
./install.sh
# When prompted, enter: ./fullstack-app/frontend

# Install for backend
./install.sh
# When prompted, enter: ./fullstack-app/backend

# Install for docs
./install.sh
# When prompted, enter: ./fullstack-app/docs

# Or install all at once in root directory
./install.sh
# When prompted, enter: ./fullstack-app
```

## Security Considerations

### File Permissions
- Installer script is executable by default
- Setup script permissions are set automatically
- All files maintain original permissions

### Safe Installation
- Dry run mode available for testing
- Overwrite protection prevents accidental file loss
- Comprehensive .gitignore prevents committing sensitive files

### Validation
- Checks for required files before installation
- Validates directory structure
- Provides clear error messages for troubleshooting

## Contributing

To contribute to the installer:

1. **Test thoroughly**: Use dry-run mode before changes
2. **Documentation**: Update this file for new features
3. **Version control**: Commit changes with clear descriptions
4. **Cross-platform**: Test on different operating systems

### Development Setup
```bash
# Clone repository
git clone https://github.com/snarktank/ai-dev-tasks.git
cd ai-dev-tasks

# Test installer locally
./install.sh --dry-run --verbose

# Test interactive prompts
echo "/tmp/test" | ./install.sh --dry-run

# Test actual installation
echo "/tmp/test" | ./install.sh --gitignore

# Verify installation
ls -la /tmp/test
```

## Support

For issues, questions, or contributions:

1. **Check the documentation**: Read this file and related docs
2. **Test with dry-run**: Use `--dry-run` flag to test changes
3. **Report issues**: Include operating system and error messages
4. **Request features**: Open an issue with detailed requirements

## Version History

- **v1.0.0**: Initial installer with basic functionality
- **v1.1.0**: Added risk-based documentation structure
- **v1.2.0**: Enhanced .gitignore template and setup script
- **v1.3.0**: Added comprehensive testing and validation
- **v1.4.0**: Added interactive directory selection with enhanced user experience

## License

This installer is part of the AI Dev Tasks project and follows the MIT License.
