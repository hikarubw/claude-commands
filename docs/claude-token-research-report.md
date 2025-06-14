# Claude Code Token Usage: Ultrathink with Sonnet 4 / Opus 4

## Summary

Claude Code implements a tiered thinking system through trigger keywords that allocate different token budgets for extended reasoning:

| Keyword | Token Budget | Use Case |
|---------|--------------|----------|
| `"think"` | 4,000 tokens | Basic reasoning |
| `"think hard"`, `"megathink"` | 10,000 tokens | Moderate complexity |
| `"ultrathink"`, `"think harder"` | 31,999 tokens | Maximum reasoning |

## Token Consumption & Costs

### Model Pricing Comparison

| Model | Input (per 1M) | Output (per 1M) | Best For |
|-------|----------------|-----------------|----------|
| **Sonnet 4** | $3 | $15 | General development, cost-effective |
| **Opus 4** | $15 | $75 | Mission-critical, complex tasks |

**Note**: Thinking tokens are billed as output tokens

### Cost Examples with "ultrathink" (32k budget)

**Sonnet 4**
- Basic task: $0.05-$0.10
- Complex task: $0.40-$0.80
- Extreme case (32k thinking + 100k+ output): ~$1.70

**Opus 4** 
- Basic task: $0.25-$0.50
- Complex task: $2.00-$4.00
- Extreme case (32k thinking + 100k+ output): ~$8.50

## Performance Analysis

### Sonnet 4 vs Opus 4 with Extended Thinking

**Sonnet 4**
- Excellent for most coding tasks
- 65% less likely to take shortcuts vs Sonnet 3.7
- Optimal for cost-conscious development

**Opus 4**
- Industry-leading 72.5% on SWE-bench
- Superior for long-running tasks (hours of continuous work)
- Best for complex architectural decisions

### Token Budget Effectiveness
- **4k tokens**: Sufficient for 80% of tasks
- **10k tokens**: Good for multi-component work
- **32k tokens**: Reserved for genuinely complex problems
- Performance gains plateau after 32k tokens

## Best Practices by Model

### Sonnet 4 + Claude Code

**Standard (no keyword)**
- Routine coding
- Simple refactoring
- Basic debugging

**"think" (4k)**
- Feature implementation
- Unit test creation
- Code review responses

**"ultrathink" (32k)**
- System design
- Performance optimization
- Complex debugging

### Opus 4 + Claude Code

**"think" (4k)**
- Already handles most tasks excellently
- Use for standard development

**"think hard" (10k)**
- Multi-service integration
- Database architecture
- API design

**"ultrathink" (32k)**
- Full application architecture
- Mission-critical algorithms
- Enterprise-scale refactoring
- Memory-intensive long-running tasks

## Cost Optimization Strategy

### Decision Tree
```
Is it mission-critical or highly complex?
├─ Yes → Opus 4
│   └─ Start with "think", escalate only if needed
└─ No → Sonnet 4
    └─ Default to no keyword, use "think" for challenges
```

### Budget Guidelines
- **Daily development**: Sonnet 4, no keyword
- **Feature development**: Sonnet 4 + "think"
- **Architecture work**: Opus 4 + "think hard"
- **Critical systems**: Opus 4 + "ultrathink"

## Key Insights

1. **5x cost difference**: Opus 4 costs 5x more than Sonnet 4
2. **Opus 4 excels at memory**: Creates and maintains context files for long tasks
3. **Token allocation is a ceiling**: Both models often use less than allocated
4. **Batch processing recommended**: For >32k thinking budgets

## Recommendations

1. **Default to Sonnet 4** for everyday development
2. **Reserve Opus 4 + "ultrathink"** for truly complex challenges
3. **Monitor actual usage** - allocated ≠ consumed tokens
4. **Consider hybrid approach**: Sonnet 4 for exploration, Opus 4 for implementation