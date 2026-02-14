# Documentation Site Images

This directory contains hero images for each of the 13 domains in the BrightForest ecosystem.

## Directory Structure

Each domain has its own subdirectory containing hero images:

```
images/
├── brightforest-io/
├── brightforestx-com/
├── brightpath-ai/
├── pathx-ai/
├── figmatofullstack-com/
├── figmatofullstack-ai/
├── mlninjas-com/
├── clifforddalsoniii-com/
├── getdiyai-com/
├── getdiyrpa-com/
├── appnowhq-com/
├── brightforest-ai/
└── iheartai-ai/
```

## Image Files

### Placeholder SVGs

Each domain directory currently contains a `placeholder.svg` file:

- **Dimensions**: 1200x630 pixels (optimized for social media and hero sections)
- **Format**: SVG with gradient background
- **Content**: Domain name centered in white text
- **Gradients**: Each domain has a unique color gradient for visual distinction

### Future: Grok Imagine API Generated Images

The placeholder SVGs are temporary and will be replaced with AI-generated images from the Grok Imagine API (xAI).

#### Generating New Images

To generate new hero images using Grok Imagine API:

1. Set the `XAI_API_KEY` environment variable with your xAI API key
2. Run the image generation script:
   ```bash
   ./scripts/generate-images.sh
   ```

The script will:

- Generate unique, professional hero images for each domain using Grok Imagine API
- Save generated images as `hero.png` in each domain's subdirectory
- Preserve the existing `placeholder.svg` files as fallbacks

#### Generated Image Specifications

Generated `hero.png` files will:

- Be domain-specific and professionally designed
- Reflect the unique purpose and branding of each domain
- Maintain 1200x630 pixel dimensions for consistency
- Be optimized for web delivery (target < 500KB)

## Usage in Documentation

Hero images are displayed using the `DomainHero` component in site-specific roadmap pages:

```mdx
import { DomainHero } from "@/components/DomainHero";

<DomainHero
  domain="brightforest-io"
  title="brightforest.io"
  description="Primary platform and documentation hub"
/>
```

The component automatically loads:

1. `hero.png` if available (AI-generated)
2. Falls back to `placeholder.svg` if `hero.png` doesn't exist

## Maintenance

### Adding a New Domain

To add a new domain:

1. Create a new subdirectory: `images/{domain-name}/`
2. Create a placeholder SVG with appropriate gradient colors
3. Add the domain to the image generation script
4. Update this README with the new domain

### Updating Placeholder SVGs

Placeholder SVGs should:

- Maintain 1200x630 pixel dimensions
- Use unique gradient colors per domain
- Display the domain name prominently
- Use web-safe fonts and simple styling

### Image Optimization

All images (both placeholders and generated) should be:

- Under 500KB in size
- Properly compressed for web delivery
- Accessible with appropriate alt text
- Responsive and mobile-friendly

## Image Specifications

### Dimensions

- **Width**: 1200px
- **Height**: 630px
- **Aspect Ratio**: 1.91:1 (optimal for social media)

### Formats

- **SVG**: Placeholder images (vector, scalable)
- **PNG**: Generated hero images (raster, high quality)
- **WebP**: Future optimization format (optional)

### Color Gradients (Current Placeholders)

| Domain                  | Gradient Colors      |
| ----------------------- | -------------------- |
| brightforest.io         | Green (#2E7D32 → #66BB6A) |
| brightforestx.com       | Blue (#1565C0 → #42A5F5) |
| brightpath.ai           | Purple (#6A1B9A → #BA68C8) |
| pathx.ai                | Red (#C62828 → #EF5350) |
| figmatofullstack.com    | Teal (#00695C → #26A69A) |
| figmatofullstack.ai     | Pink (#AD1457 → #EC407A) |
| mlninjas.com            | Orange (#E65100 → #FF9800) |
| clifforddalsoniii.com   | Deep Purple (#4A148C → #9C27B0) |
| getdiyai.com            | Light Blue (#0277BD → #29B6F6) |
| getdiyrpa.com           | Light Green (#558B2F → #9CCC65) |
| appnowhq.com            | Red (#D32F2F → #F44336) |
| brightforest.ai         | Cyan (#00838F → #26C6DA) |
| iheartai.ai             | Rose (#D81B60 → #F06292) |

## Related Documentation

- [Domain Hero Images Feature](/docs/tests/features/shared/images/domain-hero-images.feature)
- [Shared MDX Components](/docs/tests/features/shared/components/shared-mdx-components.feature)
- [Site Roadmaps](/docs/roadmap/sites/)

## Contributing

When contributing new images or updating existing ones:

1. Ensure images meet size and format requirements
2. Test images across different devices and screen sizes
3. Verify accessibility (alt text, contrast ratios)
4. Update this README with any structural changes

---

**Note**: Placeholder SVGs are version-controlled. Generated PNG images from Grok Imagine API should be added to `.gitignore` if they become too large or change frequently.
