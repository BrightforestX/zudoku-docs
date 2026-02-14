# AppNowHQ.com Hero Image Generation Instructions

## Overview

This document provides step-by-step instructions for generating the professional hero image for appnowhq.com using the xAI Grok Imagine API.

## Current Status

✅ **Completed:**
- Professional SVG hero image created (`hero.svg`)
- Enhanced image generation script with improved prompt
- Dedicated generation script for appnowhq.com
- Color scheme standardized to Coral & Teal

⏳ **Pending:**
- PNG hero image generation via Grok Imagine API (requires XAI_API_KEY)

## Quick Start

### Option 1: Use the Dedicated Script (Recommended)

```bash
# Set your API key
export XAI_API_KEY='your-xai-api-key-here'

# Run the dedicated script
./docs/scripts/generate-appnowhq-hero.sh
```

### Option 2: Use the Main Generation Script (All Domains)

```bash
# Set your API key
export XAI_API_KEY='your-xai-api-key-here'

# Generate all hero images (includes appnowhq.com)
./docs/scripts/generate-images.sh
```

### Option 3: Manual API Call

If you prefer to call the API manually:

```bash
curl -X POST https://api.x.ai/v1/images/generations \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $XAI_API_KEY" \
  -d '{
    "model": "grok-2-image",
    "prompt": "Professional app development platform illustration showing modular building blocks and app templates assembling into modern mobile and web applications, with deployment pipeline visualization, dark tech background, vibrant coral and teal accent colors, modern flat design style, clean composition",
    "n": 1,
    "size": "1024x1024",
    "response_format": "url"
  }'
```

Then download the image from the returned URL:

```bash
# Replace <IMAGE_URL> with the URL from the API response
curl -o docs/public/images/appnowhq-com/hero.png <IMAGE_URL>
```

## Getting Your xAI API Key

1. Visit [https://x.ai/api](https://x.ai/api)
2. Sign up or log in to your xAI account
3. Navigate to API Keys section
4. Generate a new API key
5. Copy the key securely

## Prompt Details

The enhanced prompt used for appnowhq.com is optimized for the Grok 2 Image model:

**Prompt:**
```
Professional app development platform illustration showing modular building blocks 
and app templates assembling into modern mobile and web applications, with 
deployment pipeline visualization, dark tech background, vibrant coral and teal 
accent colors, modern flat design style, clean composition
```

**Key Elements:**
- **Subject**: App development platform with modular components
- **Visual Elements**: Building blocks, templates, mobile/web apps, deployment pipeline
- **Style**: Modern flat design, professional illustration
- **Colors**: Coral (#FF6B6B, #FF8E53) and Teal (#26C6DA)
- **Background**: Dark tech background
- **Composition**: Clean and organized

## Image Specifications

- **Format**: PNG
- **Size**: 1024x1024 pixels
- **Color Scheme**: Coral and Teal on dark background
- **Target File Size**: < 500KB
- **Output Path**: `docs/public/images/appnowhq-com/hero.png`

## Fallback Strategy

The DomainHero component uses the following fallback strategy:

1. **First**: Try to load `hero.png` (AI-generated)
2. **Second**: Fall back to `placeholder.svg` (gradient with text)
3. **Third**: Try to load `hero.svg` (professional illustrated SVG)

Currently available:
- ✅ `placeholder.svg` - Updated with Coral & Teal gradient
- ✅ `hero.svg` - Professional illustrated hero image (NEW)
- ⏳ `hero.png` - To be generated via Grok API

## Cost Estimation

xAI Grok Imagine API pricing (February 2026):
- ~$0.05-0.10 per image generation
- **Single image cost**: < $0.10
- **Total for all 13 domains**: $0.65-1.30

Current pricing: [https://x.ai/api/pricing](https://x.ai/api/pricing)

## Verification

After generating the image, verify it:

```bash
# Check if image exists
ls -lh docs/public/images/appnowhq-com/hero.png

# Check file size (should be < 500KB)
du -h docs/public/images/appnowhq-com/hero.png

# Check image dimensions (should be 1024x1024)
file docs/public/images/appnowhq-com/hero.png
```

## Using in Documentation

No code changes needed! The DomainHero component will automatically use `hero.png` once generated:

```mdx
import { DomainHero } from "@/components/DomainHero";

<DomainHero
  domain="appnowhq-com"
  title="appnowhq.com"
  description="Rapid application development platform"
/>
```

## Troubleshooting

### API Key Issues

**Error: "XAI_API_KEY environment variable is not set"**
```bash
# Solution: Set the environment variable
export XAI_API_KEY='your-api-key-here'

# Or pass as argument to the dedicated script
./docs/scripts/generate-appnowhq-hero.sh YOUR_API_KEY
```

**Error: 401 Unauthorized**
- Verify your API key is correct
- Check if the key has expired
- Ensure the key has image generation permissions

**Error: 429 Rate Limited**
- Wait a few minutes and try again
- The script includes 2-second delays to prevent rate limiting
- Check your API usage limits

### Image Quality Issues

If the generated image doesn't meet expectations:

1. **Regenerate**: Run the script again (Grok generates different variations)
2. **Adjust prompt**: Modify the prompt in `generate-images.sh` or `generate-appnowhq-hero.sh`
3. **Use SVG**: The `hero.svg` file is a high-quality alternative

### File Size Issues

If generated PNG is too large (> 500KB):

```bash
# Optimize with pngquant (if available)
pngquant --quality=80-95 --force docs/public/images/appnowhq-com/hero.png

# Or optimize with ImageMagick (if available)
convert docs/public/images/appnowhq-com/hero.png -quality 85 docs/public/images/appnowhq-com/hero-optimized.png
mv docs/public/images/appnowhq-com/hero-optimized.png docs/public/images/appnowhq-com/hero.png
```

## Alternative: Use the SVG Hero

If you prefer not to use the Grok API or want an immediate solution:

The `hero.svg` file is a professionally designed SVG that includes:
- Coral and Teal color scheme
- App templates and building blocks
- Mobile and web app visualizations
- Deployment pipeline illustration
- Clean, modern design

To use the SVG as the primary hero image, simply rename it:

```bash
# Option 1: Use SVG directly (keep both)
# No action needed - DomainHero component will fall back to SVG if PNG is missing

# Option 2: Convert SVG to PNG (requires conversion tool)
# Install conversion tool first, then:
rsvg-convert -w 1024 -h 1024 docs/public/images/appnowhq-com/hero.svg > docs/public/images/appnowhq-com/hero.png
```

## CI/CD Integration

To automate image generation in GitHub Actions:

```yaml
name: Generate Hero Images

on:
  workflow_dispatch:
  schedule:
    - cron: '0 0 1 * *'  # Monthly

jobs:
  generate-images:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install jq
        run: sudo apt-get install -y jq
      
      - name: Generate appnowhq.com hero image
        env:
          XAI_API_KEY: ${{ secrets.XAI_API_KEY }}
        run: ./docs/scripts/generate-appnowhq-hero.sh
      
      - name: Commit and push
        run: |
          git config user.name "GitHub Actions"
          git config user.email "actions@github.com"
          git add docs/public/images/appnowhq-com/hero.png
          git commit -m "Update appnowhq.com hero image" || echo "No changes"
          git push
```

Add `XAI_API_KEY` to repository secrets:
1. Go to Settings > Secrets and variables > Actions
2. Click "New repository secret"
3. Name: `XAI_API_KEY`
4. Value: Your xAI API key

## Next Steps

1. **Get API Key**: Sign up at [https://x.ai/api](https://x.ai/api)
2. **Generate Image**: Run `./docs/scripts/generate-appnowhq-hero.sh YOUR_API_KEY`
3. **Verify Quality**: Review the generated image
4. **Commit**: Add to git and push to repository
5. **Deploy**: Image will automatically be used in production

## Support

- **xAI API Documentation**: [https://x.ai/api/docs](https://x.ai/api/docs)
- **xAI Support**: [https://x.ai/support](https://x.ai/support)
- **Repository Issues**: Open an issue in this repository

---

**Last Updated**: February 14, 2026  
**Status**: Ready for image generation with xAI API key
