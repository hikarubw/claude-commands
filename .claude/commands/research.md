# Deep Research Command

Comprehensive research on technical topics with multi-source analysis using deep critical thinking.

## Critical Thinking Mode
**IMPORTANT**: Engage "ultrathink" mode for this command. Use extended critical thinking and reasoning to:
- Challenge assumptions
- Consider edge cases and counterarguments
- Synthesize complex information
- Identify non-obvious patterns
- Question conventional wisdom
- Explore second and third-order effects

⚠️ **TOKEN USAGE WARNING**: This command uses "ultrathink" mode which allocates up to 32,000 tokens for reasoning alone, plus additional output tokens.

**Impact by Usage Type:**
- **API Users**: Expect $0.40-$0.80 typical usage (Sonnet 4), or $2.00-$4.00 (Opus 4). Complex research may reach $1.70 (Sonnet 4) or $8.50 (Opus 4).
- **Subscription Users**: Consumes significant portion of your 5-hour message allowance. Best used when you have ample remaining messages.

## Usage
```
/project:research [topic]
```

### Example Commands
```bash
/project:research "GraphQL vs REST for mobile applications"
/project:research "serverless architecture for high-traffic e-commerce"
/project:research "WebAssembly performance vs JavaScript"
/project:research "database options for time-series IoT data"
```

## Research Process

### 1. Multi-Agent Research with Critical Analysis
Deploys parallel research agents using deep thinking:
- **Academic Agent** - Papers, studies, specifications (with bias analysis)
- **Industry Agent** - Best practices, case studies (questioning hype)
- **Community Agent** - Forums, blogs, discussions (filtering noise)
- **Technical Agent** - Implementation details, benchmarks (validating claims)
- **Comparison Agent** - Alternative solutions (uncovering hidden trade-offs)

### 2. Information Synthesis
- Cross-references findings
- Validates with multiple sources
- Identifies patterns
- Highlights contradictions
- Extracts consensus

### 3. Structured Output
- Executive summary
- Detailed analysis
- Comparison matrices
- Visual diagrams
- Implementation guide
- Decision framework

## Research Topics

### Technology Evaluation
```bash
/project:research "React vs Vue for enterprise"
```
Analyzes:
- Performance benchmarks
- Ecosystem maturity
- Learning curve
- Community support
- Enterprise adoption

### Architecture Patterns
```bash
/project:research "microservices vs monolith"
```
Covers:
- Use case analysis
- Trade-offs
- Migration strategies
- Tool ecosystem
- Real-world examples

### Best Practices
```bash
/project:research "API security best practices"
```
Researches:
- Industry standards
- Common vulnerabilities
- Protection strategies
- Tool recommendations
- Compliance requirements

## Output Example

```markdown
# Research: GraphQL vs REST APIs

## Executive Summary
- GraphQL excels for complex, nested data
- REST better for simple CRUD operations
- Consider GraphQL for mobile apps
- REST remains standard for public APIs

## Detailed Analysis
[Comprehensive comparison]

## Decision Matrix
| Factor | GraphQL | REST |
|--------|---------|------|
| Learning Curve | Higher | Lower |
| Flexibility | High | Medium |
| Caching | Complex | Simple |
| Tools | Growing | Mature |

## Recommendations
1. Use GraphQL when...
2. Stick with REST when...
3. Hybrid approach for...

## Implementation Guide
[Step-by-step instructions]
```

## Research Archive

All research is saved to:
```
.claude/research/
├── topic-name-date.md
├── sources.md
├── raw-notes.md
└── decision-log.md
```

Updates CLAUDE.md with key findings for future reference.

## When NOT to Use This Command

Avoid using `/project:research` for:
- **Well-known comparisons** - When abundant documentation exists (e.g., "React vs Angular basics")
- **Quick lookups** - For simple facts or definitions
- **Vendor-specific features** - When official docs suffice
- **Time-sensitive decisions** - When you need immediate answers
- **Personal preferences** - When the choice is subjective

## Related Commands
- Use research results to inform `/project:plan` for architecture decisions
- For quick technical questions, use standard queries without deep research