#!/bin/bash

# Claude Commands Installation Script
# This script can be run either:
# 1. Via curl for direct installation from GitHub
# 2. From a cloned repository

set -e  # Exit on error

# Configuration
REPO_URL="https://github.com/hikarubw/claude-commands"
ARCHIVE_URL="${REPO_URL}/archive/main.tar.gz"

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

# Validate input
validate_path() {
    local path="$1"
    # Check for path traversal attempts
    if [[ "$path" == *".."* ]]; then
        print_error "Invalid path: Path traversal detected"
        exit 1
    fi
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
            if [[ -n "${2:-}" ]] && [[ ! "${2}" =~ ^- ]]; then
                validate_path "$2"
                PROJECT_PATH="$2"
                shift
            else
                PROJECT_PATH="$(pwd)"
            fi
            shift
            ;;
        --repo)
            REPO_URL="$2"
            ARCHIVE_URL="${REPO_URL}/archive/main.tar.gz"
            shift
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo "       curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install.sh | bash -s -- [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --user, -u              Install globally for user (~/.claude/commands)"
            echo "  --project, -p [PATH]    Install for specific project (default: current directory)"
            echo "  --repo URL              Custom repository URL"
            echo "  --help, -h              Show this help message"
            echo ""
            echo "Examples:"
            echo "  # Install globally via curl:"
            echo "  curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install.sh | bash -s -- --user"
            echo ""
            echo "  # Install from cloned repo:"
            echo "  ./install.sh --user"
            echo ""
            echo "Interactive mode: Run without arguments to choose interactively"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Run with --help for usage"
            exit 1
            ;;
    esac
done

# Check if we're running from a cloned repository or via curl
if [ -d ".claude/commands" ]; then
    # Running from cloned repository
    SOURCE_DIR=".claude/commands"
    print_info "Installing from local repository"
elif [ -t 0 ]; then
    # Running interactively but not from repo - download first
    print_info "Not in claude-commands directory. Downloading from GitHub..."
    
    # Check for required commands
    for cmd in curl tar; do
        if ! command -v $cmd &> /dev/null; then
            print_error "$cmd is required but not installed"
            exit 1
        fi
    done
    
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    trap "rm -rf $TEMP_DIR" EXIT
    
    # Download and extract
    if ! curl -sSL "$ARCHIVE_URL" | tar -xz -C "$TEMP_DIR" --strip-components=1; then
        print_error "Failed to download from $ARCHIVE_URL"
        print_info "Please check your internet connection or clone the repository manually"
        exit 1
    fi
    
    SOURCE_DIR="$TEMP_DIR/.claude/commands"
    print_success "Downloaded claude-commands successfully"
else
    # Running via curl pipe
    print_info "Installing via curl"
    
    # Create temporary directory
    TEMP_DIR=$(mktemp -d)
    trap "rm -rf $TEMP_DIR" EXIT
    
    # Download and extract
    if ! curl -sSL "$ARCHIVE_URL" | tar -xz -C "$TEMP_DIR" --strip-components=1; then
        print_error "Failed to download from $ARCHIVE_URL"
        exit 1
    fi
    
    SOURCE_DIR="$TEMP_DIR/.claude/commands"
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
            if [[ -n "$input_path" ]]; then
                validate_path "$input_path"
                PROJECT_PATH="$input_path"
            else
                PROJECT_PATH="$(pwd)"
            fi
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
    # Default to current directory if not specified
    PROJECT_PATH="${PROJECT_PATH:-$(pwd)}"
    TARGET_DIR="$PROJECT_PATH/.claude/commands"
    PREFIX="/project:"
fi

# Check if target directory exists
if [ -d "$TARGET_DIR" ]; then
    print_warning "Directory $TARGET_DIR already exists"
    echo ""
    read -p "Do you want to backup existing commands? (y/n): " backup_choice
    
    if [[ "$backup_choice" =~ ^[Yy]$ ]]; then
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        BACKUP_DIR="$HOME/.claude/commands.backup.$TIMESTAMP"
        print_info "Creating backup at $BACKUP_DIR"
        mv "$TARGET_DIR" "$BACKUP_DIR"
        print_success "Backup created successfully"
    else
        print_warning "Existing commands will be overwritten"
        read -p "Are you sure you want to continue? (y/n): " continue_choice
        if [[ ! "$continue_choice" =~ ^[Yy]$ ]]; then
            print_info "Installation cancelled"
            exit 0
        fi
    fi
fi

# Create parent directory if it doesn't exist
PARENT_DIR=$(dirname "$TARGET_DIR")
if [ ! -d "$PARENT_DIR" ]; then
    print_info "Creating directory $PARENT_DIR"
    mkdir -p "$PARENT_DIR"
fi

# Copy commands
print_info "Installing commands to $TARGET_DIR"
cp -r "$SOURCE_DIR" "$TARGET_DIR"

# Count installed commands
COMMAND_COUNT=$(find "$TARGET_DIR" -name "*.md" -type f | wc -l | tr -d ' ')

print_success "Installation complete!"
echo ""
echo -e "✅ Installed ${GREEN}$COMMAND_COUNT${NC} commands to ${BLUE}$TARGET_DIR${NC}"
echo ""

# Display available commands
echo -e "${BLUE}Available Commands:${NC}"
echo -e "  • ${PREFIX}help      - Show all available commands"
echo -e "  • ${PREFIX}init      - Initialize new project with .claude/"
echo -e "  • ${PREFIX}check     - Pre-deployment check: lint, test, security"
echo -e "  • ${PREFIX}handover  - Session handover with context"
echo -e "  • ${PREFIX}push      - Prepare clean Git commit"
echo -e "  • ${PREFIX}plan      - Create project architecture plan"
echo -e "  • ${PREFIX}research  - Deep research on technical topics"
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
COMMANDS_PATH="$HOME/.claude/commands"

if [ -d "$COMMANDS_PATH" ]; then
    rm -rf "$COMMANDS_PATH"
    echo "✅ Commands removed from user directory"
else
    echo "❌ No commands found to remove"
fi

# Remove this uninstall script
rm -f "$0"
EOF
    chmod +x "$HOME/.claude/uninstall-commands.sh"
    print_info "To uninstall later, run: ~/.claude/uninstall-commands.sh"
else
    UNINSTALL_PATH="$PROJECT_PATH/.claude/uninstall-commands.sh"
    cat > "$UNINSTALL_PATH" << EOF
#!/bin/bash
# Uninstall claude-commands from project

echo "Uninstalling Claude Commands from project..."
COMMANDS_PATH="$PROJECT_PATH/.claude/commands"

if [ -d "\$COMMANDS_PATH" ]; then
    rm -rf "\$COMMANDS_PATH"
    echo "✅ Commands removed from project"
else
    echo "❌ No commands found to remove"
fi

# Remove this uninstall script
rm -f "\$0"
EOF
    chmod +x "$UNINSTALL_PATH"
    print_info "To uninstall later, run: $UNINSTALL_PATH"
fi

print_success "Happy coding with Claude! 🚀"