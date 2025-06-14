#!/bin/bash

# ONLY FOR USERS WHO FORK THIS REPOSITORY!
# This script replaces all instances of 'hikarubw' with your GitHub username
# Regular users should NOT run this script - just use the install.sh

echo "Claude Commands Fork Configuration"
echo "=================================="
echo "⚠️  This script is ONLY for users who have forked this repository!"
echo "   Regular users should run ./install.sh instead."
echo ""

# Default to placeholder, but allow override
DEFAULT_USERNAME="your-github-username"

# Check if username provided as argument
if [ -n "$1" ]; then
    GITHUB_USERNAME="$1"
else
    # Prompt for GitHub username with default
    read -p "Enter your GitHub username (default: $DEFAULT_USERNAME): " GITHUB_USERNAME
    GITHUB_USERNAME=${GITHUB_USERNAME:-$DEFAULT_USERNAME}
fi

echo ""
echo "This will replace all instances of 'hikarubw' with '$GITHUB_USERNAME' in:"
echo "  - All markdown files (.md)"
echo "  - All shell scripts (.sh)"
echo ""
read -p "Are you sure you want to continue? (y/n): " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Configuration cancelled."
    exit 0
fi

echo "Configuring repository for: $GITHUB_USERNAME"

# Replace placeholder in all files
find . -type f \( -name "*.md" -o -name "*.sh" \) -not -path "./.git/*" -exec sed -i.bak "s/hikarubw/$GITHUB_USERNAME/g" {} \;

# Remove backup files
find . -name "*.bak" -type f -delete

echo "✅ Repository configured successfully!"
echo ""
echo "Next steps:"
echo "1. Review the changes"
echo "2. Commit and push to your GitHub repository"
echo "3. Users can now install with:"
echo "   curl -sSL https://raw.githubusercontent.com/$GITHUB_USERNAME/claude-commands/main/install.sh | bash"