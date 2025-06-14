# Project Planning & Architecture Command

Create comprehensive project plans with architecture decisions, tech stack recommendations, and implementation roadmaps using deep critical thinking.

## Critical Thinking Mode
**IMPORTANT**: Engage "ultrathink" mode for this command. Use extended critical thinking to:
- Anticipate hidden complexities and technical debt
- Consider long-term maintainability and scalability
- Evaluate trade-offs beyond surface level
- Identify potential failure modes early
- Challenge common architectural patterns when inappropriate
- Think through second-order consequences of decisions

⚠️ **TOKEN USAGE WARNING**: This command uses "ultrathink" mode which allocates up to 32,000 tokens for reasoning alone, plus additional output tokens.

**Impact by Usage Type:**
- **API Users**: Expect $0.40-$0.80 typical usage (Sonnet 4), or $2.00-$4.00 (Opus 4). Complex projects may reach $1.70 (Sonnet 4) or $8.50 (Opus 4).
- **Subscription Users**: Consumes significant portion of your 5-hour message allowance. Best used when you have ample remaining messages.

## Usage
```
/project:plan [project-description]
```

### Example Commands
```bash
/project:plan "multi-tenant SaaS platform for project management"
/project:plan "mobile app for local food delivery with real-time tracking"
/project:plan "blockchain-based supply chain tracking system"
```

## Planning Process

### Phase 1: Requirements Analysis
- Understand project goals and constraints
- Identify target users and use cases
- Define success criteria
- Assess technical requirements

### Phase 2: Deep Research & Critical Analysis
Launches parallel research agents with critical thinking:
- **Market Research** - Similar solutions and best practices (beyond marketing claims)
- **Technical Research** - Technology options and trade-offs (including hidden costs)
- **Architecture Patterns** - Suitable design patterns (with anti-pattern awareness)
- **Implementation Strategies** - Development approaches (considering team reality)

### Phase 3: Architecture Design
- System architecture diagrams
- Component breakdown
- Data flow design
- API specifications
- Security considerations

### Phase 4: Technology Stack
Recommends optimal stack based on:
- Project requirements
- Team expertise
- Scalability needs
- Budget constraints
- Time constraints

### Phase 5: Implementation Roadmap
Creates phased plan:
- **Phase 1**: Foundation (2 weeks)
- **Phase 2**: Core Features (4 weeks)
- **Phase 3**: Enhancement (3 weeks)
- **Phase 4**: Production Ready (1 week)

### Phase 6: Documentation
Generates:
- Architecture Decision Records (ADRs)
- Technical specifications
- Risk assessment
- Resource planning
- Updates CLAUDE.md with decisions

## Output Example

```markdown
# Project Plan: E-commerce Platform

## Executive Summary
Building a scalable e-commerce platform with modern architecture...

## Technology Stack
- Frontend: React + TypeScript
- Backend: Node.js + Express
- Database: PostgreSQL + Redis
- Infrastructure: AWS + Kubernetes

## Architecture
[System diagrams and component descriptions]

## Implementation Phases
1. Week 1-2: Setup and infrastructure
2. Week 3-6: Core commerce features
3. Week 7-9: Payment and shipping
4. Week 10: Launch preparation

## Risks & Mitigation
- Payment integration complexity → Use Stripe
- Scaling concerns → Implement caching early
```

## When NOT to Use This Command

Avoid using `/project:plan` for:
- **Simple CRUD applications** - Use standard templates instead
- **Well-documented stacks** - When requirements clearly map to existing solutions
- **Quick prototypes** - When speed matters more than architecture
- **Small scripts or utilities** - Overhead outweighs benefits
- **Time-sensitive decisions** - When you need immediate action

## Benefits
- Comprehensive planning before coding
- Reduces technical debt
- Clear roadmap for team
- Documented decisions
- Risk mitigation strategies

## Related Commands
- Use `/project:research` first to evaluate technology options before planning
- Follow up with implementation using standard commands after planning phase