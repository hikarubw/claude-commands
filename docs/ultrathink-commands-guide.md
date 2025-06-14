# Ultrathink Commands User Guide

This guide contains important information about using the high-token-consumption commands `/project:plan` and `/project:research`.

## Token Usage Warning

⚠️ **IMPORTANT**: These commands use "ultrathink" mode which allocates up to 32,000 tokens for reasoning alone, plus additional output tokens.

### Impact by Usage Type

**API Users**:
- Expect $0.40-$0.80 typical usage (Sonnet 4)
- Expect $2.00-$4.00 typical usage (Opus 4)
- Complex projects may reach $1.70 (Sonnet 4) or $8.50 (Opus 4)

**Subscription Users**:
- Consumes significant portion of your 5-hour message allowance
- Best used when you have ample remaining messages

## Command: /project:plan

### Usage
```
/project:plan [project-description]
```

### Example Commands
```bash
/project:plan "multi-tenant SaaS platform for project management"
/project:plan "mobile app for local food delivery with real-time tracking"
/project:plan "blockchain-based supply chain tracking system"
```

### When NOT to Use This Command

Avoid using `/project:plan` for:
- **Simple CRUD applications** - Use standard templates instead
- **Well-documented stacks** - When requirements clearly map to existing solutions
- **Quick prototypes** - When speed matters more than architecture
- **Small scripts or utilities** - Overhead outweighs benefits
- **Time-sensitive decisions** - When you need immediate action

### Output Example

```markdown
# Project Plan: E-commerce Platform

## Executive Summary
Building a scalable e-commerce platform with modern architecture, focusing on performance, scalability, and user experience.

## Technology Stack
- Frontend: React + TypeScript
- Backend: Node.js + Express
- Database: PostgreSQL + Redis
- Infrastructure: AWS + Kubernetes

## Architecture
- Microservices architecture with API Gateway
- React frontend with Redux state management
- Node.js services for cart, catalog, and orders
- PostgreSQL for transactional data, Redis for sessions
- Message queue for order processing
- CDN for static assets

## Implementation Phases
1. Week 1-2: Setup and infrastructure
2. Week 3-6: Core commerce features
3. Week 7-9: Payment and shipping
4. Week 10: Launch preparation

## Risks & Mitigation
- Payment integration complexity → Use Stripe
- Scaling concerns → Implement caching early
```

## Command: /project:research

### Usage
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

### When NOT to Use This Command

Avoid using `/project:research` for:
- **Well-known comparisons** - When abundant documentation exists (e.g., "React vs Angular basics")
- **Quick lookups** - For simple facts or definitions
- **Vendor-specific features** - When official docs suffice
- **Time-sensitive decisions** - When you need immediate answers
- **Personal preferences** - When the choice is subjective

### Research Topics Examples

#### Technology Evaluation
```bash
/project:research "React vs Vue for enterprise"
```
Analyzes:
- Performance benchmarks
- Ecosystem maturity
- Learning curve
- Community support
- Enterprise adoption

#### Architecture Patterns
```bash
/project:research "microservices vs monolith"
```
Covers:
- Use case analysis
- Trade-offs
- Migration strategies
- Tool ecosystem
- Real-world examples

#### Best Practices
```bash
/project:research "API security best practices"
```
Researches:
- Industry standards
- Common vulnerabilities
- Protection strategies
- Tool recommendations
- Compliance requirements

### Output Example

```markdown
# Research: GraphQL vs REST APIs

## Executive Summary
- GraphQL excels for complex, nested data
- REST better for simple CRUD operations
- Consider GraphQL for mobile apps
- REST remains standard for public APIs

## Detailed Analysis
GraphQL provides a flexible query language allowing clients to request exactly what they need, reducing over-fetching. REST follows established HTTP conventions with predictable URLs and standard methods. GraphQL shines with complex, nested data relationships while REST excels at simple resource-based operations.

## Decision Matrix
| Factor | GraphQL | REST |
|--------|---------|------|
| Learning Curve | Higher | Lower |
| Flexibility | High | Medium |
| Caching | Complex | Simple |
| Tools | Growing | Mature |

## Recommendations
1. Use GraphQL when building mobile apps with varying data needs or complex UIs with nested data
2. Stick with REST when building public APIs, simple CRUD services, or when caching is critical
3. Hybrid approach for large systems - REST for public APIs, GraphQL for internal client needs

## Implementation Guide
1. Evaluate your data complexity and client needs
2. Consider your team's expertise and timeline
3. Start with REST for MVP, migrate specific endpoints to GraphQL as needed
4. Use GraphQL for mobile BFF (Backend for Frontend) pattern
5. Maintain REST for public API stability
```

## Best Practices

### Cost Optimization Strategy

#### Decision Tree
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

## Related Commands

- Use `/project:research` first to evaluate technology options before `/project:plan`
- Follow up with implementation using standard commands after planning phase

## Notes

- Token allocation is a ceiling - models often use less than allocated
- Performance gains plateau after 32k tokens
- Consider hybrid approach: Sonnet 4 for exploration, Opus 4 for implementation