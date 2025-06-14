# Claude Commands Help

Essential commands that provide significant value beyond Claude's normal capabilities.

## 🚀 Available Commands

- `/project:init` - Initialize a new project with comprehensive setup including CI/CD, testing, documentation, and best practices for any language

- `/project:check` - Run comprehensive quality checks in parallel (linting, tests, build, security, dependencies) with actionable insights

- `/project:plan` - Create detailed project plans using critical thinking ("ultrathink") mode with multi-agent research, architecture decisions, and implementation roadmaps ⚠️ **High token usage**

- `/project:push` - Smart git workflow with intelligent commit messages, pre-push validation, and CI/CD monitoring

- `/project:handover` - Prepare complete session handover documentation for seamless continuation

- `/project:research` - Deep multi-agent research using critical thinking ("ultrathink") mode for comprehensive technical analysis ⚠️ **High token usage**

Note: Replace `/project:` with `/user:` if you installed commands globally in `~/.claude/commands/`

## Quick Examples

```bash
# Start a new project with best practices
/project:init

# Check code quality before pushing
/project:check

# Create a project plan
/project:plan "Build a real-time chat application"

# Commit and push with CI monitoring  
/project:push

# Research a technical topic
/project:research "Comparing WebSocket vs Server-Sent Events"

# Before ending your session
/project:handover
```

## Why These Commands?

Each command provides functionality that significantly enhances what Claude normally does:
- **init**: Opinionated, comprehensive project setup
- **check**: Parallel execution and holistic analysis
- **plan**: Multi-agent research and architecture documentation
- **push**: Intelligent workflow automation
- **handover**: Session continuity
- **research**: Deep, structured analysis

For simple tasks like "run tests" or "build project", just ask Claude directly - no special command needed!