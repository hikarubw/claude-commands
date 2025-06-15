# Comprehensive Quality Check

Run all quality checks to ensure code health, including linting, testing, building, and dependency auditing.

## Command Purpose
Provide a one-stop quality check that goes beyond what Claude normally does by running multiple checks in parallel and providing actionable insights.

## Actions to Perform

1. **Parallel Quality Checks**
   - Run linting with auto-fix for style issues
   - Execute full test suite with coverage
   - Verify build succeeds
   - Audit dependencies for vulnerabilities
   - Check for common security issues
   - Analyze code complexity metrics

2. **Smart Analysis**
   - Prioritize issues by severity
   - Group related problems
   - Suggest specific fixes
   - Estimate effort to resolve

3. **Actionable Report**
   - Show only what needs attention
   - Provide copy-paste commands to fix issues
   - Track quality trends if possible

## Why This Command Exists
While Claude can run individual checks, this command:
- Runs everything in parallel for speed
- Provides a holistic view of code health
- Suggests prioritized actions
- Saves time by batching all checks

## Expected Behavior
- Exit with non-zero code if critical issues found
- Show progress for long-running checks
- Cache results when appropriate
- Focus on actionable items, not just data