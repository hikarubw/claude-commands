# Installation Guide

## Quick Install via Curl (Recommended)

### User-Level Installation (Global)
```bash
# Install for all projects
curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash -s -- --user
```

### Project-Level Installation
```bash
# Install for current project
curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash -s -- --project

# Install for specific project
curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash -s -- --project /path/to/project
```

### Interactive Installation
```bash
# Choose installation type interactively
curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install-curl.sh | bash
```

## Install via Git Clone

### macOS/Linux
```bash
# Clone the repository
git clone https://github.com/hikarubw/claude-commands.git
cd claude-commands

# Interactive mode (choose user or project)
./install.sh

# Or specify directly
./install.sh --user              # Install globally
./install.sh --project           # Install for current project
./install.sh --project /path     # Install for specific project
```

### Windows
```powershell
# Clone the repository
git clone https://github.com/hikarubw/claude-commands.git
cd claude-commands

# Run the install script
.\install.ps1
```

## Installation Options

### User-Level (Global) Installation
- Installs to: `~/.claude/commands/`
- Available in all projects
- Use with prefix: `/user:`
- Example: `/user:init`, `/user:dev test`

### Project-Level Installation
- Installs to: `<project>/.claude/commands/`
- Available only in that project
- Use with prefix: `/project:`
- Example: `/project:init`, `/project:dev test`

## Manual Installation

### For User-Level
```bash
mkdir -p ~/.claude/commands
cp -r .claude/commands/* ~/.claude/commands/
```

### For Project-Level
```bash
mkdir -p /your/project/.claude/commands
cp -r .claude/commands/* /your/project/.claude/commands/
```

## Using the Commands

Commands follow the pattern: `/prefix:folder:command`

### User-Level Commands (Global)
After installation to `~/.claude/commands/`, use with `/user:` prefix:

- `/user:core:init` - Initialize a new project
- `/user:core:dev` - Development tasks
- `/user:dev:test` - Testing tools
- `/user:dev:debug` - Debug assistance
- `/user:core:handover` - Session handover
- `/user:help` - Show all commands

### Project-Level Commands
After installation to a project, use with `/project:` prefix:

```bash
/project:core:init
/project:core:dev test
/project:dev:debug "error"
```

### Command Structure Example
The file `core/init.md` becomes:
- `/user:core:init` (if installed globally)
- `/project:core:init` (if installed in project)

## Updating Commands

To update to the latest version:

```bash
cd claude-commands
git pull
./install.sh  # or .\install.ps1 on Windows
```

## Uninstalling

### macOS/Linux
```bash
~/.claude/uninstall-commands.sh
```

### Windows
```powershell
~\.claude\uninstall-commands.ps1
```

Or manually remove:
```bash
rm -rf ~/.claude/commands
```

## Troubleshooting

### Permission Denied
If you get a permission error on macOS/Linux:
```bash
chmod +x install.sh
./install.sh
```

### Commands Not Found
Make sure you're using the correct prefix:
- `/user:` for globally installed commands
- `/project:` for project-specific commands

### Backup Location
Backups are created with timestamp:
- `~/.claude/commands.backup.YYYYMMDD_HHMMSS`

## Next Steps

1. Run `/user:help` to see all available commands
2. Try `/user:init` to create a new project
3. Read the [documentation](docs/command-overview.md) to understand how commands work
4. Create your own custom commands!