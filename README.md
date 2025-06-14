# Claude Commands

> Essential custom commands for Claude Code

## Overview

A curated collection of Claude Code commands optimized for daily development workflows. These commands provide complex, multi-step operations that go beyond Claude's standard capabilities.

These commands are designed to work with any programming language - Claude automatically detects your project and adapts accordingly.

## 🚀 Quick Start

### 1. Install Commands

#### One-Line Install (Recommended)

**Install globally (recommended for personal use):**
```bash
curl -sSL https://raw.githubusercontent.com/hikarubw/claude-commands/main/install.sh | bash -s -- --user
```

**Or clone and install:**
```bash
git clone https://github.com/hikarubw/claude-commands.git
cd claude-commands
./install.sh --user
```

### 2. Use Commands
```bash
/user:help          # Show all available commands
```

### 3. Start Using
```bash
# Initialize a new project
/user:init

# Check code quality
/user:check

# Push with smart workflow
/user:push

# Before ending your session
/user:handover
```

## 📦 Essential Commands

Only 6 commands that add real value beyond what Claude already does well:

- **`/user:init`** - Initialize a new project with comprehensive setup (CI/CD, testing, docs)
- **`/user:check`** - Run ALL quality checks in parallel with actionable insights  
- **`/user:plan`** - Create detailed project plans using critical thinking mode ("ultrathink") ⚠️ *High token usage*
- **`/user:push`** - Smart git workflow with intelligent commits and CI monitoring
- **`/user:handover`** - Prepare session handover documentation
- **`/user:research`** - Deep technical research using critical thinking mode ("ultrathink") ⚠️ *High token usage*

### ⚠️ Token Usage Note
The `plan` and `research` commands use deep critical thinking mode ("ultrathink") which consumes 5-10x more tokens than regular commands. Use them when you need thorough analysis and are willing to invest in comprehensive results.

### Why So Few Commands?

Commands were removed for things Claude already does well:
- Building projects? Just ask: "build my project"
- Running tests? Just ask: "run tests"
- Debugging? Just ask: "debug this error"
- Code review? Just ask: "review my code"

These 6 commands provide complex workflows that go beyond simple tasks.

## 🌟 Why These Commands Exist

- **Language agnostic** - Works with any programming language
- **Saves time** - Common tasks automated
- **Consistent workflow** - Same commands across all projects
- **Smart defaults** - Claude figures out the details

## 🛠️ Managing Your Custom Commands

### ⚠️ Important: Reinstallation Warning

**Reinstalling will overwrite ALL your local changes!**
- Any commands you've modified will be replaced
- Any commands you've deleted will return
- Any custom commands you've added will be lost

**Before reinstalling:**
1. The installer will ask if you want to backup existing commands
2. **Always choose "y" to backup** if you've made any local changes
3. Backups are saved to `~/.claude/commands.backup.YYYYMMDD_HHMMSS`

### Preserving Local Changes

Since reinstalling overwrites everything, here are strategies to keep your customizations:

1. **Create a Custom Folder**
   ```bash
   # Add your own commands here - they won't be in the repo
   mkdir ~/.claude/commands/custom
   # Create custom commands like: ~/.claude/commands/custom/mycommand.md
   # Use them with: /user:custom:mycommand
   ```

2. **Fork This Repository**
   - Fork to your own GitHub account
   - Commit your changes to your fork
   - Install from your fork instead

3. **Manual Backup**
   ```bash
   # Before updating
   cp -r ~/.claude/commands ~/.claude/commands.my-backup
   # After updating, restore your custom commands
   cp ~/.claude/commands.my-backup/custom/* ~/.claude/commands/custom/
   ```

## 🍴 For Repository Forkers

If you're forking this repository to create your own command collection:

### Configure Your Fork

After forking, you need to update all references from the original GitHub username to yours:

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/claude-commands.git
cd claude-commands

# Run the configuration script
./configure-fork.sh your-github-username
```

This script will:
- Replace all instances of 'hikarubw' with your GitHub username
- Update installation URLs in documentation
- Prepare your fork for distribution

⚠️ **Note**: Regular users should NOT run this script. It's only for repository forkers.

## 📖 Documentation

See [docs](docs/) for more details about how the commands work.

## 📄 License

MIT License - see [LICENSE](LICENSE) file.

---

*Personal productivity commands for [Claude Code](https://www.anthropic.com/claude-code)*