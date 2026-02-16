#!/bin/bash

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     ML Ninjas Hero Image Generator (Grok Imagine API)     ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check for XAI_API_KEY environment variable
if [ -z "$XAI_API_KEY" ]; then
    echo -e "${RED}Error: XAI_API_KEY environment variable is not set${NC}"
    echo ""
    echo "To generate the hero image, you need an xAI API key:"
    echo ""
    echo "1. Get your API key from: https://x.ai/api"
    echo "2. Set the environment variable:"
    echo "   ${GREEN}export XAI_API_KEY='your-xai-api-key-here'${NC}"
    echo "3. Run this script again:"
    echo "   ${GREEN}./docs/scripts/generate-mlninjas-image.sh${NC}"
    echo ""
    echo "For Cloud Agents (Cursor):"
    echo "  Add XAI_API_KEY to Cloud Agents > Secrets in the Cursor Dashboard"
    echo ""
    exit 1
fi

# Check for jq
if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is not installed${NC}"
    echo "Please install jq: sudo apt-get install jq"
    exit 1
fi

# Configuration
API_ENDPOINT="https://api.x.ai/v1/images/generations"
MODEL="grok-2-image"
DOMAIN="mlninjas-com"
OUTPUT_DIR="docs/public/images/${DOMAIN}"
OUTPUT_FILE="${OUTPUT_DIR}/hero.png"

# Enhanced professional prompt
PROMPT="Professional machine learning ninja warrior in dynamic stance, wielding a glowing red energy katana cutting through streams of flowing data and neural network patterns, surrounded by floating Python code snippets and matplotlib training graphs, dramatic cinematic lighting with red and silver accent colors, dark futuristic background with subtle grid patterns, modern tech illustration style, educational and empowering aesthetic, high detail, professional quality"

echo -e "${GREEN}Configuration:${NC}"
echo "  Domain: ${DOMAIN}"
echo "  Output: ${OUTPUT_FILE}"
echo "  Model: ${MODEL}"
echo "  Size: 1024x1024"
echo ""
echo -e "${BLUE}Prompt:${NC}"
echo "  ${PROMPT:0:80}..."
echo ""

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Check if hero.png already exists
if [ -f "$OUTPUT_FILE" ]; then
    echo -e "${YELLOW}Warning: ${OUTPUT_FILE} already exists${NC}"
    read -p "Overwrite existing image? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted. Existing image preserved."
        exit 0
    fi
fi

# Create JSON payload
echo -e "${BLUE}Creating API request...${NC}"
json_payload=$(jq -n \
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
echo -e "${BLUE}Calling xAI Grok Imagine API...${NC}"
response=$(curl -s -w "\n%{http_code}" \
    -X POST "$API_ENDPOINT" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $XAI_API_KEY" \
    -d "$json_payload")

# Extract HTTP status code (last line)
http_code=$(echo "$response" | tail -n1)
# Extract response body (everything except last line)
body=$(echo "$response" | sed '$d')

# Check HTTP status
if [ "$http_code" != "200" ]; then
    echo -e "${RED}✗ API request failed with status $http_code${NC}"
    echo ""
    echo -e "${YELLOW}Response:${NC}"
    echo "$body" | jq '.' 2>/dev/null || echo "$body"
    echo ""
    
    # Provide helpful error messages
    case $http_code in
        401)
            echo -e "${RED}Authentication failed. Please check your XAI_API_KEY.${NC}"
            ;;
        429)
            echo -e "${RED}Rate limit exceeded. Please wait and try again.${NC}"
            ;;
        500|502|503)
            echo -e "${RED}API server error. Please try again later.${NC}"
            ;;
        *)
            echo -e "${RED}Unexpected error. Please check the response above.${NC}"
            ;;
    esac
    
    exit 1
fi

echo -e "${GREEN}✓ API request successful${NC}"

# Extract image URL from response
image_url=$(echo "$body" | jq -r '.data[0].url // empty')

if [ -z "$image_url" ]; then
    echo -e "${RED}✗ Failed to extract image URL from response${NC}"
    echo "Response: $body"
    exit 1
fi

echo -e "${BLUE}Image URL: ${NC}${image_url}"
echo ""

# Download image
echo -e "${BLUE}Downloading image...${NC}"
if curl -sL "$image_url" -o "$OUTPUT_FILE"; then
    # Get file size
    file_size=$(du -h "$OUTPUT_FILE" | cut -f1)
    
    # Verify the file is a valid image
    if file "$OUTPUT_FILE" | grep -q "PNG image"; then
        echo -e "${GREEN}✓ Successfully downloaded image${NC}"
        echo ""
        echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
        echo -e "${GREEN}║                    Generation Complete!                    ║${NC}"
        echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
        echo ""
        echo -e "${GREEN}Output:${NC} ${OUTPUT_FILE}"
        echo -e "${GREEN}Size:${NC} ${file_size}"
        echo ""
        echo -e "${BLUE}Next steps:${NC}"
        echo "  1. Review the generated image"
        echo "  2. Test in the DomainHero component"
        echo "  3. Optimize if file size > 500KB"
        echo "  4. Commit to repository:"
        echo "     ${GREEN}git add ${OUTPUT_FILE}${NC}"
        echo "     ${GREEN}git commit -m \"Add ML Ninjas hero image\"${NC}"
        echo "     ${GREEN}git push${NC}"
        echo ""
        
        # Show image info
        if command -v identify &> /dev/null; then
            echo -e "${BLUE}Image details:${NC}"
            identify -format "  Dimensions: %wx%h\n  Format: %m\n  File size: %b bytes\n" "$OUTPUT_FILE"
            echo ""
        fi
    else
        echo -e "${RED}✗ Downloaded file is not a valid PNG image${NC}"
        rm -f "$OUTPUT_FILE"
        exit 1
    fi
else
    echo -e "${RED}✗ Failed to download image from URL${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Image generation complete!${NC}"
echo ""
