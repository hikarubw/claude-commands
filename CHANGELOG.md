# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-06-14

### Changed
- **BREAKING**: Aggressively reduced commands from 18 to 6 essential ones
- **BREAKING**: Simplified command structure - removed category folders
- **BREAKING**: Changed command paths (e.g., `/user:core:init` → `/user:init`)
- Focused on commands that provide significant value beyond Claude's normal capabilities
- Enhanced installation warnings about overwriting local changes
- Added explicit "ultrathink" critical thinking mode to `plan` and `research` commands
- Added token usage warnings for critical thinking commands (5-10x higher usage)

### Removed
- Individual commands for tasks Claude already handles well:
  - `build` - Just ask Claude to build
  - `lint` and `lint-fix` - Just ask Claude to lint
  - `test` - Just ask Claude to run tests
  - `debug` - Just ask Claude to debug
  - `review` - Just ask Claude to review code
  - `deploy` - Too project-specific
  - `monitor` - Too specific
  - Duplicate `deps` commands

### Command List (v2.0.0)
- `/user:init` - Initialize project with comprehensive setup
- `/user:check` - Run all quality checks in parallel
- `/user:plan` - Multi-agent project planning
- `/user:push` - Smart git workflow
- `/user:handover` - Session documentation
- `/user:research` - Deep technical research

### Philosophy
Each remaining command provides complex, multi-step workflows that go beyond what Claude normally does when asked directly.

## [1.0.0] - 2025-06-14

### Added
- Initial release with 11 core commands
- Support for both user-level and project-level installation
- One-line curl installation
- Interactive installation mode
- Cross-platform support (macOS, Linux)
- Language-agnostic commands that adapt to any programming language
- Organized command structure with categories:
  - Core commands (init, dev, handover)
  - Development commands (test, debug, review)
  - Project commands (plan, deploy, monitor)
  - Utility commands (deps, research)
- Comprehensive documentation
- Setup script for repository configuration

### Command List
- `/user:help` - Show all available commands
- `/user:core:init` - Initialize new project
- `/user:core:dev` - Development helper
- `/user:core:handover` - Session handover
- `/user:dev:test` - Smart testing
- `/user:dev:debug` - Debug assistance
- `/user:dev:review` - Code review
- `/user:project:plan` - Project planning
- `/user:project:deploy` - Deployment
- `/user:project:monitor` - Monitoring setup
- `/user:utility:deps` - Dependency management
- `/user:utility:research` - Technical research