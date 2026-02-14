#!/bin/bash

# Generate Hero Image for AppNowHQ.com
# This script generates a professional hero image using the xAI Grok Imagine API

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}AppNowHQ.com Hero Image Generator${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}\n"

# Check for XAI_API_KEY environment variable
if [ -z "$XAI_API_KEY" ]; then
    echo -e "${YELLOW}Warning: XAI_API_KEY environment variable is not set${NC}"
    echo -e "${YELLOW}Please provide your xAI API key:${NC}"
    echo -e "  1. Get your API key from: ${BLUE}https://x.ai/api${NC}"
    echo -e "  2. Set it: ${BLUE}export XAI_API_KEY='your-api-key-here'${NC}"
    echo -e "  3. Or pass it as argument: ${BLUE}./generate-appnowhq-hero.sh YOUR_API_KEY${NC}\n"
    
    # Check if API key was passed as argument
    if [ -n "$1" ]; then
        XAI_API_KEY="$1"
        echo -e "${GREEN}Using API key from command line argument${NC}\n"
    else
        echo -e "${RED}Error: No API key provided${NC}"
        exit 1
    fi
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is required but not installed${NC}"
    echo "Please install jq:"
    echo "  - Ubuntu/Debian: sudo apt-get install jq"
    echo "  - macOS: brew install jq"
    exit 1
fi

# Configuration
API_ENDPOINT="https://api.x.ai/v1/images/generations"
MODEL="grok-2-image"
DOMAIN="appnowhq-com"
OUTPUT_DIR="docs/public/images/${DOMAIN}"
OUTPUT_FILE="${OUTPUT_DIR}/hero.png"

# Enhanced professional prompt
PROMPT="Professional app development platform illustration showing modular building blocks and app templates assembling into modern mobile and web applications, with deployment pipeline visualization, dark tech background, vibrant coral and teal accent colors, modern flat design style, clean composition"

echo -e "${BLUE}Configuration:${NC}"
echo -e "  Domain: ${DOMAIN}"
echo -e "  Output: ${OUTPUT_FILE}"
echo -e "  Model: ${MODEL}"
echo -e "  Size: 1024x1024"
echo -e "\n${BLUE}Prompt:${NC}"
echo -e "  ${PROMPT}\n"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Create JSON payload
echo -e "${YELLOW}Creating API request...${NC}"
JSON_PAYLOAD=$(jq -n \
    --arg model "$MODEL" \
    --arg prompt "$PROMPT" \
    '{
        model: $model,
        prompt: $prompt,
        n: 1,
        size: "1024x1024",
        response_format: "url"
    }')

# Call xAI API
echo -e "${YELLOW}Calling xAI Grok Imagine API...${NC}"
RESPONSE=$(curl -s -w "\n%{http_code}" \
    -X POST "$API_ENDPOINT" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $XAI_API_KEY" \
    -d "$JSON_PAYLOAD")

# Extract HTTP status code (last line)
HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
# Extract response body (everything except last line)
BODY=$(echo "$RESPONSE" | sed '$d')

# Check HTTP status
if [ "$HTTP_CODE" != "200" ]; then
    echo -e "${RED}✗ API request failed with status $HTTP_CODE${NC}"
    echo -e "${RED}Response:${NC}"
    echo "$BODY" | jq '.' 2>/dev/null || echo "$BODY"
    exit 1
fi

# Extract image URL from response
IMAGE_URL=$(echo "$BODY" | jq -r '.data[0].url // empty')

if [ -z "$IMAGE_URL" ] || [ "$IMAGE_URL" = "null" ]; then
    echo -e "${RED}✗ Failed to extract image URL from response${NC}"
    echo -e "${RED}Response:${NC}"
    echo "$BODY" | jq '.'
    exit 1
fi

echo -e "${GREEN}✓ Image generated successfully${NC}"
echo -e "${BLUE}Image URL: ${IMAGE_URL}${NC}\n"

# Download image
echo -e "${YELLOW}Downloading image...${NC}"
if curl -s -f "$IMAGE_URL" -o "$OUTPUT_FILE"; then
    FILE_SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)
    IMAGE_DIMS=$(file "$OUTPUT_FILE" 2>/dev/null | grep -o '[0-9]* x [0-9]*' || echo "unknown")
    echo -e "${GREEN}✓ Image downloaded successfully${NC}"
    echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}Hero Image Generated Successfully! 🎉${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
    echo -e "  File: ${OUTPUT_FILE}"
    echo -e "  Size: ${FILE_SIZE}"
    echo -e "  Dimensions: ${IMAGE_DIMS}"
    echo -e "\n${YELLOW}Next steps:${NC}"
    echo -e "  1. Review the generated image"
    echo -e "  2. Commit to git: git add ${OUTPUT_FILE}"
    echo -e "  3. The DomainHero component will automatically use it"
    echo ""
else
    echo -e "${RED}✗ Failed to download image from URL${NC}"
    exit 1
fi
