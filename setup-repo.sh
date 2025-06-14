#!/bin/bash

# Setup script to configure the repository with your GitHub username

echo "Claude Commands Repository Setup"
echo "================================"
echo ""

# Default to hikaru, but allow override
DEFAULT_USERNAME="hikaru"

# Check if username provided as argument
if [ -n "$1" ]; then
    GITHUB_USERNAME="$1"
else
    # Prompt for GitHub username with default
    read -p "Enter your GitHub username (default: $DEFAULT_USERNAME): " GITHUB_USERNAME
    GITHUB_USERNAME=${GITHUB_USERNAME:-$DEFAULT_USERNAME}
fi

echo "Configuring repository for: $GITHUB_USERNAME"

# Replace placeholder in all files
find . -type f \( -name "*.md" -o -name "*.sh" -o -name "*.ps1" \) -not -path "./.git/*" -exec sed -i.bak "s/hikarubw/$GITHUB_USERNAME/g" {} \;

# Remove backup files
find . -name "*.bak" -type f -delete

echo "✅ Repository configured successfully!"
echo ""
echo "Next steps:"
echo "1. Review the changes"
echo "2. Commit and push to your GitHub repository"
echo "3. Users can now install with:"
echo "   curl -sSL https://raw.githubusercontent.com/$GITHUB_USERNAME/claude-commands/main/install-curl.sh | bash"