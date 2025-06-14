#!/bin/bash

# Claude Commands Installation Script
# This script installs the claude-commands to either user or project level

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
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

# Header
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}Claude Commands Installation${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Parse command line arguments
INSTALL_TYPE=""
PROJECT_PATH=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --user|-u)
            INSTALL_TYPE="user"
            shift
            ;;
        --project|-p)
            INSTALL_TYPE="project"
            PROJECT_PATH="${2:-$(pwd)}"
            shift
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --user, -u              Install globally for user (~/.claude/commands)"
            echo "  --project, -p [PATH]    Install for specific project (default: current directory)"
            echo "  --help, -h              Show this help message"
            echo ""
            echo "Interactive mode: Run without arguments to choose interactively"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Run $0 --help for usage"
            exit 1
            ;;
    esac
done

# Check if we're in claude-commands directory or downloading via curl
if [ -d ".claude/commands" ]; then
    SOURCE_DIR=".claude/commands"
elif [ -n "$CLAUDE_COMMANDS_TEMP" ]; then
    # Called from curl installation
    SOURCE_DIR="$CLAUDE_COMMANDS_TEMP/.claude/commands"
else
    print_error "This script must be run from the claude-commands directory"
    print_info "Please cd into the claude-commands directory and run: ./install.sh"
    exit 1
fi

# Interactive mode if no arguments provided
if [ -z "$INSTALL_TYPE" ]; then
    echo "Choose installation type:"
    echo "1) User level (global) - Available in all projects with /user: prefix"
    echo "2) Project level - Available in current project with /project: prefix"
    echo ""
    read -p "Enter your choice (1 or 2): " choice
    
    case $choice in
        1)
            INSTALL_TYPE="user"
            ;;
        2)
            INSTALL_TYPE="project"
            read -p "Enter project path (default: current directory): " input_path
            PROJECT_PATH="${input_path:-$(pwd)}"
            ;;
        *)
            print_error "Invalid choice"
            exit 1
            ;;
    esac
fi

# Set target directory based on installation type
if [ "$INSTALL_TYPE" = "user" ]; then
    TARGET_DIR="$HOME/.claude/commands"
    PREFIX="/user:"
else
    TARGET_DIR="$PROJECT_PATH/.claude/commands"
    PREFIX="/project:"
    
    # Verify project path exists
    if [ ! -d "$PROJECT_PATH" ]; then
        print_error "Project path does not exist: $PROJECT_PATH"
        exit 1
    fi
fi

# Check if target directory exists
if [ -d "$TARGET_DIR" ]; then
    echo ""
    echo -e "${RED}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║                    ⚠️  WARNING ⚠️                         ║${NC}"
    echo -e "${RED}║                                                          ║${NC}"
    echo -e "${RED}║  Existing commands found at: $TARGET_DIR${NC}"
    echo -e "${RED}║                                                          ║${NC}"
    echo -e "${RED}║  Reinstalling will:                                      ║${NC}"
    echo -e "${RED}║  • DELETE all your custom commands                       ║${NC}"
    echo -e "${RED}║  • OVERWRITE any commands you've modified                ║${NC}"
    echo -e "${RED}║  • RESTORE any commands you've deleted                   ║${NC}"
    echo -e "${RED}║                                                          ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    read -p "Do you want to backup existing commands? (STRONGLY RECOMMENDED) (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        BACKUP_DIR="$HOME/.claude/commands.backup.$(date +%Y%m%d_%H%M%S)"
        print_info "Creating backup at $BACKUP_DIR"
        mv "$TARGET_DIR" "$BACKUP_DIR"
        print_success "Backup created - you can restore custom commands from here later"
    else
        print_warning "⚠️  NO BACKUP WILL BE CREATED - Your changes will be permanently lost!"
        read -p "Are you ABSOLUTELY SURE you want to continue without backup? (yes/no) " -r
        echo
        if [[ ! "$REPLY" = "yes" ]]; then
            print_info "Installation cancelled - your existing commands are safe"
            exit 0
        fi
    fi
fi

# Create ~/.claude directory if it doesn't exist
if [ ! -d "$HOME/.claude" ]; then
    print_info "Creating ~/.claude directory"
    mkdir -p "$HOME/.claude"
fi

# Copy commands
print_info "Installing commands to $TARGET_DIR"
cp -r "$SOURCE_DIR" "$TARGET_DIR"

# Count installed commands
COMMAND_COUNT=$(find "$TARGET_DIR" -name "*.md" -type f | wc -l)

print_success "Installation complete!"
echo ""
echo -e "${GREEN}✅ Installed $COMMAND_COUNT commands to $TARGET_DIR${NC}"
echo ""

# Display available commands
echo -e "${BLUE}Available Commands:${NC}"
echo "    • ${PREFIX}init      - Initialize project with best practices"
echo "    • ${PREFIX}check     - Run all quality checks in parallel"
echo "    • ${PREFIX}plan      - Create project plans with multi-agent research"
echo "    • ${PREFIX}push      - Smart git workflow with CI monitoring"
echo "    • ${PREFIX}handover  - Prepare session documentation"
echo "    • ${PREFIX}research  - Deep technical research"
echo ""

# Show how to use help command
echo -e "${BLUE}To see all commands:${NC}"
echo -e "${GREEN}${PREFIX}help${NC}"
echo ""

# Show installation options for other type
if [ "$INSTALL_TYPE" = "user" ]; then
    echo -e "${BLUE}To install for a specific project:${NC}"
    echo -e "${GREEN}./install.sh --project /path/to/project${NC}"
else
    echo -e "${BLUE}To install globally for all projects:${NC}"
    echo -e "${GREEN}./install.sh --user${NC}"
fi
echo ""

# Create appropriate uninstall script
if [ "$INSTALL_TYPE" = "user" ]; then
    cat > "$HOME/.claude/uninstall-commands.sh" << 'EOF'
#!/bin/bash
# Uninstall claude-commands

echo "Uninstalling Claude Commands..."
if [ -d "$HOME/.claude/commands" ]; then
    rm -rf "$HOME/.claude/commands"
    echo "✅ Commands removed from user directory"
else
    echo "❌ No commands found to remove"
fi

# Remove this uninstall script
rm -f "$HOME/.claude/uninstall-commands.sh"
EOF
    chmod +x "$HOME/.claude/uninstall-commands.sh"
    print_info "To uninstall later, run: ~/.claude/uninstall-commands.sh"
else
    UNINSTALL_SCRIPT="$PROJECT_PATH/.claude/uninstall-commands.sh"
    cat > "$UNINSTALL_SCRIPT" << EOF
#!/bin/bash
# Uninstall claude-commands from project

echo "Uninstalling Claude Commands from project..."
if [ -d "$TARGET_DIR" ]; then
    rm -rf "$TARGET_DIR"
    echo "✅ Commands removed from project"
else
    echo "❌ No commands found to remove"
fi

# Remove this uninstall script
rm -f "$UNINSTALL_SCRIPT"
EOF
    chmod +x "$UNINSTALL_SCRIPT"
    print_info "To uninstall later, run: .claude/uninstall-commands.sh"
fi

echo ""
print_success "Happy coding with Claude! 🚀"