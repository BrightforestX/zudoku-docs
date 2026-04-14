# Documentation Site Purposes

## Overview

This repository manages 13 domain-specific documentation sites using the Zudoku framework. All sites
deploy the same Zudoku documentation content from the `docs/` directory, but are branded under
different domain names for various products, services, and target audiences.

## Repository Architecture

- **Monorepo Structure**: Uses pnpm + nx for workspace management
- **Deployment**: GitHub Actions + Cloudflare Pages
- **Content Source**: All domains serve content from `docs/` directory
- **Configuration**: Shared `docs/zudoku.config.tsx`
- **Branching Strategy**: Each domain has production and staging branches

## The 13 Documentation Sites

### 1. brightforest.io

**Domain**: https://brightforest.io

**Purpose**: Primary brand domain for BrightForest, likely the main product/service offering.

**Target Audience**: Developers and technical teams looking for API documentation tooling and
developer portal solutions.

**Content Scope**: Complete Zudoku framework documentation including:

- Quickstart guides and installation instructions
- Configuration options and customization
- API reference integration
- Plugin architecture
- Deployment guides
- Component library documentation

**Branch**: `brightforest-io` (production), `brightforest-io-staging` (staging)

---

### 2. brightforestx.com

**Domain**: https://brightforestx.com

**Purpose**: Extended/experimental version of BrightForest, possibly for advanced features or
enterprise offerings.

**Target Audience**: Enterprise clients or users interested in extended BrightForest capabilities.

**Content Scope**: Same Zudoku documentation as other domains, potentially positioned for:

- Advanced use cases
- Enterprise integrations
- Extended feature sets

**Branch**: `brightforestx-com` (production), `brightforestx-com-staging` (staging)

---

### 3. brightpath.ai

**Domain**: https://brightpath.ai

**Purpose**: AI-focused brand leveraging the BrightPath name, likely positioning documentation as an
AI-powered or AI-enhanced solution.

**Target Audience**: AI/ML developers and teams building AI products who need quality documentation.

**Content Scope**: Zudoku documentation with potential emphasis on:

- AI-powered search capabilities
- LLM integration features (llms.txt support)
- Modern developer experience for AI products

**Branch**: `brightpath-ai` (production), `brightpath-ai-staging` (staging)

**Note**: This domain appears to be the primary/default deployment target based on
`deploy-docs.yaml`.

---

### 4. pathx.ai

**Domain**: https://pathx.ai

**Purpose**: **Algorithm optimization** — benchmarking, hyperparameter tuning, profiling, and
experiment tracking for ML and data-heavy workloads. Documented consistently with the PathX.ai MCP
agent (`mcp://optimization.pathx.ai`) and `mcp-pathx-ai.json`.

**Target Audience**: ML engineers, data scientists, research engineers, and platform/performance
engineers.

**Content Scope**: Zudoku documentation emphasizing:

- Benchmark design, reproducibility, and regression detection
- Tuning workflows and multi-objective tradeoffs
- Performance profiling and integration with CI/CD and MCP

**Branch**: `pathx-ai` (production), `pathx-ai-staging` (staging)

---

### 5. figmatofullstack.com

**Domain**: https://figmatofullstack.com

**Purpose**: Design-to-development workflow product, focusing on the bridge between Figma designs
and full-stack implementation.

**Target Audience**: Full-stack developers, designers who code, and teams using design-first
development workflows.

**Content Scope**: Zudoku documentation positioned for:

- Design system documentation
- Component library documentation
- API documentation for design-to-code tools
- Full-stack development workflows

**Branch**: `figmatofullstack-com` (production), `figmatofullstack-com-staging` (staging)

---

### 6. figmatofullstack.ai

**Domain**: https://figmatofullstack.ai

**Purpose**: AI-enhanced version of Figma-to-Fullstack, potentially offering AI-powered
design-to-code capabilities.

**Target Audience**: Designers and developers using AI tools to accelerate the design-to-development
process.

**Content Scope**: Documentation covering:

- AI-assisted component generation
- Automated design system documentation
- Modern development workflows with AI

**Branch**: `figmatofullstack-ai` (production), `figmatofullstack-ai-staging` (staging)

---

### 7. mlninjas.com

**Domain**: https://mlninjas.com

**Purpose**: Machine Learning focused brand, targeting ML engineers and data scientists.

**Target Audience**: ML engineers, data scientists, and AI/ML teams needing to document ML models,
APIs, and workflows.

**Content Scope**: Zudoku documentation positioned for:

- ML model API documentation
- Data science workflow documentation
- ML/AI product technical documentation
- API references for ML services

**Branch**: `mlninjas-com` (production), `mlninjas-com-staging` (staging)

---

### 8. clifforddalsoniii.com

**Domain**: https://clifforddalsoniii.com

**Purpose**: Personal brand/portfolio site, likely for an individual developer, consultant, or
technical leader.

**Target Audience**: Potential clients, employers, collaborators, and the professional network of
Clifford Dalson III.

**Content Scope**: Documentation and resources covering:

- Personal projects and technical demonstrations
- Technical writing and tutorials
- Professional capabilities and expertise
- Open source contributions

**Branch**: `clifforddalsoniii-com` (production), `clifforddalsoniii-com-staging` (staging)

---

### 9. getdiyai.com

**Domain**: https://getdiyai.com

**Purpose**: DIY AI platform or tools, empowering individuals and small teams to build AI solutions
without extensive ML expertise.

**Target Audience**: Indie developers, startups, and small teams wanting to implement AI features
without dedicated ML teams.

**Content Scope**: Documentation for:

- Self-service AI tools and APIs
- No-code/low-code AI implementations
- DIY AI project guides and tutorials
- API documentation for AI services

**Branch**: `getdiyai-com` (production), `getdiyai-com-staging` (staging)

---

### 10. getdiyrpa.com

**Domain**: https://getdiyrpa.com

**Purpose**: DIY Robotic Process Automation (RPA) platform for automating business processes without
enterprise RPA solutions.

**Target Audience**: Small businesses, entrepreneurs, and technical users looking to automate
workflows.

**Content Scope**: Documentation covering:

- RPA tool APIs and integrations
- Automation workflow guides
- Process automation best practices
- Self-service automation platform

**Branch**: `getdiyrpa-com` (production), `getdiyrpa-com-staging` (staging)

---

### 11. appnowhq.com

**Domain**: https://appnowhq.com

**Purpose**: Rapid application development platform or service, focused on building apps quickly
("AppNow HQ").

**Target Audience**: Developers and teams needing to build and deploy applications rapidly.

**Content Scope**: Documentation for:

- Rapid app development tools and frameworks
- API documentation for development platform
- Quick-start templates and boilerplates
- Deployment and scaling guides

**Branch**: `appnowhq-com` (production), `appnowhq-com-staging` (staging)

---

### 12. brightforest.ai

**Domain**: https://brightforest.ai

**Purpose**: AI-branded variant of BrightForest, emphasizing AI capabilities and positioning.

**Target Audience**: AI-focused developers and companies building AI products.

**Content Scope**: Zudoku documentation with AI-first messaging:

- AI product documentation
- AI-enhanced developer portals
- LLM integration and support
- Modern AI development workflows

**Branch**: `brightforest-ai` (production), `brightforest-ai-staging` (staging)

---

### 13. iheartai.ai

**Domain**: https://iheartai.ai

**Purpose**: AI enthusiast/community brand with approachable, friendly positioning for AI tools and
documentation.

**Target Audience**: AI enthusiasts, learners, and developers passionate about AI technology.

**Content Scope**: Documentation positioned for:

- Accessible AI tools and APIs
- AI community resources
- Learning-focused AI documentation
- Modern AI development practices

**Branch**: `iheartai-ai` (production), `iheartai-ai-staging` (staging)

---

## Shared Infrastructure

### Content Management

All domains serve identical content from:

- **Source**: `docs/` directory in main repository
- **Configuration**: `docs/zudoku.config.tsx`
- **Pages**: `docs/pages/` directory containing MDX and Markdown files
- **Components**: `docs/src/` directory with React components

### Deployment Strategy

1. **Environment**: Cloudflare Pages
2. **CI/CD**: GitHub Actions workflows
3. **Workflow**: `.github/workflows/deploy-all-domains.yaml`
4. **Project Naming**: `zudoku-docs-{domain}` format

### Domain-Specific Customization

While all domains serve the same content, customization can be achieved through:

- **Environment Variable**: `ZUDOKU_PUBLIC_DOMAIN` set during build
- **Custom CSS**: Potential domain-specific theming
- **Brand Assets**: Domain-specific logos and favicons
- **DNS Configuration**: Custom domains via Cloudflare

### Access URLs

Each domain has:

- **Production**: `https://{domain}`
- **Staging**: `https://staging.{domain}`
- **Preview**: Generated for pull requests

## Development Workflow

### Local Development

```bash
cd docs/
pnpm dev
```

### Building for Specific Domain

```bash
ZUDOKU_PUBLIC_DOMAIN=brightpath-ai pnpm build
```

### Deployment

Deployments are automated via GitHub Actions:

- Push to main → deploys all domains
- Push to domain branch → deploys specific domain
- PR to production branch → creates preview deployment

## Future Considerations

### Potential Differentiation Paths

1. **Domain-Specific Content**: Create unique pages per domain
2. **Custom Navigation**: Tailor navigation based on target audience
3. **Brand Theming**: Implement domain-specific color schemes and styling
4. **Content Filtering**: Show/hide content based on domain context
5. **Custom Landing Pages**: Create unique home pages per domain
6. **Audience-Specific Examples**: Tailor code examples to domain focus

### Recommended Content Strategy

To maximize the value of multiple domains, consider:

1. **Core Documentation**: Maintain shared technical documentation
2. **Domain-Specific Guides**: Add audience-specific tutorials and guides
3. **Use Case Examples**: Create relevant examples for each target audience
4. **Custom Landing Pages**: Design unique entry points for each brand
5. **SEO Optimization**: Tailor metadata and content for domain-specific keywords

## Technical Details

### Configuration File

`docs/zudoku.config.tsx` contains:

- Site metadata and branding
- Navigation structure
- Theme configuration
- Plugin setup
- API documentation configuration
- Search configuration

### Content Structure

```
docs/
├── pages/
│   ├── docs/           # Main documentation
│   ├── components/     # Component documentation
│   └── ...
├── src/                # Custom React components
├── schema/             # API schemas
└── zudoku.config.tsx   # Configuration
```

## Monitoring & Analytics

- **Analytics**: PostHog integration configured
- **Uptime Monitoring**: Should be configured per domain
- **Performance**: Lighthouse CI runs on deployments
- **Deployment Status**: Available in GitHub Actions

## Support & Maintenance

### Updating Content

1. Edit files in `docs/` directory
2. Commit to main or domain-specific branch
3. Automatic deployment to all/specific domains
4. Preview on staging before production merge

### Troubleshooting

- **Build Issues**: Check GitHub Actions logs
- **Domain Issues**: Verify Cloudflare DNS configuration
- **Content Issues**: Review MDX syntax and frontmatter
- **Deployment Failures**: Check Cloudflare API tokens and permissions

## Conclusion

This multi-domain strategy allows the BrightForest/Zudoku ecosystem to target different audiences
and use cases while maintaining a single source of truth for documentation. Each domain can be
independently branded and marketed while benefiting from shared documentation updates and
improvements.
