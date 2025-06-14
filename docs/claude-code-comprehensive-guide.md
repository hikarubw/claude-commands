# Claude Code Comprehensive Guide

> A complete reference for Claude Code features, commands, and custom extensions

## Table of Contents
- [Overview](#overview)
- [Slash Commands Reference](#slash-commands-reference)
- [CLI Commands & Flags](#cli-commands--flags)
- [Custom Commands](#custom-commands)
- [Configuration](#configuration)
- [Workflows & Best Practices](#workflows--best-practices)
- [Integration Options](#integration-options)
- [Sources & Additional Resources](#sources--additional-resources)

## Overview

Claude Code is Anthropic's official CLI tool that brings Claude directly into your terminal for software development tasks.

**Key Capabilities:**
- Direct terminal integration with file system access
- Code editing, bug fixing, and architecture analysis
- Git operations (commits, PRs, conflict resolution)
- Test execution and debugging
- Web search and documentation lookup
- Image analysis for visual references
- Extended thinking for complex problems

**Source:** [Claude Code Overview](https://docs.anthropic.com/en/docs/claude-code/overview)

## Slash Commands Reference

### Core Commands

| Command | Description | Usage |
|---------|-------------|-------|
| `/bug` | Report bugs to the development team | `/bug [description]` |
| `/clear` | Clear conversation history and start fresh | `/clear` |
| `/compact` | Compact the conversation to save context | `/compact` |
| `/config` | Modify configuration settings | `/config` |
| `/cost` | Show token usage and cost information | `/cost` |
| `/doctor` | Check installation health and troubleshoot | `/doctor` |
| `/help` | Get usage help and command information | `/help` |
| `/init` | Initialize a new project with Claude Code | `/init` |
| `/login` | Switch between Anthropic accounts | `/login` |
| `/logout` | Sign out of current account | `/logout` |
| `/memory` | Edit memory files for context | `/memory` |
| `/model` | Change the AI model being used | `/model` |
| `/permissions` | Manage tool permissions | `/permissions` |
| `/pr_comments` | View PR comments | `/pr_comments` |
| `/review` | Request code review | `/review` |
| `/status` | View system status | `/status` |
| `/terminal-setup` | Configure terminal for optimal use | `/terminal-setup` |
| `/vim` | Enter Vim mode for editing | `/vim` |

### Custom Commands

| Command Pattern | Description | Location |
|----------------|-------------|----------|
| `/project:*` | Project-specific commands | `.claude/commands/` |
| `/user:*` | Personal commands | `~/.claude/commands/` |

**Source:** [CLI Usage Documentation](https://docs.anthropic.com/en/docs/claude-code/cli-usage)

## CLI Commands & Flags

### Main Commands

```bash
# Start interactive REPL
claude

# Start with initial prompt
claude "fix the failing tests"

# Query via SDK, then exit
claude -p "explain this codebase structure"

# Process piped content
cat error.log | claude -p "analyze these errors"

# Continue most recent conversation
claude -c

# Update to latest version
claude update

# Configure MCP servers
claude mcp

# Manage configuration
claude config list
claude config get <key>
claude config set <key> <value>
```

### Important Flags

| Flag | Description | Example |
|------|-------------|---------|
| `--add-dir` | Add working directories | `claude --add-dir /path/to/project` |
| `--allowedTools` | Specify allowed tools | `claude --allowedTools bash,read,write` |
| `--disallowedTools` | Specify disallowed tools | `claude --disallowedTools webSearch` |
| `--print` / `-p` | Print response without interactive mode | `claude -p "generate unit tests"` |
| `--output-format` | Output format (text, json, stream-json) | `claude --output-format json` |
| `--verbose` | Enable detailed logging | `claude --verbose` |
| `--max-turns` | Limit agentic turns | `claude --max-turns 10` |
| `--model` | Set AI model | `claude --model claude-3-5-sonnet-20241022` |
| `--resume` | Resume specific session | `claude --resume <session-id>` |
| `--continue` | Load most recent conversation | `claude --continue` |

**Source:** [CLI Usage Documentation](https://docs.anthropic.com/en/docs/claude-code/cli-usage)

## Custom Commands

Custom commands are a powerful feature for extending Claude Code with project-specific or personal shortcuts.

### Creating Project Commands

```bash
# Create project command directory
mkdir -p .claude/commands

# Create a simple command
echo "Analyze the performance of this code and suggest optimizations: \$ARGUMENTS" > .claude/commands/optimize.md

# Create a subdirectory for organization
mkdir .claude/commands/testing
echo "Generate comprehensive unit tests for: \$ARGUMENTS" > .claude/commands/testing/unit.md
```

### Creating User Commands

```bash
# Create user command directory
mkdir -p ~/.claude/commands

# Create personal productivity command
echo "Refactor this code to follow clean code principles: \$ARGUMENTS" > ~/.claude/commands/refactor.md
```

### Using Custom Commands

```bash
# Project command
/project:optimize src/utils.js

# Subdirectory command
/project:testing/unit MyComponent.tsx

# User command
/user:refactor legacy-code.py
```

### Custom Command Best Practices

1. **Use descriptive names** - Command names should clearly indicate their purpose
2. **Include $ARGUMENTS** - Allow dynamic input for flexibility
3. **Organize with subdirectories** - Group related commands together
4. **Document commands** - Add comments or README files explaining usage
5. **Version control project commands** - Include `.claude/commands/` in git

**Source:** [CLI Usage Documentation](https://docs.anthropic.com/en/docs/claude-code/cli-usage)

## Configuration

### Configuration Hierarchy

1. **User Settings** - `~/.claude/settings.json`
2. **Project Settings** - `.claude/settings.json`
3. **Local Overrides** - `.claude/settings.local.json`
4. **Enterprise Policies** - Managed centrally

### Common Configuration Options

```json
{
  "model": "claude-3-5-sonnet-20241022",
  "maxTurns": 20,
  "allowedTools": ["bash", "read", "write", "edit"],
  "verbose": false,
  "outputFormat": "text",
  "apiKey": "<YOUR_API_KEY>"
}
```

### Memory Files (CLAUDE.md)

Claude Code uses special memory files to maintain context:

- **Project Memory**: `.claude/CLAUDE.md` - Project-specific instructions
- **User Memory**: `~/.claude/CLAUDE.md` - Personal preferences across all projects

**Source:** [Memory Documentation](https://docs.anthropic.com/en/docs/claude-code/memory)

## Workflows & Best Practices

### Recommended Development Workflow

1. **Explore** - Let Claude read and understand the codebase
   ```bash
   claude "explore the project structure and main components"
   ```

2. **Plan** - Create detailed implementation plans
   ```bash
   claude "create a plan for implementing user authentication"
   ```

3. **Code** - Implement incrementally with tests
   ```bash
   claude "implement the login endpoint with tests"
   ```

4. **Commit** - Use contextual commits
   ```bash
   claude commit
   ```

### Best Practices

- **Create CLAUDE.md files** for project-specific context
- **Use custom commands** for repetitive tasks
- **Leverage visual iteration** with screenshots
- **Maintain focused context** with `/clear` when switching tasks
- **Follow test-driven development** patterns
- **Course correct early** in conversations

### Advanced Patterns

1. **Multi-Claude Workflows**
   ```bash
   # Terminal 1: Frontend work
   claude "work on the React components"
   
   # Terminal 2: Backend work
   claude "implement the API endpoints"
   ```

2. **Headless Automation**
   ```bash
   # Batch processing
   find . -name "*.test.js" | xargs -I {} claude -p "update {} to use modern syntax"
   ```

3. **Git Worktrees**
   ```bash
   # Isolated feature development
   git worktree add ../feature-branch
   cd ../feature-branch
   claude "implement the new feature"
   ```

**Source:** [Tutorials](https://docs.anthropic.com/en/docs/claude-code/tutorials)

## Integration Options

### Amazon Bedrock
```bash
export ANTHROPIC_USE_BEDROCK=true
export AWS_REGION=us-east-1
export AWS_PROFILE=<YOUR_AWS_PROFILE>
claude
```

### Google Vertex AI
```bash
export ANTHROPIC_USE_VERTEX=true
export ANTHROPIC_VERTEX_PROJECT_ID=<YOUR_PROJECT_ID>
export ANTHROPIC_VERTEX_REGION=us-central1
claude
```

### Model Context Protocol (MCP)
```bash
# Configure MCP servers
claude mcp

# Use with custom tools
claude --mcp-server @example/server
```

**Source:** [Bedrock & Vertex Proxies](https://docs.anthropic.com/en/docs/claude-code/bedrock-vertex-proxies)

## Sources & Additional Resources

### Official Documentation
- [Claude Code Overview](https://docs.anthropic.com/en/docs/claude-code/overview)
- [Getting Started Guide](https://docs.anthropic.com/en/docs/claude-code/getting-started)
- [CLI Usage](https://docs.anthropic.com/en/docs/claude-code/cli-usage)
- [Memory Management](https://docs.anthropic.com/en/docs/claude-code/memory)
- [Settings](https://docs.anthropic.com/en/docs/claude-code/settings)
- [Security & Permissions](https://docs.anthropic.com/en/docs/claude-code/security)
- [Costs](https://docs.anthropic.com/en/docs/claude-code/costs)
- [Tutorials](https://docs.anthropic.com/en/docs/claude-code/tutorials)
- [Troubleshooting](https://docs.anthropic.com/en/docs/claude-code/troubleshooting)

### Additional Resources
- [Claude Code Product Page](https://www.anthropic.com/claude-code)
- [Claude Code Best Practices](https://www.anthropic.com/engineering/claude-code-best-practices)
- [Prompt Engineering Guide](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview)

### Community
- Report issues: [GitHub Issues](https://github.com/anthropics/claude-code/issues)
- Get help: Use `/help` command in Claude Code

---

*This guide is maintained as part of the claude-commands project for quick reference and team onboarding.*