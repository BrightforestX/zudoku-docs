# BDD Feature Testing Roadmap

This document outlines all Behavior-Driven Development (BDD) `.feature` files needed for
comprehensive testing of the 13 documentation sites. Features are organized into shared tests
(applicable to all sites) and site-specific tests.

## 1. Shared Features (Apply to All 13 Sites)

These features test common functionality across all documentation sites.

### Navigation

| File Path                                                     | Feature Name       | Description                                                     |
| ------------------------------------------------------------- | ------------------ | --------------------------------------------------------------- |
| `tests/features/shared/navigation/main-navigation.feature`    | Main Navigation    | Test primary navigation menu, links, and hierarchy              |
| `tests/features/shared/navigation/mobile-navigation.feature`  | Mobile Navigation  | Test hamburger menu, drawer, and mobile-specific navigation     |
| `tests/features/shared/navigation/breadcrumbs.feature`        | Breadcrumbs        | Test breadcrumb trail, navigation, and current page indication  |
| `tests/features/shared/navigation/sidebar-navigation.feature` | Sidebar Navigation | Test documentation sidebar, collapsible sections, active states |
| `tests/features/shared/navigation/table-of-contents.feature`  | Table of Contents  | Test on-page TOC, scroll highlighting, and anchor links         |

### SEO

| File Path                                           | Feature Name       | Description                                                     |
| --------------------------------------------------- | ------------------ | --------------------------------------------------------------- |
| `tests/features/shared/seo/meta-tags.feature`       | Meta Tags          | Test title, description, Open Graph, and Twitter card meta tags |
| `tests/features/shared/seo/structured-data.feature` | Structured Data    | Test JSON-LD schema markup for documentation                    |
| `tests/features/shared/seo/sitemap.feature`         | Sitemap Generation | Test XML sitemap generation and accuracy                        |
| `tests/features/shared/seo/robots-txt.feature`      | Robots.txt         | Test robots.txt configuration and crawl directives              |
| `tests/features/shared/seo/canonical-urls.feature`  | Canonical URLs     | Test canonical link tags for duplicate content prevention       |

### Accessibility

| File Path                                                         | Feature Name          | Description                                                    |
| ----------------------------------------------------------------- | --------------------- | -------------------------------------------------------------- |
| `tests/features/shared/accessibility/keyboard-navigation.feature` | Keyboard Navigation   | Test full keyboard accessibility (Tab, Enter, Esc, Arrow keys) |
| `tests/features/shared/accessibility/screen-reader.feature`       | Screen Reader Support | Test ARIA labels, landmarks, and screen reader compatibility   |
| `tests/features/shared/accessibility/color-contrast.feature`      | Color Contrast        | Test WCAG 2.1 AA color contrast ratios                         |
| `tests/features/shared/accessibility/focus-indicators.feature`    | Focus Indicators      | Test visible focus indicators on interactive elements          |
| `tests/features/shared/accessibility/alt-text.feature`            | Image Alt Text        | Test all images have descriptive alt text                      |
| `tests/features/shared/accessibility/heading-hierarchy.feature`   | Heading Hierarchy     | Test proper heading structure (H1-H6)                          |

### Performance

| File Path                                                      | Feature Name       | Description                                        |
| -------------------------------------------------------------- | ------------------ | -------------------------------------------------- |
| `tests/features/shared/performance/page-load-speed.feature`    | Page Load Speed    | Test Lighthouse performance score (90+)            |
| `tests/features/shared/performance/asset-optimization.feature` | Asset Optimization | Test image compression, minification, and bundling |
| `tests/features/shared/performance/lazy-loading.feature`       | Lazy Loading       | Test images and components load on demand          |
| `tests/features/shared/performance/caching.feature`            | Caching Strategy   | Test browser caching headers and CDN integration   |
| `tests/features/shared/performance/core-web-vitals.feature`    | Core Web Vitals    | Test LCP, FID, CLS metrics                         |

### Responsive Design

| File Path                                                 | Feature Name      | Description                                             |
| --------------------------------------------------------- | ----------------- | ------------------------------------------------------- |
| `tests/features/shared/responsive/mobile-layout.feature`  | Mobile Layout     | Test layout and content on mobile devices (320px-767px) |
| `tests/features/shared/responsive/tablet-layout.feature`  | Tablet Layout     | Test layout on tablets (768px-1023px)                   |
| `tests/features/shared/responsive/desktop-layout.feature` | Desktop Layout    | Test layout on desktop screens (1024px+)                |
| `tests/features/shared/responsive/touch-targets.feature`  | Touch Targets     | Test minimum 44x44px touch targets on mobile            |
| `tests/features/shared/responsive/viewport-meta.feature`  | Viewport Meta Tag | Test proper viewport configuration                      |

### Search

| File Path                                                        | Feature Name         | Description                               |
| ---------------------------------------------------------------- | -------------------- | ----------------------------------------- |
| `tests/features/shared/search/search-functionality.feature`      | Search Functionality | Test search input, results, and relevance |
| `tests/features/shared/search/search-keyboard-shortcuts.feature` | Search Shortcuts     | Test keyboard shortcuts (Cmd/Ctrl+K)      |
| `tests/features/shared/search/search-filters.feature`            | Search Filters       | Test filtering by category, type, or tag  |
| `tests/features/shared/search/search-highlighting.feature`       | Result Highlighting  | Test search term highlighting in results  |

### Footer

| File Path                                                | Feature Name      | Description                                          |
| -------------------------------------------------------- | ----------------- | ---------------------------------------------------- |
| `tests/features/shared/footer/footer-links.feature`      | Footer Links      | Test footer navigation links and social media        |
| `tests/features/shared/footer/legal-pages.feature`       | Legal Pages       | Test privacy policy, terms of service, cookie policy |
| `tests/features/shared/footer/newsletter-signup.feature` | Newsletter Signup | Test email subscription form (if applicable)         |

### Error Handling

| File Path                                               | Feature Name     | Description                                  |
| ------------------------------------------------------- | ---------------- | -------------------------------------------- |
| `tests/features/shared/errors/404-page.feature`         | 404 Error Page   | Test custom 404 page with helpful navigation |
| `tests/features/shared/errors/500-page.feature`         | 500 Error Page   | Test server error handling                   |
| `tests/features/shared/errors/broken-links.feature`     | Broken Links     | Test for dead links and redirects            |
| `tests/features/shared/errors/error-boundaries.feature` | Error Boundaries | Test React error boundary handling           |

### API Reference

| File Path                                             | Feature Name       | Description                                |
| ----------------------------------------------------- | ------------------ | ------------------------------------------ |
| `tests/features/shared/api/openapi-rendering.feature` | OpenAPI Rendering  | Test OpenAPI spec rendering and display    |
| `tests/features/shared/api/api-try-it.feature`        | API Try It Out     | Test interactive API request functionality |
| `tests/features/shared/api/code-examples.feature`     | Code Examples      | Test code snippets in multiple languages   |
| `tests/features/shared/api/authentication.feature`    | API Authentication | Test API key/token input and persistence   |

### Dark Mode

| File Path                                               | Feature Name           | Description                                 |
| ------------------------------------------------------- | ---------------------- | ------------------------------------------- |
| `tests/features/shared/theme/dark-mode-toggle.feature`  | Dark Mode Toggle       | Test theme switcher functionality           |
| `tests/features/shared/theme/theme-persistence.feature` | Theme Persistence      | Test theme preference saved across sessions |
| `tests/features/shared/theme/system-preference.feature` | System Theme Detection | Test respect for OS theme preference        |

## 2. Site-Specific Features

Features unique to each documentation site based on their purpose.

### brightforest.io

| File Path                                                          | Feature Name        | Description                                 |
| ------------------------------------------------------------------ | ------------------- | ------------------------------------------- |
| `tests/features/sites/brightforest-io/platform-overview.feature`   | Platform Overview   | Test landing page and platform introduction |
| `tests/features/sites/brightforest-io/integration-guides.feature`  | Integration Guides  | Test third-party integration documentation  |
| `tests/features/sites/brightforest-io/enterprise-features.feature` | Enterprise Features | Test enterprise tier documentation          |

### brightforestx.com

| File Path                                                           | Feature Name       | Description                                 |
| ------------------------------------------------------------------- | ------------------ | ------------------------------------------- |
| `tests/features/sites/brightforestx-com/enterprise-pricing.feature` | Enterprise Pricing | Test pricing calculator and tier comparison |
| `tests/features/sites/brightforestx-com/multi-tenant-docs.feature`  | Multi-Tenant Docs  | Test multi-tenancy configuration guides     |
| `tests/features/sites/brightforestx-com/sla-documentation.feature`  | SLA Documentation  | Test SLA terms and support documentation    |

### brightpath.ai

| File Path                                                      | Feature Name      | Description                             |
| -------------------------------------------------------------- | ----------------- | --------------------------------------- |
| `tests/features/sites/brightpath-ai/ai-tutorials.feature`      | AI Tutorials      | Test AI/ML tutorial pages and examples  |
| `tests/features/sites/brightpath-ai/model-integration.feature` | Model Integration | Test model integration guide navigation |
| `tests/features/sites/brightpath-ai/use-case-gallery.feature`  | Use Case Gallery  | Test AI use case examples and filtering |

### pathx.ai

| File Path                                                 | Feature Name            | Description                               |
| --------------------------------------------------------- | ----------------------- | ----------------------------------------- |
| `tests/features/sites/pathx-ai/algorithm-docs.feature`    | Algorithm Documentation | Test technical algorithm documentation    |
| `tests/features/sites/pathx-ai/benchmark-results.feature` | Benchmark Results       | Test performance benchmark displays       |
| `tests/features/sites/pathx-ai/research-papers.feature`   | Research Papers         | Test research paper repository and search |

### figmatofullstack.com

| File Path                                                             | Feature Name      | Description                                     |
| --------------------------------------------------------------------- | ----------------- | ----------------------------------------------- |
| `tests/features/sites/figmatofullstack-com/plugin-docs.feature`       | Figma Plugin Docs | Test Figma plugin installation and usage guides |
| `tests/features/sites/figmatofullstack-com/code-generation.feature`   | Code Generation   | Test code generation examples and workflows     |
| `tests/features/sites/figmatofullstack-com/design-tokens.feature`     | Design Tokens     | Test design token documentation                 |
| `tests/features/sites/figmatofullstack-com/component-library.feature` | Component Library | Test component library browser and preview      |

### figmatofullstack.ai

| File Path                                                                  | Feature Name            | Description                              |
| -------------------------------------------------------------------------- | ----------------------- | ---------------------------------------- |
| `tests/features/sites/figmatofullstack-ai/ai-code-gen.feature`             | AI Code Generation      | Test AI-powered code generation docs     |
| `tests/features/sites/figmatofullstack-ai/intelligent-suggestions.feature` | Intelligent Suggestions | Test AI suggestion feature documentation |
| `tests/features/sites/figmatofullstack-ai/model-training.feature`          | Model Training          | Test custom model training guides        |

### mlninjas.com

| File Path                                                      | Feature Name       | Description                                     |
| -------------------------------------------------------------- | ------------------ | ----------------------------------------------- |
| `tests/features/sites/mlninjas-com/learning-paths.feature`     | Learning Paths     | Test ML course and learning path navigation     |
| `tests/features/sites/mlninjas-com/code-notebooks.feature`     | Code Notebooks     | Test Jupyter notebook integration and rendering |
| `tests/features/sites/mlninjas-com/community-showcase.feature` | Community Showcase | Test project showcase and submission            |
| `tests/features/sites/mlninjas-com/certifications.feature`     | Certifications     | Test certification program documentation        |

### clifforddalsoniii.com

| File Path                                                         | Feature Name   | Description                                     |
| ----------------------------------------------------------------- | -------------- | ----------------------------------------------- |
| `tests/features/sites/clifforddalsoniii-com/portfolio.feature`    | Portfolio      | Test project portfolio display and filtering    |
| `tests/features/sites/clifforddalsoniii-com/blog.feature`         | Technical Blog | Test blog post listing, reading, and navigation |
| `tests/features/sites/clifforddalsoniii-com/contact-form.feature` | Contact Form   | Test contact form validation and submission     |

### getdiyai.com

| File Path                                                   | Feature Name     | Description                                  |
| ----------------------------------------------------------- | ---------------- | -------------------------------------------- |
| `tests/features/sites/getdiyai-com/tool-directory.feature`  | Tool Directory   | Test AI tool catalog and filtering           |
| `tests/features/sites/getdiyai-com/templates.feature`       | Template Library | Test pre-built template browsing and preview |
| `tests/features/sites/getdiyai-com/pricing-plans.feature`   | Pricing Plans    | Test pricing page and plan comparison        |
| `tests/features/sites/getdiyai-com/getting-started.feature` | Getting Started  | Test onboarding flow documentation           |

### getdiyrpa.com

| File Path                                                       | Feature Name          | Description                              |
| --------------------------------------------------------------- | --------------------- | ---------------------------------------- |
| `tests/features/sites/getdiyrpa-com/workflow-builder.feature`   | Workflow Builder Docs | Test workflow builder documentation      |
| `tests/features/sites/getdiyrpa-com/automation-recipes.feature` | Automation Recipes    | Test pre-built automation recipe browser |
| `tests/features/sites/getdiyrpa-com/integrations.feature`       | RPA Integrations      | Test integration documentation and setup |
| `tests/features/sites/getdiyrpa-com/roi-calculator.feature`     | ROI Calculator        | Test ROI calculator functionality        |

### appnowhq.com

| File Path                                                        | Feature Name         | Description                             |
| ---------------------------------------------------------------- | -------------------- | --------------------------------------- |
| `tests/features/sites/appnowhq-com/app-builder.feature`          | App Builder Docs     | Test app builder feature documentation  |
| `tests/features/sites/appnowhq-com/template-marketplace.feature` | Template Marketplace | Test template browsing and installation |
| `tests/features/sites/appnowhq-com/deployment-guide.feature`     | Deployment Guide     | Test deployment documentation           |
| `tests/features/sites/appnowhq-com/api-integrations.feature`     | API Integrations     | Test third-party API integration guides |

### brightforest.ai

| File Path                                                          | Feature Name        | Description                                 |
| ------------------------------------------------------------------ | ------------------- | ------------------------------------------- |
| `tests/features/sites/brightforest-ai/model-deployment.feature`    | Model Deployment    | Test ML model deployment documentation      |
| `tests/features/sites/brightforest-ai/mlops-docs.feature`          | MLOps Documentation | Test MLOps workflow and tools documentation |
| `tests/features/sites/brightforest-ai/experiment-tracking.feature` | Experiment Tracking | Test experiment tracking feature docs       |
| `tests/features/sites/brightforest-ai/data-pipelines.feature`      | Data Pipelines      | Test data pipeline configuration guides     |

### iheartai.ai

| File Path                                                     | Feature Name       | Description                               |
| ------------------------------------------------------------- | ------------------ | ----------------------------------------- |
| `tests/features/sites/iheartai-ai/beginner-guides.feature`    | Beginner Guides    | Test beginner-friendly AI content         |
| `tests/features/sites/iheartai-ai/news-feed.feature`          | AI News Feed       | Test news and trends section              |
| `tests/features/sites/iheartai-ai/community-projects.feature` | Community Projects | Test community project listings           |
| `tests/features/sites/iheartai-ai/events-calendar.feature`    | Events Calendar    | Test AI events and meetup calendar        |
| `tests/features/sites/iheartai-ai/resource-directory.feature` | Resource Directory | Test curated resource links and filtering |

## 3. Cross-Site Features

Features that test interactions between sites or shared infrastructure.

| File Path                                                 | Feature Name              | Description                                        |
| --------------------------------------------------------- | ------------------------- | -------------------------------------------------- |
| `tests/features/cross-site/domain-verification.feature`   | Domain Verification       | Test all 13 domains are correctly configured       |
| `tests/features/cross-site/cloudflare-deployment.feature` | Cloudflare Deployment     | Test deployment to Cloudflare Pages                |
| `tests/features/cross-site/staging-production.feature`    | Staging/Production Parity | Test staging vs production environment consistency |
| `tests/features/cross-site/analytics-tracking.feature`    | Analytics Tracking        | Test Cloudflare Analytics integration              |
| `tests/features/cross-site/uptime-monitoring.feature`     | Uptime Monitoring         | Test all sites are accessible and responding       |

## Summary

**Total Feature Files**: 85

- **Shared Features**: 42 files
  - Navigation: 5
  - SEO: 5
  - Accessibility: 6
  - Performance: 5
  - Responsive Design: 5
  - Search: 4
  - Footer: 3
  - Error Handling: 4
  - API Reference: 4
  - Dark Mode: 3
  - Cross-Site: 5

- **Site-Specific Features**: 43 files
  - brightforest.io: 3
  - brightforestx.com: 3
  - brightpath.ai: 3
  - pathx.ai: 3
  - figmatofullstack.com: 4
  - figmatofullstack.ai: 3
  - mlninjas.com: 4
  - clifforddalsoniii.com: 3
  - getdiyai.com: 4
  - getdiyrpa.com: 4
  - appnowhq.com: 4
  - brightforest.ai: 4
  - iheartai.ai: 5

## Implementation Priority

### Phase 1: Critical (Must Have)

- All Navigation features
- All Accessibility features
- All Error Handling features
- Performance: page-load-speed, core-web-vitals
- Responsive: mobile-layout, desktop-layout
- SEO: meta-tags, sitemap

### Phase 2: Important (Should Have)

- All Search features
- All Dark Mode features
- All API Reference features
- Remaining Performance features
- Remaining SEO features
- Footer features

### Phase 3: Nice to Have

- Site-specific features (based on each site's roadmap)
- Cross-site features
- Advanced performance testing
- Visual regression testing

## Testing Framework

All `.feature` files should follow Gherkin syntax and be executable with:

- **Playwright** for E2E testing
- **Axe-core** for accessibility testing
- **Lighthouse CI** for performance testing
- **Percy** or **Chromatic** for visual regression testing

## Maintenance

- Review and update feature files quarterly
- Add new features as sites evolve
- Archive deprecated features
- Keep this roadmap in sync with `docs/SITE_PURPOSES.md`
