# Smart Git Push Workflow

Intelligently analyze changes, create meaningful commits, and push with CI/CD monitoring.

## Command Purpose
Automate the git workflow with smart commit messages and CI/CD awareness - going beyond simple git commands.

## Actions to Perform

1. **Pre-flight Checks**
   - Run quick quality checks (not full suite)
   - Scan for secrets or sensitive data
   - Check for debug code left behind

2. **Smart Commit Creation**
   - Analyze changes to generate meaningful commit message
   - Follow conventional commit format
   - Group related changes intelligently
   - Include issue references if found

3. **Push with Intelligence**
   - Push to correct remote/branch
   - Monitor CI/CD pipeline status
   - Report back on build results
   - Suggest fixes if pipeline fails

## Why This Command Exists
While Claude can commit and push, this command:
- Generates better commit messages by analyzing changes
- Prevents common mistakes (secrets, debug code)
- Monitors CI/CD results
- Provides a complete workflow in one command