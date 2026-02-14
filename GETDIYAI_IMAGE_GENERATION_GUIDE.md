# GetDIYAI.com AI Image Generation Guide

This guide explains how to generate professional AI images for GetDIYAI.com using the Grok Imagine API.

## Current Status

✅ **Professional SVG placeholders** are currently in place and provide high-quality visuals.

⏳ **AI-generated PNG images** are ready to generate once the xAI API key is configured.

## Quick Start

### Step 1: Obtain xAI API Key

1. Visit https://x.ai/api
2. Sign up or log in to your xAI account
3. Navigate to API keys section
4. Generate a new API key
5. Copy and save the key securely

### Step 2: Configure API Key in Cursor

Since this is a Cloud Agent environment:

1. Open **Cursor Dashboard**
2. Navigate to **Cloud Agents > Secrets**
3. Click **Add Secret**
4. Enter:
   - **Name**: `XAI_API_KEY`
   - **Value**: Your xAI API key
   - **Scope**: Repository or User (as appropriate)
5. Save the secret

The secret will be automatically injected as an environment variable in future Cloud Agent runs.

### Step 3: Generate Images

Once the API key is configured, run:

```bash
./docs/scripts/generate-getdiyai-images.sh
```

This will generate 8 professional PNG images:

1. **hero.png** - Main hero/landing page image
2. **builder-interface.png** - Visual workflow builder
3. **template-gallery.png** - Template marketplace
4. **components-library.png** - AI component palette
5. **deployment-dashboard.png** - Deployment interface
6. **learning-hub.png** - Learning resources
7. **workflow-testing.png** - Real-time testing UI
8. **template-customization.png** - Template editor

### Step 4: Verify Generated Images

```bash
# List generated images
ls -lh docs/public/images/getdiyai-com/*.png

# Count images (should be 8)
find docs/public/images/getdiyai-com -name "*.png" | wc -l

# Check total size
du -h docs/public/images/getdiyai-com/
```

### Step 5: Commit New Images

```bash
git add docs/public/images/getdiyai-com/*.png
git commit -m "feat(getdiyai): add AI-generated hero and feature images"
git push
```

## Image Specifications

All AI-generated images will have:

- **Format**: PNG with transparency support
- **Size**: 1024x1024 pixels (square format)
- **Quality**: High-resolution, production-ready
- **Style**: Professional tech illustrations
- **Theme**: Dark backgrounds with yellow/orange accents
- **File Size**: ~200-500KB per image

## Prompt Details

The script uses carefully crafted prompts for each image:

### Hero Image
```
Professional DIY AI workshop illustration with floating AI building blocks,
gears, neural network nodes, and toolkit icons, dark navy background with
warm yellow and orange gradient accents, modern flat design, 3D isometric
style, tech illustration, no text
```

### Builder Interface
```
Visual AI workflow builder interface showing drag-and-drop canvas with
connected AI component nodes, data flow connections, modern UI design,
dark theme with yellow/orange accents, clean professional look,
dashboard screenshot style, no text
```

### Template Gallery
```
AI template marketplace grid showing diverse template cards with icons for
chatbot, image processing, text analysis, and automation, organized layout,
dark background, colorful category badges, professional UI design, no text
```

### Components Library
```
AI component palette showing modular blocks for text analysis, image
processing, data transformation, and integrations, color-coded by type
(blue=data, green=ML, orange=integration), modern component library UI,
dark theme, no text
```

### Deployment Dashboard
```
Deployment status dashboard with workflow execution metrics, success
indicators, API endpoint display, monitoring graphs, modern dashboard UI,
dark theme with green success states, professional analytics interface,
no text
```

### Learning Hub
```
Educational learning hub with tutorial cards, video course thumbnails,
progress tracking indicators, achievement badges, warm educational theme,
dark background with yellow/orange highlights, friendly modern design,
no text
```

### Workflow Testing
```
Real-time AI workflow testing interface showing input/output panels,
debug console, test results visualization, modern IDE-style interface,
dark theme with syntax highlighting, professional developer tool UI,
no text
```

### Template Customization
```
Template customization interface showing editable workflow with
configuration panels, property editors, preview mode, modern UI with
side panels, dark theme with orange accents, professional design tool
interface, no text
```

## Fallback Strategy

The documentation is designed to gracefully handle missing images:

1. **First**: Try to load PNG image (AI-generated)
2. **Second**: Fall back to SVG placeholder (professional)
3. **Third**: Use simple SVG placeholder (legacy)

This ensures the site always has good visuals even if AI generation hasn't been run yet.

## Cost Estimation

Based on xAI Grok Imagine API pricing (February 2026):

- **Per Image**: ~$0.05-0.10
- **Total for 8 Images**: ~$0.40-0.80
- **Monthly Regeneration**: ~$0.40-0.80/month (if needed)

Check current pricing at: https://x.ai/api/pricing

## Troubleshooting

### Error: XAI_API_KEY not set

```bash
Error: XAI_API_KEY environment variable is not set
```

**Solution**: Add the API key to Cursor Dashboard > Cloud Agents > Secrets

### Error: API request failed with status 401

```bash
✗ API request failed with status 401
```

**Solution**: Verify your API key is correct and active at https://x.ai/api

### Error: API request failed with status 429

```bash
✗ API request failed with status 429
```

**Solution**: Rate limit reached. Wait a few minutes and try again. The script includes 2-second delays between requests to minimize this.

### Error: jq not found

```bash
Error: jq is required but not installed
```

**Solution**: Install jq:
```bash
sudo apt-get update && sudo apt-get install -y jq
```

## Best Practices

1. **Review Before Committing**: Always review generated images for quality
2. **Optimize File Sizes**: Compress images if they're larger than 500KB
3. **Backup Old Images**: Keep backups before regenerating
4. **Version Control**: Commit images to git for reproducibility
5. **Update Periodically**: Regenerate when features change significantly

## Testing After Generation

### Visual Check
Open each image and verify:
- Image loads correctly
- Colors match brand guidelines
- Content is professional and appropriate
- No unwanted text or watermarks
- Resolution is high quality

### Integration Check
Test in documentation:
```bash
# Start local development server
cd docs
pnpm dev

# Visit pages using the images:
# - Homepage with hero image
# - Features page with builder interface
# - Templates page with gallery
```

### File Size Check
```bash
# Check file sizes (should be 200-500KB each)
du -h docs/public/images/getdiyai-com/*.png

# Optimize if needed
for img in docs/public/images/getdiyai-com/*.png; do
  pngquant --quality=80-95 "$img" --output "$img.optimized"
  mv "$img.optimized" "$img"
done
```

## Maintenance Schedule

- **Immediate**: Generate initial images when API key is set up
- **Monthly**: Review images for relevance
- **Quarterly**: Consider regeneration if features change
- **Annually**: Update all images to reflect platform evolution

## Alternative: Manual Generation

If you prefer manual control, you can use the prompts directly at:
- https://x.ai/grok (web interface)
- https://api.x.ai (API directly)

Then save images manually to:
```
docs/public/images/getdiyai-com/
```

## Support

For issues:
- **Script Problems**: Check this documentation and error messages
- **API Issues**: Contact xAI support at https://x.ai/support
- **Image Quality**: Adjust prompts in the script and regenerate

## Related Documentation

- [Main Audit Report](/docs/getdiyai-com-audit-report.md)
- [Image Directory README](/docs/public/images/getdiyai-com/README.md)
- [General Image Generation Guide](/docs/IMAGE_GENERATION.md)
- [Audit Summary](/GETDIYAI_AUDIT_SUMMARY.md)

---

**Status**: Ready to generate once API key is configured
**Script**: `/workspace/docs/scripts/generate-getdiyai-images.sh`
**Documentation**: Complete ✅
