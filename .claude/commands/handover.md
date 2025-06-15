# Session Handover Command

Prepare to end the current session by organizing work, documenting progress, and ensuring smooth continuation in the next session.

## Command Purpose
Create a comprehensive handover package that allows the next session (with you or another developer) to quickly understand and continue the work.

## Actions to Perform

### 1. Analyze Current Session Work
- **Review all modified files** using git status and git diff
- **Identify work in progress** that isn't committed
- **List open tasks** from todo lists or comments
- **Note any blocking issues** or decisions needed

### 2. Organize Uncommitted Changes
- **Stage related changes** into logical commits
- **Create meaningful commits** with clear messages
- **Stash experimental changes** that aren't ready
- **Clean up debug code** and temporary files

### 3. Update Project Documentation
**IMPORTANT**: You MUST create or update these documentation files using the Write/Edit tools:

- **Update or create `CLAUDE.md`** in the project root (not .claude/) with:
  - Current project state
  - Recent architectural decisions
  - Important context discovered
  - Dependencies or setup changes
  - Known issues or limitations
  - Session date and highlights
  - Key decisions made during this session
  - Unresolved issues
  - Next session priorities
  
  Note: This file is automatically loaded by Claude Code at the start of each session
  
- **Update README.md** if needed with:
  - New features added
  - Changed setup instructions
  - Updated usage examples

### 4. Create Session Summary
**CRITICAL**: You MUST create a file named `SESSION_SUMMARY.md` in the project root directory using the Write tool.

Create SESSION_SUMMARY.md with the following content:

```markdown
# Session Summary - [DATE]

## Work Completed
- Brief list of accomplished tasks
- Files modified with purpose
- Problems solved

## Work in Progress
- Current task being worked on
- Why it's not complete
- Next steps to finish

## Decisions Made
- Architectural choices
- Trade-offs accepted
- Technologies selected

## Blockers & Issues
- Problems encountered
- What was tried
- Suggested solutions

## Next Session Priority
1. Highest priority task
2. Second priority
3. Third priority

## Important Context
- Key findings
- Gotchas discovered
- Performance considerations
- Security notes

## Environment Notes
- New dependencies added
- Configuration changes
- Required tools/services
- Test data locations

## Quick Start for Next Session

1. Pull latest changes: `git pull`
2. Install dependencies: [command]
3. Run tests: [command]
4. Current focus file: [path]
5. Continue with: [specific task]

## Commands to Know
- Run dev: [command]
- Run tests: [command]
- Deploy: [command]
```

### 5. Code State Verification
- **Run all tests** to ensure nothing is broken
- **Check linting** to ensure code quality
- **Verify build** succeeds
- **Document any failing tests** with explanation

### 6. Create Session State File
**Optional but recommended**: Create a `.claude/session-state.json` file with:
- List of files that were being actively worked on
- Current directory context
- Any important file locations
- Relevant documentation links

### 7. Handle Sensitive Information
- **Remove any credentials** from code
- **Clear sensitive logs**
- **Document where to find** secure configurations
- **Note any API keys needed** (but not the keys themselves)

### 8. Final Checklist
Before ending session, verify:
- [ ] All valuable work is committed
- [ ] Tests are passing (or failures documented)
- [ ] Documentation is updated
- [ ] SESSION_SUMMARY.md is created
- [ ] CLAUDE.md is updated (in project root)
- [ ] No sensitive data in repository
- [ ] Clear next steps documented

## Output Format

After creating all necessary files, provide a final report:
```
Session Handover Complete ✅

📄 Files Created/Updated:
- SESSION_SUMMARY.md (created)
- CLAUDE.md (updated)
- README.md (if needed)

📝 Commits Created: [count]
- [commit message 1]
- [commit message 2]

⚠️ Important Notes:
- [Any warnings or special instructions]

🎯 Next Session Should Start With:
1. [Specific task or file]
2. [Command to run]

Time Saved for Next Session: ~[estimate] minutes
```

## CRITICAL REMINDERS
1. **YOU MUST CREATE SESSION_SUMMARY.md** - Use the Write tool to create this file
2. **YOU MUST UPDATE CLAUDE.md** - Use Write/Edit tool to update or create this file in the project root
3. **DO NOT just describe what should be in the files** - Actually create them
4. **The handover is NOT complete** until both files exist with real content

## Special Considerations

### For Long-Running Tasks
If a complex task spans sessions:
- Document the overall goal
- Break down completed vs remaining subtasks
- Note any design decisions made
- Include relevant research/findings

### For Debugging Sessions
If session involved debugging:
- Document the original error
- List what was tried
- Note what worked/didn't work
- Include any workarounds

### For Feature Development
If building a new feature:
- Document the requirements
- Show implementation progress
- Note any API changes
- List remaining integration work

## Best Practices
- Keep summaries concise but complete
- Focus on "why" not just "what"
- Include enough context for someone unfamiliar
- Highlight any non-obvious decisions
- Make next steps crystal clear
- ALWAYS create the actual files, don't just plan to create them