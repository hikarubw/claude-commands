# Command Structure and Naming

## Command Syntax

Based on the official Claude Code documentation, commands follow a specific pattern:

```
/prefix:folder:command
```

Where:
- **prefix**: `/user:` for user-level (global) or `/project:` for project-level commands
- **folder**: subdirectory name (optional, for organized commands)
- **command**: the command filename without `.md` extension

## Examples

### Simple Commands
- File: `help.md` → Command: `/user:help` or `/project:help`
- File: `init.md` → Command: `/user:init` or `/project:init`

### Commands in Folders
- File: `core/init.md` → Command: `/user:core:init` or `/project:core:init`
- File: `dev/test.md` → Command: `/user:dev:test` or `/project:dev:test`
- File: `utility/deps.md` → Command: `/user:utility:deps` or `/project:utility:deps`

### Nested Folders
- File: `dev/testing/unit.md` → Command: `/user:dev:testing:unit`
- File: `project/deploy/aws.md` → Command: `/user:project:deploy:aws`

## Installation Locations

### User-Level (Global)
- Location: `~/.claude/commands/`
- Prefix: `/user:`
- Scope: Available in all projects
- Example: `/user:core:dev`

### Project-Level
- Location: `.claude/commands/` (in project root)
- Prefix: `/project:`
- Scope: Available only in that project
- Example: `/project:core:dev`

## Our Command Organization

```
.claude/commands/
├── help.md                    # /user:help
├── core/                      # Core functionality
│   ├── init.md               # /user:core:init
│   ├── dev.md                # /user:core:dev
│   └── handover.md           # /user:core:handover
├── dev/                       # Development tools
│   ├── test.md               # /user:dev:test
│   ├── debug.md              # /user:dev:debug
│   └── review.md             # /user:dev:review
├── project/                   # Project management
│   ├── plan.md               # /user:project:plan
│   ├── deploy.md             # /user:project:deploy
│   └── monitor.md            # /user:project:monitor
└── utility/                   # Utilities
    ├── deps.md               # /user:utility:deps
    └── research.md           # /user:utility:research
```

## Command Arguments

Commands can accept arguments using the `$ARGUMENTS` placeholder:

```markdown
# In the command file
Research the following topic: $ARGUMENTS
```

Usage:
```bash
/user:utility:research "microservices vs monolith"
```

## Best Practices

1. **Use folders for organization**: Group related commands in folders
2. **Keep folder names short**: They become part of the command
3. **Use descriptive command names**: The filename should indicate the command's purpose
4. **Document the command path**: Include the full command path in the command's documentation
5. **Be consistent**: Use the same folder structure for both user and project commands

## Quick Reference

| File Path | User Command | Project Command |
|-----------|--------------|-----------------|
| `help.md` | `/user:help` | `/project:help` |
| `core/init.md` | `/user:core:init` | `/project:core:init` |
| `core/dev.md` | `/user:core:dev` | `/project:core:dev` |
| `dev/test.md` | `/user:dev:test` | `/project:dev:test` |
| `dev/debug.md` | `/user:dev:debug` | `/project:dev:debug` |
| `utility/deps.md` | `/user:utility:deps` | `/project:utility:deps` |