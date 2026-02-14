# FigmaToFullstack Hero Image Generation Guide

This guide explains how to generate professional hero images for figmatofullstack.ai and figmatofullstack.com using the xAI Grok Imagine API.

## Quick Start

### Prerequisites

1. **xAI API Key**: Get one from https://x.ai/api
2. **jq**: JSON processor (install with `sudo apt-get install jq` or `brew install jq`)

### Generate Images

```bash
# Set your API key
export XAI_API_KEY='your-xai-api-key-here'

# Run the generation script
cd /workspace
./docs/scripts/generate-figmatofullstack-images.sh
```

### For Cursor Cloud Agents

Add your XAI_API_KEY to Cursor Dashboard:
1. Go to Cursor Dashboard > Cloud Agents > Secrets
2. Add secret: `XAI_API_KEY` = `your-key-here`
3. Secret will be available in future agent runs

## Generated Images

The script generates two professional hero images:

### figmatofullstack.com
**Location:** `docs/public/images/figmatofullstack-com/hero.png`

**Theme:** Design-to-code transformation
- Shows Figma frames morphing into React code
- Pink and blue color scheme
- Professional tech aesthetic
- Isometric perspective
- Photorealistic rendering

**Prompt Used:**
```
Professional cinematic visualization of design-to-code transformation: glowing Figma 
design frames with UI components (buttons, forms, navigation) in vibrant pink and blue 
on left, seamlessly morphing into clean React code with syntax highlighting on right. 
Center shows smooth flowing particles and light trails representing automated conversion. 
Dark navy gradient background (#0A1628 to #1A2332) with subtle grid pattern. Modern 
sleek professional tech aesthetic, isometric perspective, photorealistic rendering with 
soft ambient lighting and blue-pink accent glows, ultra HD quality
```

### figmatofullstack.ai
**Location:** `docs/public/images/figmatofullstack-ai/hero.png`

**Theme:** AI-powered design assistant
- Holographic AI interface with analysis nodes
- Purple and gold color scheme
- Premium tech-luxury aesthetic
- Glass morphism effects
- Futuristic but approachable

**Prompt Used:**
```
Sophisticated AI-powered design assistant visualization: center shows sleek holographic 
interface displaying UI design with floating AI analysis nodes highlighting accessibility 
issues, spacing improvements, and layout optimizations. Ethereal purple and gold AI 
particles flow around design representing intelligent enhancement. Multiple device frames 
(desktop, tablet, mobile) show auto-generated responsive variations. Subtle neural network 
patterns in background suggesting machine learning. Dark elegant background (#0D0221 to 
#1A1034) with premium gold accents (#D4AF37) and vibrant purple highlights (#8B5CF6). 
Professional tech-luxury aesthetic, floating UI elements with glass morphism, soft 
volumetric lighting, futuristic but approachable, ultra HD quality
```

## Image Specifications

- **Format:** PNG
- **Size:** 1024x1024 pixels (optimized by xAI)
- **Quality:** Ultra HD
- **File Size:** ~200-500 KB per image
- **Model:** grok-2-image

## Verification

After generation, verify the images:

```bash
# Check files exist
ls -lh docs/public/images/figmatofullstack-ai/hero.png
ls -lh docs/public/images/figmatofullstack-com/hero.png

# View in browser (if you have a local server running)
open http://localhost:9000/docs/roadmap/sites/figmatofullstack-ai
open http://localhost:9000/docs/roadmap/sites/figmatofullstack-com
```

## Regenerating Images

If you need to regenerate the images with different prompts:

1. Edit the prompts in `docs/scripts/generate-figmatofullstack-images.sh`
2. Backup existing images if you want to keep them:
   ```bash
   cp docs/public/images/figmatofullstack-ai/hero.png docs/public/images/figmatofullstack-ai/hero.png.backup
   cp docs/public/images/figmatofullstack-com/hero.png docs/public/images/figmatofullstack-com/hero.png.backup
   ```
3. Run the script again

## Prompt Engineering Tips

For best results with Grok Imagine:

1. **Be Specific:** Describe exact visual elements you want
2. **Specify Style:** Include terms like "photorealistic", "isometric", "cinematic"
3. **Color Palette:** Provide exact hex codes for brand colors
4. **Quality Terms:** Use "ultra HD", "high detail", "professional"
5. **Lighting:** Specify lighting style for atmosphere
6. **Composition:** Describe spatial layout and perspective
7. **Technical Details:** Mention specific UI elements or code representations

## Troubleshooting

### API Key Issues

**Problem:** "XAI_API_KEY environment variable is not set"
**Solution:** 
```bash
export XAI_API_KEY='your-key-here'
```

**Problem:** "API request failed with status 401"
**Solution:** Check that your API key is valid and active at https://x.ai/api

### Rate Limiting

**Problem:** "API request failed with status 429"
**Solution:** 
- Wait a few minutes and try again
- The script includes a 2-second delay between requests
- Check your API rate limits on the xAI dashboard

### Image Quality Issues

**Problem:** Generated image doesn't match expectations
**Solution:**
1. Review and enhance the prompt
2. Add more specific details
3. Include quality/style keywords
4. Regenerate with updated prompt

### Network Issues

**Problem:** "Failed to download image from URL"
**Solution:**
- Check your internet connection
- Try again (URL might be temporary)
- Check xAI API status

## Cost Estimation

xAI Grok Imagine API pricing (as of 2026):
- ~$0.05-0.10 per image generation
- **Total Cost:** $0.10-0.20 for both figmatofullstack images

Check current pricing at: https://x.ai/api/pricing

## Integration with Documentation

The `DomainHero` component automatically uses these images:

```tsx
<DomainHero
  domain="figmatofullstack-ai"
  title="figmatofullstack.ai"
  description="AI-enhanced design transformation"
/>
```

The component:
1. First tries to load `hero.png`
2. Falls back to `placeholder.svg` if not found
3. Handles errors gracefully
4. Provides responsive image display

## Related Documentation

- [Main Image Generation Guide](/docs/IMAGE_GENERATION.md) - Full ecosystem image generation
- [Audit Report](/FIGMATOFULLSTACK_AUDIT_2026-02-14.md) - Comprehensive audit findings
- [Hero Images Implementation](/docs/HERO_IMAGES_IMPLEMENTATION.md) - Technical implementation details

## Support

For issues or questions:
- Check the main audit report for context
- Review the enhanced prompts in the script
- Test with different prompt variations
- Contact xAI support for API-specific issues

---

**Generated:** February 14, 2026  
**Script:** `docs/scripts/generate-figmatofullstack-images.sh`  
**Status:** Ready for execution with XAI_API_KEY
