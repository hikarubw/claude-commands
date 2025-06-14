# Claude Commands Overview

## ⚠️ Important: Updates and Reinstallation

**Reinstalling this command collection will overwrite ALL local changes!**

If you've:
- Modified any existing commands
- Deleted commands you don't use  
- Added your own custom commands

**These changes will be LOST when you reinstall or update.**

### How to Preserve Your Customizations

1. **Always backup when prompted** - The installer asks if you want to backup existing commands
2. **Use a custom folder** - Create `~/.claude/commands/custom/` for your own commands
3. **Fork the repository** - Maintain your own version with your modifications

## How These Commands Work

The commands in this repository are **instruction files** that tell Claude what to do when invoked. They don't contain actual code implementations - instead, they provide Claude with:

1. **Clear objectives** - What the command should accomplish
2. **Step-by-step instructions** - How to approach the task
3. **Quality guidelines** - Standards to maintain
4. **Adaptation rules** - How to handle different languages/frameworks

When you run a command like `/project:test generate`, Claude will:
1. Read the command instructions
2. Analyze your specific project
3. Generate appropriate code for your language/framework
4. Execute the requested actions
5. Provide relevant output

## Command Organization

```
.claude/commands/
├── help.md      # Command listing
├── init.md      # Project initialization  
├── check.md     # Quality checks
├── plan.md      # Project planning
├── push.md      # Git workflow
├── handover.md  # Session documentation
└── research.md  # Technical research
```

### Why Only 6 Commands?

We've aggressively reduced from 18+ commands to just 6 essential ones. Each remaining command provides significant value beyond what Claude already does well:

- **Removed**: build, lint, test, debug, review, deploy, monitor, deps (as individual commands)
- **Why**: Claude already handles these simple tasks excellently when asked directly
- **Kept**: Complex multi-step workflows that benefit from structured automation

## Key Concepts

### Language Agnostic
Commands work with any programming language because they instruct Claude to:
- Detect the project's language first
- Use appropriate tools for that language
- Follow language-specific conventions
- Generate idiomatic code

### Adaptive Behavior
Each command tells Claude to:
- Analyze the existing project structure
- Respect current configurations
- Match the project's coding style
- Use installed tools and frameworks

### Safety First
Commands instruct Claude to:
- Create backups before changes
- Run tests after modifications
- Provide rollback options
- Verify actions before proceeding

## Example: How `/project:test generate` Works

1. **Claude reads the command** which says:
   - "Detect the project's language and test framework"
   - "Analyze the target code to understand its purpose"
   - "Generate comprehensive test cases"
   - "Follow the project's existing test patterns"

2. **Claude analyzes your project**:
   - Finds you're using Python with pytest
   - Sees your existing test style
   - Understands the code to test

3. **Claude generates appropriate tests**:
   - Creates Python test files
   - Uses pytest syntax
   - Matches your naming conventions
   - Covers edge cases

The same command works for JavaScript, Go, Rust, etc. because the instructions tell Claude to adapt, not what specific code to write.

## Creating Your Own Commands

Commands are just markdown files with instructions:

```markdown
# My Custom Command

Purpose: [What this command does]

## Actions to Perform

1. **First Step**
   - Specific instruction
   - Another instruction

2. **Second Step**
   - More instructions

## Guidelines
- Quality standard to maintain
- Approach to take
- Things to avoid
```

The key is writing clear instructions that Claude can follow for any project context.