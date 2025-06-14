# Contributing to Claude Commands

Thank you for your interest in contributing to Claude Commands! This document provides guidelines for contributing to this repository.

## ⚠️ Important Note for Users

**If you're modifying commands for personal use:**
- Consider forking this repository instead of modifying locally
- Local modifications will be LOST when you update/reinstall
- Use `~/.claude/commands/custom/` for your personal commands
- Always backup before reinstalling (the installer will prompt you)

## How to Contribute

### Reporting Issues
1. Check if the issue already exists
2. Include clear description and steps to reproduce
3. Mention your OS and Claude Code version

### Submitting Pull Requests
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-command`)
3. Make your changes
4. Test the installation process
5. Commit with clear messages
6. Push to your branch
7. Create a Pull Request

## Command Development Guidelines

### Creating New Commands
Commands should:
- Be language-agnostic (detect and adapt to any language)
- Focus on instructions for Claude, not hardcoded implementations
- Follow the existing structure and naming conventions
- Include clear documentation within the command file

### Command Structure
```markdown
# Command Name

Brief description of what this command does.

## Command Purpose
Clear explanation of the command's goal.

## Actions to Perform
1. **Step One**
   - Specific instruction
   - Another instruction

2. **Step Two**
   - More instructions

## Approach Guidelines
- Quality standards
- Best practices
- Things to avoid
```

### Testing Commands
Before submitting:
1. Test with multiple programming languages
2. Verify both user-level and project-level installation
3. Ensure command names follow the pattern: `/prefix:folder:command`
4. Check that `$ARGUMENTS` placeholder works correctly

## Code Style
- Use clear, descriptive names
- Keep commands focused on a single purpose
- Write comprehensive but concise documentation
- Follow existing formatting patterns

## Documentation
- Update README.md if adding new command categories
- Keep command descriptions concise but informative
- Include examples where helpful
- Ensure all documentation is accurate

## Questions?
Feel free to open an issue for any questions about contributing!