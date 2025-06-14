# Custom Commands Collection for Claude Code

This collection provides ready-to-use custom commands for common development tasks. Copy these to your `.claude/commands/` or `~/.claude/commands/` directory.

## Setup Instructions

```bash
# For project-specific commands
mkdir -p .claude/commands

# For user-level commands (available in all projects)
mkdir -p ~/.claude/commands

# Copy a command (example)
cp examples/commands/optimize.md .claude/commands/
```

## Development Commands

### 1. Code Quality

**optimize.md** - Performance optimization
```markdown
Analyze and optimize the performance of: $ARGUMENTS

Focus on:
1. Time complexity improvements
2. Memory usage reduction
3. Database query optimization
4. Caching opportunities
5. Async operation improvements

Provide specific before/after comparisons and benchmarks where applicable.
```

**security-audit.md** - Security analysis
```markdown
Perform a security audit on: $ARGUMENTS

Check for:
- SQL injection vulnerabilities
- XSS possibilities
- Authentication/authorization issues
- Sensitive data exposure
- Dependency vulnerabilities
- Input validation gaps

Provide severity ratings and specific remediation steps.
```

**refactor-clean.md** - Clean code refactoring
```markdown
Refactor this code following clean code principles: $ARGUMENTS

Apply:
- SOLID principles
- DRY (Don't Repeat Yourself)
- Meaningful naming
- Small, focused functions
- Proper abstraction levels
- Remove code smells

Maintain all existing functionality while improving code quality.
```

### 2. Testing Commands

**test-full.md** - Comprehensive test generation
```markdown
Generate comprehensive tests for: $ARGUMENTS

Include:
- Unit tests for all public methods
- Integration tests for API endpoints
- Edge cases and error scenarios
- Performance tests where applicable
- Mock all external dependencies
- Achieve minimum 80% code coverage

Use the project's existing test framework and patterns.
```

**test-fix.md** - Fix failing tests
```markdown
Fix all failing tests in: $ARGUMENTS

Steps:
1. Run the tests and identify failures
2. Understand the expected behavior
3. Fix implementation or update tests as appropriate
4. Ensure no regression in other tests
5. Add any missing test cases discovered

Explain each fix and why it was necessary.
```

### 3. Documentation Commands

**doc-api.md** - API documentation
```markdown
Generate comprehensive API documentation for: $ARGUMENTS

Include:
- Endpoint descriptions
- Request/response formats
- Authentication requirements
- Error codes and messages
- Usage examples
- Rate limiting info

Use OpenAPI/Swagger format if applicable.
```

**doc-readme.md** - README generator
```markdown
Create or update README documentation for: $ARGUMENTS

Sections to include:
- Project overview
- Features
- Installation instructions
- Usage examples
- API reference (if applicable)
- Configuration options
- Contributing guidelines
- License information

Keep it concise but comprehensive.
```

### 4. Git/GitHub Commands

**pr-prep.md** - Prepare pull request
```markdown
Prepare code for pull request: $ARGUMENTS

Tasks:
1. Run linters and fix issues
2. Ensure all tests pass
3. Remove debug code and console logs
4. Update relevant documentation
5. Write clear commit messages
6. Create PR description with:
   - Summary of changes
   - Testing performed
   - Breaking changes (if any)
```

**changelog.md** - Generate changelog
```markdown
Generate a changelog entry for: $ARGUMENTS

Format:
## [Version] - Date

### Added
- New features

### Changed
- Updates to existing functionality

### Fixed
- Bug fixes

### Security
- Security updates

Base on git history and code changes.
```

### 5. Architecture Commands

**pattern-apply.md** - Apply design pattern
```markdown
Apply the appropriate design pattern to: $ARGUMENTS

Consider:
- Current code structure
- Future extensibility needs
- Common patterns (Factory, Observer, Strategy, etc.)
- Project conventions

Refactor the code to implement the pattern while maintaining backward compatibility.
```

**arch-review.md** - Architecture review
```markdown
Review the architecture of: $ARGUMENTS

Analyze:
- Component dependencies
- Coupling and cohesion
- Scalability concerns
- Performance bottlenecks
- Security considerations
- Maintainability

Provide specific recommendations with implementation priority.
```

### 6. Debugging Commands

**debug-trace.md** - Add debug tracing
```markdown
Add comprehensive debug tracing to: $ARGUMENTS

Include:
- Entry/exit logging for methods
- Parameter values
- Important state changes
- Error conditions with stack traces
- Performance timing

Use the project's logging framework and follow existing patterns.
```

**debug-memory.md** - Debug memory issues
```markdown
Analyze and fix memory issues in: $ARGUMENTS

Check for:
- Memory leaks
- Unnecessary object retention
- Large object allocations
- Circular references
- Cache size issues

Provide memory usage before/after metrics.
```

### 7. Database Commands

**db-optimize.md** - Optimize database queries
```markdown
Optimize database operations in: $ARGUMENTS

Focus on:
- Query performance (explain plans)
- Index usage
- N+1 query problems
- Connection pooling
- Transaction scope
- Caching opportunities

Provide query execution time comparisons.
```

**migration-gen.md** - Generate migration
```markdown
Generate a database migration for: $ARGUMENTS

Include:
- Up migration
- Down migration
- Data migration if needed
- Validation of migrated data
- Performance considerations for large tables

Follow project's migration naming conventions.
```

### 8. Framework-Specific Commands

**react-component.md** - React component generator
```markdown
Create a React component for: $ARGUMENTS

Include:
- Functional component with hooks
- TypeScript interfaces
- Proper prop validation
- Unit tests
- Storybook story (if used)
- Accessibility considerations

Follow project's component patterns.
```

**api-rest.md** - REST endpoint generator
```markdown
Create a REST API endpoint for: $ARGUMENTS

Include:
- Route definition
- Controller method
- Input validation middleware
- Business logic service
- Database operations
- Error handling
- Unit and integration tests
- API documentation

Follow RESTful conventions and project patterns.
```

## Advanced Command Templates

### Composite Commands

**feature-complete.md** - Full feature implementation
```markdown
Implement a complete feature for: $ARGUMENTS

Steps:
1. Analyze requirements
2. Design data model
3. Create API endpoints
4. Implement business logic
5. Build UI components
6. Write comprehensive tests
7. Update documentation
8. Add monitoring/logging

Ensure all parts work together seamlessly.
```

**tech-debt.md** - Technical debt reduction
```markdown
Address technical debt in: $ARGUMENTS

Tasks:
1. Identify code smells
2. Update deprecated dependencies
3. Refactor complex methods
4. Improve test coverage
5. Update documentation
6. Remove dead code
7. Standardize patterns

Prioritize by impact and effort.
```

## Usage Tips

1. **Customize for Your Project**
   - Modify commands to match your tech stack
   - Add project-specific conventions
   - Include team standards

2. **Organize Commands**
   ```bash
   .claude/commands/
   ├── testing/
   │   ├── unit.md
   │   └── integration.md
   ├── docs/
   │   ├── api.md
   │   └── readme.md
   └── debug/
       ├── trace.md
       └── profile.md
   ```

3. **Version Control**
   - Commit `.claude/commands/` to your repo
   - Document custom commands in README
   - Share with team members

4. **Command Naming**
   - Use descriptive, action-oriented names
   - Keep names short but clear
   - Use consistent naming patterns

---

*Part of the [claude-commands](https://github.com/hikarubw/claude-commands) collection*