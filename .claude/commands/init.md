# Project Initialization Command

Initialize a production-ready project with all necessary tooling, structure, and automation.

## Command Purpose
Set up a new project or enhance an existing one with industry best practices, appropriate for the detected or specified programming language.

## Actions to Perform

### 1. Project Analysis
- **Detect existing project** or create new one
- **Identify programming language** from files or ask user
- **Determine project type** (web app, API, library, CLI tool)
- **Check for existing configuration** to avoid overwriting

### 2. Interactive Setup
Gather information through prompts:
- Project name and description
- Target programming language (if not detected)
- Project type and purpose
- License preference (MIT, Apache 2.0, GPL, etc.)
- Repository settings (public/private)
- CI/CD platform preference

### 3. Create Project Structure
Based on language and project type, create:
- **Source code directories** following language conventions
- **Test directories** with example test
- **Documentation structure** 
- **Configuration directories**
- **Asset/resource directories** if applicable

### 4. Git Repository Setup
- **Initialize git** if not already initialized
- **Create comprehensive .gitignore** based on language and tools
- **Set up .gitattributes** for line endings
- **Create initial commit structure**
- **Configure git hooks** for quality checks

### 5. Development Tool Configuration
Install and configure based on language:
- **Package manager** setup and initialization
- **Linting tools** with sensible defaults
- **Code formatter** configuration
- **Testing framework** with example test
- **Build tools** if applicable
- **Type checking** for typed languages

### 6. CI/CD Pipeline Creation
Create appropriate CI configuration:
- **Choose platform** (GitHub Actions, GitLab CI, etc.)
- **Set up test pipeline** that runs on push/PR
- **Add linting and formatting checks**
- **Configure build verification**
- **Add security scanning**
- **Set up deployment workflows** if applicable

### 7. Documentation Generation
Create essential documentation:
- **README.md** with project overview, setup instructions, usage
- **CONTRIBUTING.md** with development guidelines
- **LICENSE** file based on selection
- **CHANGELOG.md** for version tracking
- **API documentation** structure if applicable

### 8. Development Scripts
Create unified commands regardless of language:
- Script to run tests
- Script to lint code
- Script to format code  
- Script to build project
- Script to run in development mode
- Script for common tasks

### 9. Code Quality Setup
- **Pre-commit hooks** to run checks before commit
- **Pre-push hooks** to ensure tests pass
- **Editor configuration** (.editorconfig)
- **Code style configuration**

### 10. Final Steps
- **Run initial build** to verify setup
- **Execute tests** to ensure framework works
- **Create example code** if starting fresh
- **Generate setup report** with next steps
- **Update CLAUDE.md** with project information

## Approach Guidelines

- **Respect existing configuration** - don't overwrite without asking
- **Use language idioms** - follow community standards for each language
- **Keep it simple** - don't over-engineer the initial setup
- **Focus on productivity** - enable fast development cycles
- **Ensure reproducibility** - anyone should be able to clone and run
- **Add helpful comments** in configuration files

## Success Criteria

After running this command:
1. Developer can immediately start coding
2. All quality tools work out of the box
3. Tests can be written and run easily
4. Code style is enforced automatically
5. CI/CD runs on every push
6. Documentation is clear and complete

## Output Format

Provide a summary showing:
- What was created/configured
- How to use the development commands
- What the CI/CD pipeline does
- Next steps for development
- Any manual steps required