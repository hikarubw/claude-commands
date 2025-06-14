#!/bin/bash

# Claude Commands Curl Installation Script
# This script downloads and installs claude-commands via curl

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

# Header
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}Claude Commands Installer${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Check for required commands
for cmd in curl tar; do
    if ! command -v $cmd &> /dev/null; then
        print_error "$cmd is required but not installed"
        exit 1
    fi
done

# Parse arguments
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
        --repo)
            REPO_URL="$2"
            ARCHIVE_URL="${REPO_URL}/archive/main.tar.gz"
            shift
            shift
            ;;
        --help|-h)
            echo "Usage: curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash -s -- [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --user, -u              Install globally for user (~/.claude/commands)"
            echo "  --project, -p [PATH]    Install for specific project (default: current directory)"
            echo "  --repo URL              Custom repository URL"
            echo "  --help, -h              Show this help message"
            echo ""
            echo "Examples:"
            echo "  # Install globally:"
            echo "  curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash -s -- --user"
            echo ""
            echo "  # Install for current project:"
            echo "  curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash -s -- --project"
            echo ""
            echo "  # Interactive mode:"
            echo "  curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Interactive mode if no arguments
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

# Create temporary directory
TEMP_DIR=$(mktemp -d)
trap "rm -rf $TEMP_DIR" EXIT

print_info "Downloading Claude Commands..."

# Download and extract
if ! curl -sSL "$ARCHIVE_URL" | tar -xz -C "$TEMP_DIR" --strip-components=1; then
    print_error "Failed to download from $ARCHIVE_URL"
    print_info "Please check the repository URL or your internet connection"
    exit 1
fi

# Export for install script
export CLAUDE_COMMANDS_TEMP="$TEMP_DIR"

# Run the install script with selected options
print_info "Running installation..."

if [ "$INSTALL_TYPE" = "user" ]; then
    bash "$TEMP_DIR/install.sh" --user
else
    bash "$TEMP_DIR/install.sh" --project "$PROJECT_PATH"
fi

print_success "Installation complete via curl!"