# GetDIYAI.com Images

This directory contains visual assets for GetDIYAI.com documentation and branding.

## Current Assets

### Professional SVG Placeholders

These are high-quality SVG placeholders that will be replaced with AI-generated images once the xAI API key is configured:

1. **hero.svg** (1024x1024)
   - Main hero image for landing page
   - Features: DIY workshop theme with gears, neural nodes, tools
   - Colors: Dark background with yellow/orange gradients
   - Purpose: Brand identity and value proposition

2. **builder-interface.svg** (1200x800)
   - Visual workflow builder interface
   - Features: Drag-and-drop canvas with connected AI components
   - Colors: Dark theme with colorful component nodes
   - Purpose: Showcase visual builder capabilities

3. **template-gallery.svg** (1200x800)
   - Template marketplace grid view
   - Features: 6 template cards with categories and ratings
   - Colors: Diverse category colors on dark background
   - Purpose: Display template variety and quality

4. **placeholder.svg** (1200x630)
   - Original simple placeholder
   - Purpose: Fallback/legacy placeholder

## Future AI-Generated Images

To generate professional PNG images using the Grok Imagine API, run:

```bash
./docs/scripts/generate-getdiyai-images.sh
```

### Prerequisites

1. **xAI API Key**: Obtain from https://x.ai/api
2. **Configure in Cursor**: Add `XAI_API_KEY` secret in Cursor Dashboard > Cloud Agents > Secrets
3. **Install jq**: `sudo apt-get install jq` (if not already installed)

### Planned AI-Generated Images

The script will generate 8 professional images:

1. **hero.png** - Main hero image
2. **builder-interface.png** - Workflow builder UI
3. **template-gallery.png** - Template marketplace
4. **components-library.png** - AI component palette
5. **deployment-dashboard.png** - Deployment interface
6. **learning-hub.png** - Educational resources
7. **workflow-testing.png** - Real-time testing UI
8. **template-customization.png** - Template editor

All images will be:
- **Format**: PNG
- **Size**: 1024x1024 pixels
- **Style**: Professional tech illustrations
- **Theme**: Dark background with yellow/orange accents
- **Quality**: Production-ready

## Image Usage

### In MDX Documentation

```tsx
import { DomainHero } from '@/components/DomainHero';

<DomainHero
  domain="getdiyai-com"
  title="GetDIYAI.com"
  description="Build AI Solutions Without Code"
/>
```

The `DomainHero` component automatically selects the best available image:
1. First tries: `hero.png` (AI-generated)
2. Falls back to: `hero.svg` (professional placeholder)
3. Final fallback: `placeholder.svg` (simple placeholder)

### Direct Image References

```markdown
![Builder Interface](/images/getdiyai-com/builder-interface.svg)
```

## Brand Guidelines

### Colors

- **Primary**: Yellow (#ffd700) and Orange (#ff6b35)
- **Background**: Dark navy (#1a1a2e, #16213e)
- **Accent**: Warm orange gradients
- **Secondary**: Teal (#4ecdc4) for AI components

### Theme

- **DIY Workshop**: Tools, gears, building blocks
- **AI Technology**: Neural networks, data flows
- **Accessibility**: Friendly, approachable, non-technical
- **Modern**: Flat design, clean lines, professional

### Typography

- **Headings**: Bold, clear, sans-serif
- **Body**: Readable, friendly tone
- **Technical**: Monospace for code examples

## Maintenance

### When to Regenerate Images

- New features are added to the platform
- Brand guidelines change
- Higher resolution needed
- Visual style updates

### How to Regenerate

1. Ensure `XAI_API_KEY` is set
2. Run: `./docs/scripts/generate-getdiyai-images.sh`
3. Verify generated images
4. Commit to repository

## File Size Guidelines

- **SVG**: Keep under 50KB each
- **PNG**: Target 200-500KB per image
- **Optimize**: Use compression for production

## Related Documentation

- [Image Generation Guide](/docs/IMAGE_GENERATION.md)
- [GetDIYAI Audit Report](/docs/getdiyai-com-audit-report.md)
- [Main Images README](/docs/public/images/README.md)
- [Domain Hero Component](/docs/src/components/DomainHero.tsx)

## License

All images are proprietary to GetDIYAI.com and should not be used without permission.

---

**Last Updated**: February 14, 2026
**Image Count**: 4 SVG, 0 PNG (pending API key setup)
**Status**: Professional SVG placeholders in use, ready for AI generation
