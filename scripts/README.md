# Hero Image Generation Script

This directory contains the `generate-images.sh` script for generating hero images for all 13 documentation domains using the xAI Grok Imagine API.

## Prerequisites

- **xAI API Key**: You must have a valid xAI API key
- **jq**: JSON processor (install with `sudo apt-get install jq` on Ubuntu/Debian or `brew install jq` on macOS)
- **curl**: Command-line tool for transferring data (usually pre-installed)

## Usage

1. Set your xAI API key as an environment variable:

```bash
export XAI_API_KEY='your-api-key-here'
```

2. Run the script from the repository root:

```bash
./docs/scripts/generate-images.sh
```

Or from the scripts directory:

```bash
cd docs/scripts
./generate-images.sh
```

## What It Does

The script generates hero images for the following 13 documentation domains:

1. **brightforest-io** - Minimal tech platform illustration
2. **brightforestx-com** - Enterprise cloud architecture
3. **brightpath-ai** - Neural network pathways
4. **pathx-ai** - Algorithm optimization visualization
5. **figmatofullstack-com** - Design-to-code transformation
6. **figmatofullstack-ai** - AI-powered design assistant
7. **mlninjas-com** - Machine learning ninja
8. **clifforddalsoniii-com** - Professional developer portfolio
9. **getdiyai-com** - DIY AI workshop
10. **getdiyrpa-com** - Robotic process automation
11. **appnowhq-com** - Rapid app development
12. **brightforest-ai** - MLOps pipeline visualization
13. **iheartai-ai** - Heart-shaped circuit board

## Output

Each generated image is saved to:

```
docs/public/images/{domain-name}/hero.png
```

For example:
- `docs/public/images/brightforest-io/hero.png`
- `docs/public/images/brightpath-ai/hero.png`
- etc.

## Features

- ✅ Environment variable validation
- ✅ Comprehensive error handling
- ✅ Progress tracking with colored output
- ✅ API rate limiting protection (2-second delay between requests)
- ✅ Automatic directory creation
- ✅ Success/failure summary
- ✅ File size reporting

## API Details

- **Endpoint**: `https://api.x.ai/v1/images/generations`
- **Model**: `grok-2-image`
- **Image Size**: 1024x1024
- **Format**: PNG

## Error Handling

The script will:
- Exit immediately if `XAI_API_KEY` is not set
- Report API failures with HTTP status codes
- Track and report failed domains at the end
- Return exit code 1 if any domain fails

## Troubleshooting

### "XAI_API_KEY environment variable is not set"

Set your API key:

```bash
export XAI_API_KEY='your-api-key-here'
```

### "jq is required but not installed"

Install jq:

```bash
# Ubuntu/Debian
sudo apt-get install jq

# macOS
brew install jq
```

### API request failed with status 401

Your API key is invalid or expired. Check your xAI account and generate a new key if needed.

### API request failed with status 429

You've hit the rate limit. Wait a few minutes and try again.

## Notes

- Each image generation may take 10-30 seconds
- The script includes a 2-second delay between requests
- Total execution time: approximately 5-10 minutes for all 13 domains
- Generated images are approximately 200-500 KB each
