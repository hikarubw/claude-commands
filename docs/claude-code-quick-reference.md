# Claude Code Quick Reference Card

## Essential Commands

### Starting Claude
```bash
claude                          # Interactive mode
claude "fix bug in auth.js"     # Start with prompt
claude -p "explain this code"   # One-shot response
claude -c                       # Continue last chat
```

### Common Slash Commands
```bash
/help                          # Show help
/clear                         # Reset conversation
/model                         # Change AI model
/cost                          # Check token usage
/vim                           # Vim editing mode
```

### Custom Commands
```bash
/project:optimize utils.js     # Project command
/user:refactor old-code.py     # User command
```

## Practical Examples

### Bug Fixing Workflow
```bash
# 1. Describe the issue
claude "users report login fails with 500 error"

# 2. Claude investigates and fixes
# 3. Commit the fix
claude commit
```

### Code Review
```bash
# Review specific files
claude "review src/auth/*.js for security issues"

# Or use the review command
/review
```

### Test Writing
```bash
# Generate tests for a component
claude "write comprehensive tests for UserProfile component"

# Fix failing tests
claude "run tests and fix any failures"
```

### Refactoring
```bash
# Refactor with specific goals
claude "refactor PaymentService to use dependency injection"

# Extract repeated code
claude "find duplicate code and extract to shared utilities"
```

### Documentation
```bash
# Generate API docs
claude "document all public methods in services/"

# Update README
claude "update README with new setup instructions"
```

## Custom Command Examples

### Create Productivity Commands

**1. Code Analysis** (`.claude/commands/analyze.md`):
```markdown
Perform a comprehensive analysis of: $ARGUMENTS

Check for:
- Performance bottlenecks
- Security vulnerabilities  
- Code smells
- Missing error handling
- Optimization opportunities
```

**2. Test Generator** (`.claude/commands/test-gen.md`):
```markdown
Generate comprehensive unit tests for: $ARGUMENTS

Include:
- Happy path scenarios
- Edge cases
- Error conditions
- Mock external dependencies
- Achieve >80% coverage
```

**3. API Endpoint** (`.claude/commands/api-endpoint.md`):
```markdown
Create a new REST API endpoint for: $ARGUMENTS

Include:
- Route definition
- Controller logic
- Input validation
- Error handling
- Unit tests
- API documentation
```

**4. Debug Helper** (`.claude/commands/debug.md`):
```markdown
Debug the issue: $ARGUMENTS

Steps:
1. Reproduce the problem
2. Add detailed logging
3. Identify root cause
4. Implement fix
5. Add test to prevent regression
```

**5. Performance Optimizer** (`.claude/commands/perf.md`):
```markdown
Optimize performance of: $ARGUMENTS

Focus on:
- Algorithm complexity
- Database queries
- Caching opportunities
- Memory usage
- Response times
```

## Automation Examples

### Batch Processing
```bash
# Update all test files
find . -name "*.test.js" -exec claude -p "modernize {}" \;

# Analyze multiple files
ls src/*.js | xargs -I {} claude -p "check {} for memory leaks"
```

### Git Integration
```bash
# Pre-commit hook
claude -p "review staged changes for issues" && git commit

# Conflict resolution
claude "resolve merge conflicts in feature branch"
```

### CI/CD Pipeline
```yaml
# .github/workflows/claude-review.yml
- name: Claude Code Review
  run: |
    claude -p "review changes in ${{ github.event.pull_request.head.sha }}"
```

## Configuration Templates

### Project Settings (`.claude/settings.json`)
```json
{
  "model": "claude-3-5-sonnet-20241022",
  "maxTurns": 30,
  "allowedTools": ["bash", "read", "write", "edit", "grep"],
  "customInstructions": "Follow our style guide at docs/style.md"
}
```

### Memory File (`.claude/CLAUDE.md`)
```markdown
## Project Overview
This is a Node.js microservices application using:
- Express.js for APIs
- PostgreSQL for data
- Jest for testing
- Docker for deployment

## Coding Standards
- Use TypeScript
- Follow ESLint rules
- Write tests for all new code
- Document public APIs

## Important Files
- `src/config/` - Configuration
- `src/services/` - Business logic
- `src/routes/` - API endpoints
- `tests/` - Test files
```

## Keyboard Shortcuts (Vim Mode)

| Key | Action |
|-----|--------|
| `i` | Insert mode |
| `ESC` | Normal mode |
| `:w` | Save |
| `:q` | Quit |
| `dd` | Delete line |
| `yy` | Copy line |
| `p` | Paste |
| `/` | Search |

## Tips & Tricks

1. **Context Management**
   - Use `/clear` between unrelated tasks
   - Keep CLAUDE.md files updated
   - Use `/compact` for long conversations

2. **Performance**
   - Batch related requests together
   - Use specific file paths when possible
   - Leverage custom commands for repetition

3. **Debugging**
   - Use `--verbose` for troubleshooting
   - Check `/doctor` for system health
   - Review permissions with `/permissions`

4. **Collaboration**
   - Share `.claude/commands/` in version control
   - Document custom commands
   - Use consistent naming conventions

---

*Quick reference for [claude-commands](https://github.com/hikarubw/claude-commands) project*