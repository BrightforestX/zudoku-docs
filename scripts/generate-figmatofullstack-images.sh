#!/bin/bash

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check for XAI_API_KEY environment variable
if [ -z "$XAI_API_KEY" ]; then
    echo -e "${RED}Error: XAI_API_KEY environment variable is not set${NC}"
    echo "Please set your xAI API key: export XAI_API_KEY='your-api-key-here'"
    echo ""
    echo "To get an API key:"
    echo "1. Visit https://console.x.ai/"
    echo "2. Sign up or log in"
    echo "3. Navigate to API Keys section"
    echo "4. Create a new API key"
    echo "5. Export it: export XAI_API_KEY='your-key'"
    exit 1
fi

echo -e "${GREEN}Starting hero image generation for FigmaToFullstack domains...${NC}\n"

# Define arrays for domain names and prompts
declare -A DOMAINS
DOMAINS=(
    ["figmatofullstack-com"]="Professional design-to-code platform visualization: sleek Figma interface on left transitioning through a glowing transformation pipeline into clean React component code on right, modern software development aesthetic, dark navy background with teal and aqua accent lighting (teal to turquoise gradient effects), floating UI elements showing design frames morphing into code, component trees, minimalist tech illustration style, high-quality professional rendering, sharp details, modern and sophisticated"
    ["figmatofullstack-ai"]="AI-powered design assistant platform: central AI brain core with neural network pathways connecting to floating design elements (UI layouts, color palettes, accessibility icons, responsive layouts), intelligent enhancement visualization with AI processing indicators, modern tech aesthetic, dark background with vibrant pink and magenta accent lighting (deep pink to bright pink gradient effects), AI sparkles and enhancement glow effects, professional software illustration, clean composition with depth, futuristic and intelligent atmosphere"
)

# API configuration
API_ENDPOINT="https://api.x.ai/v1/images/generations"
MODEL="grok-2-image"

# Counter for progress
TOTAL=${#DOMAINS[@]}
CURRENT=0
SUCCESS_COUNT=0
FAILED_COUNT=0
declare -a FAILED_DOMAINS

# Function to generate image for a domain
generate_image() {
    local domain=$1
    local prompt=$2
    local output_dir="docs/public/images/${domain}"
    local output_file="${output_dir}/hero.png"
    
    CURRENT=$((CURRENT + 1))
    
    echo -e "${BLUE}[$CURRENT/$TOTAL] Processing: ${domain}${NC}"
    echo -e "  Prompt: ${prompt:0:80}..."
    
    # Create output directory if it doesn't exist
    mkdir -p "$output_dir"
    
    # Create JSON payload
    local json_payload=$(jq -n \
        --arg model "$MODEL" \
        --arg prompt "$prompt" \
        '{
            model: $model,
            prompt: $prompt,
            n: 1,
            size: "1024x1024",
            response_format: "url"
        }')
    
    # Call xAI API
    echo "  Calling xAI Grok Imagine API..."
    local response=$(curl -s -w "\n%{http_code}" \
        -X POST "$API_ENDPOINT" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $XAI_API_KEY" \
        -d "$json_payload")
    
    # Extract HTTP status code (last line)
    local http_code=$(echo "$response" | tail -n1)
    # Extract response body (everything except last line)
    local body=$(echo "$response" | sed '$d')
    
    # Check HTTP status
    if [ "$http_code" != "200" ]; then
        echo -e "  ${RED}✗ API request failed with status $http_code${NC}"
        echo "  Response: $body"
        FAILED_COUNT=$((FAILED_COUNT + 1))
        FAILED_DOMAINS+=("$domain")
        return 1
    fi
    
    # Extract image URL from response
    local image_url=$(echo "$body" | jq -r '.data[0].url // empty')
    
    if [ -z "$image_url" ] || [ "$image_url" = "null" ]; then
        echo -e "  ${RED}✗ Failed to extract image URL from response${NC}"
        echo "  Response: $body"
        FAILED_COUNT=$((FAILED_COUNT + 1))
        FAILED_DOMAINS+=("$domain")
        return 1
    fi
    
    # Download image
    echo "  Downloading image..."
    if curl -s -f "$image_url" -o "$output_file"; then
        local file_size=$(du -h "$output_file" | cut -f1)
        echo -e "  ${GREEN}✓ Successfully saved to: $output_file ($file_size)${NC}\n"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo -e "  ${RED}✗ Failed to download image from URL${NC}\n"
        FAILED_COUNT=$((FAILED_COUNT + 1))
        FAILED_DOMAINS+=("$domain")
        return 1
    fi
}

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is required but not installed${NC}"
    echo "Please install jq: sudo apt-get install jq (Debian/Ubuntu) or brew install jq (macOS)"
    exit 1
fi

# Process each domain
for domain in "${!DOMAINS[@]}"; do
    prompt="${DOMAINS[$domain]}"
    generate_image "$domain" "$prompt"
    
    # Add a small delay between requests to avoid rate limiting
    if [ $CURRENT -lt $TOTAL ]; then
        sleep 2
    fi
done

# Summary
echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Image Generation Complete!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "  Total domains: ${TOTAL}"
echo -e "  ${GREEN}Successfully generated: ${SUCCESS_COUNT}${NC}"

if [ $FAILED_COUNT -gt 0 ]; then
    echo -e "  ${RED}Failed: ${FAILED_COUNT}${NC}"
    echo -e "\n${YELLOW}Failed domains:${NC}"
    for failed_domain in "${FAILED_DOMAINS[@]}"; do
        echo -e "  - $failed_domain"
    done
    exit 1
else
    echo -e "\n${GREEN}All FigmaToFullstack hero images generated successfully! 🎉${NC}"
fi
