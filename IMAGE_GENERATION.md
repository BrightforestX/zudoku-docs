# Hero Image Generation Guide

This guide explains how to generate hero images for all 13 documentation domains using the xAI Grok Imagine API.

## Overview

The `docs/scripts/generate-images.sh` script automates the generation of professional hero images for each documentation domain. Each domain gets a unique, branded hero image based on domain-specific prompts optimized for the xAI Grok 2 Image model.

## Documentation Domains

The script generates hero images for these 13 domains:

| Domain | Theme | Color Scheme |
|--------|-------|--------------|
| `brightforest-io` | Minimal tech platform with forest nodes | Green & Teal |
| `brightforestx-com` | Enterprise cloud architecture | Blue & Purple |
| `brightpath-ai` | Neural network pathways | Golden & Cyan |
| `pathx-ai` | Algorithm optimization | Orange & White |
| `figmatofullstack-com` | Design-to-code transformation | Pink & Blue |
| `figmatofullstack-ai` | AI-powered design assistant | Purple & Gold |
| `mlninjas-com` | Machine learning ninja | Red & Silver |
| `clifforddalsoniii-com` | Developer portfolio | Emerald & White |
| `getdiyai-com` | DIY AI workshop | Yellow & Orange |
| `getdiyrpa-com` | Robotic process automation | Blue & Green |
| `appnowhq-com` | Rapid app development | Coral & Teal |
| `brightforest-ai` | MLOps pipeline | Green & Blue |
| `iheartai-ai` | Heart-shaped circuit board | Red & Pink |

All images use dark backgrounds for consistency across the documentation suite.

## Prerequisites

### 1. xAI API Key

You need a valid xAI API key to use the Grok Imagine API.

1. Visit [https://x.ai/api](https://x.ai/api)
2. Sign up or log in to your xAI account
3. Generate an API key
4. Save the key securely

### 2. Required Tools

The script requires these command-line tools:

- **bash** (4.0+)
- **curl** (for API requests and downloads)
- **jq** (for JSON processing)

#### Installing jq

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install jq
```

**macOS:**
```bash
brew install jq
```

**Fedora/RHEL:**
```bash
sudo dnf install jq
```

## Quick Start

### 1. Set Your API Key

```bash
export XAI_API_KEY='your-xai-api-key-here'
```

To make this permanent, add it to your `~/.bashrc` or `~/.zshrc`:

```bash
echo 'export XAI_API_KEY="your-xai-api-key-here"' >> ~/.bashrc
source ~/.bashrc
```

### 2. Run the Script

From the repository root:

```bash
./docs/scripts/generate-images.sh
```

Or from the scripts directory:

```bash
cd docs/scripts
./generate-images.sh
```

### 3. Monitor Progress

The script provides real-time progress updates:

```
Starting hero image generation for 13 documentation domains...

[1/13] Processing: brightforest-io
  Prompt: Minimal tech platform illustration with interconnected...
  Calling xAI Grok Imagine API...
  Downloading image...
  ✓ Successfully saved to: docs/public/images/brightforest-io/hero.png (287K)

[2/13] Processing: brightpath-ai
  ...
```

## Output

### Directory Structure

Generated images are saved to:

```
docs/public/images/
├── brightforest-io/
│   └── hero.png
├── brightforestx-com/
│   └── hero.png
├── brightpath-ai/
│   └── hero.png
├── pathx-ai/
│   └── hero.png
├── figmatofullstack-com/
│   └── hero.png
├── figmatofullstack-ai/
│   └── hero.png
├── mlninjas-com/
│   └── hero.png
├── clifforddalsoniii-com/
│   └── hero.png
├── getdiyai-com/
│   └── hero.png
├── getdiyrpa-com/
│   └── hero.png
├── appnowhq-com/
│   └── hero.png
├── brightforest-ai/
│   └── hero.png
└── iheartai-ai/
    └── hero.png
```

### Image Specifications

- **Format:** PNG
- **Size:** 1024x1024 pixels
- **File Size:** ~200-500 KB per image
- **Total Size:** ~3-6 MB for all 13 images

## Execution Time

- **Per Domain:** 10-30 seconds (API generation + download)
- **Rate Limiting:** 2-second delay between requests
- **Total Time:** Approximately 5-10 minutes

## Error Handling

### Common Issues

#### Missing API Key

```
Error: XAI_API_KEY environment variable is not set
Please set your xAI API key: export XAI_API_KEY='your-api-key-here'
```

**Solution:** Set the environment variable as shown above.

#### Invalid API Key (401)

```
[1/13] Processing: brightforest-io
  ✗ API request failed with status 401
```

**Solution:** Verify your API key is correct and active.

#### Rate Limiting (429)

```
[3/13] Processing: brightpath-ai
  ✗ API request failed with status 429
```

**Solution:** Wait a few minutes and run the script again. The script includes a 2-second delay between requests to minimize rate limiting.

#### Network Issues

```
  ✗ Failed to download image from URL
```

**Solution:** Check your internet connection and try again.

### Partial Failures

If some domains fail, the script will:

1. Continue processing remaining domains
2. Report all failures at the end
3. Exit with code 1

Example output:

```
═══════════════════════════════════════════════════════
Image Generation Complete!
═══════════════════════════════════════════════════════
  Total domains: 13
  Successfully generated: 11
  Failed: 2

Failed domains:
  - pathx-ai
  - mlninjas-com
```

You can re-run the script to retry failed domains. Successfully generated images will be skipped (you can modify the script to add a skip check if desired).

## Customization

### Modifying Prompts

To customize the image prompts, edit `docs/scripts/generate-images.sh`:

```bash
DOMAINS=(
    ["your-domain"]="Your custom prompt description here"
    ...
)
```

Prompt best practices:
- Start with the main subject/concept
- Specify style (illustration, diagram, visualization)
- Include "dark background" for consistency
- Add 2-3 accent colors
- Keep under 200 characters
- Be specific but not overly detailed

### Changing Image Size

Edit the `size` parameter in the script:

```bash
local json_payload=$(jq -n \
    --arg model "$MODEL" \
    --arg prompt "$prompt" \
    '{
        model: $model,
        prompt: $prompt,
        n: 1,
        size: "1024x1024",  # Change this to "512x512", "1024x1024", etc.
        response_format: "url"
    }')
```

## Testing

### Run Cucumber Tests

The script includes Cucumber BDD tests:

```bash
cd docs
pnpm test -- --tags "@grok"
```

### Manual Validation

Check generated images:

```bash
# List all generated images
find docs/public/images -name "hero.png" -type f

# Check file sizes
du -h docs/public/images/*/hero.png

# Count images
find docs/public/images -name "hero.png" -type f | wc -l
```

Expected output: 13 images

## Integration with Documentation

The generated images are automatically used by the `DomainHero` component in the documentation site. No additional configuration is needed.

### Component Usage

```tsx
import { DomainHero } from '@/components/DomainHero';

<DomainHero domain="brightpath-ai" />
```

The component will automatically load:
1. The generated `hero.png` if it exists
2. A placeholder SVG if the image hasn't been generated yet

## Cost Estimation

xAI Grok Imagine API pricing (as of 2026):
- ~$0.05-0.10 per image generation
- **Total Cost:** $0.65-1.30 for all 13 domains

Check current pricing at: https://x.ai/api/pricing

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Generate Hero Images

on:
  workflow_dispatch:  # Manual trigger
  schedule:
    - cron: '0 0 1 * *'  # Monthly on 1st day

jobs:
  generate-images:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install dependencies
        run: sudo apt-get install -y jq
      
      - name: Generate images
        env:
          XAI_API_KEY: ${{ secrets.XAI_API_KEY }}
        run: ./docs/scripts/generate-images.sh
      
      - name: Commit images
        run: |
          git config user.name "GitHub Actions"
          git config user.email "actions@github.com"
          git add docs/public/images/
          git commit -m "Update hero images" || echo "No changes"
          git push
```

### Environment Variables in CI

Add `XAI_API_KEY` to your repository secrets:

1. Go to repository Settings
2. Navigate to Secrets and variables > Actions
3. Click "New repository secret"
4. Name: `XAI_API_KEY`
5. Value: Your xAI API key

## Best Practices

1. **Version Control:** Consider committing generated images to git for reproducibility
2. **Regeneration:** Regenerate images when:
   - Prompts are updated
   - New domains are added
   - Visual style changes are needed
3. **Backup:** Keep backups of generated images before regenerating
4. **Rate Limiting:** Don't run the script too frequently (respect API rate limits)
5. **Review:** Manually review generated images for quality before deploying

## Troubleshooting

### Script doesn't execute

```bash
# Make sure it's executable
chmod +x docs/scripts/generate-images.sh

# Check bash syntax
bash -n docs/scripts/generate-images.sh
```

### jq not found

```bash
# Verify jq installation
which jq
jq --version

# If not installed, install it (Ubuntu/Debian)
sudo apt-get install jq
```

### Permission denied on directory creation

```bash
# Check directory permissions
ls -la docs/public/

# Fix if needed
chmod 755 docs/public/
```

## Support

For issues with:
- **The script:** Open an issue in this repository
- **xAI API:** Contact xAI support at https://x.ai/support
- **Image quality:** Try adjusting prompts or regenerating

## License

This script is part of the Zudoku documentation project and is licensed under the same terms as the main project.
