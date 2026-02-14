# Quick Start: Generate Hero Images

## TL;DR

```bash
# 1. Set your API key
export XAI_API_KEY='your-xai-api-key-here'

# 2. Run the script
./docs/scripts/generate-images.sh

# 3. Wait ~5-10 minutes for all 13 images to generate
```

## What This Does

Generates professional hero images for 13 documentation domains using xAI Grok Imagine API:

- ✅ brightforest-io
- ✅ brightforestx-com
- ✅ brightpath-ai
- ✅ pathx-ai
- ✅ figmatofullstack-com
- ✅ figmatofullstack-ai
- ✅ mlninjas-com
- ✅ clifforddalsoniii-com
- ✅ getdiyai-com
- ✅ getdiyrpa-com
- ✅ appnowhq-com
- ✅ brightforest-ai
- ✅ iheartai-ai

## Prerequisites

1. **xAI API Key** - Get one at https://x.ai/api
2. **jq** - Install with `sudo apt-get install jq` or `brew install jq`

## Output

Images saved to: `docs/public/images/{domain}/hero.png`

Example:
```
docs/public/images/
├── brightforest-io/hero.png
├── brightpath-ai/hero.png
├── ...
└── iheartai-ai/hero.png
```

## Cost

~$0.65-1.30 total for all 13 images (~$0.05-0.10 per image)

## More Info

- **Full Guide:** See `../IMAGE_GENERATION.md`
- **README:** See `./README.md`
- **Implementation Details:** See `/HERO_IMAGES_IMPLEMENTATION.md`

## Troubleshooting

**Error: XAI_API_KEY not set**
```bash
export XAI_API_KEY='your-key'
```

**Error: jq not found**
```bash
sudo apt-get install jq  # Ubuntu/Debian
brew install jq          # macOS
```

**API Error 401**
- Check your API key is valid

**API Error 429**
- Rate limited, wait and retry
