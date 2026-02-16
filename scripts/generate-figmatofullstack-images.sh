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
    echo "1. Visit https://x.ai/api"
    echo "2. Sign up or log in to your xAI account"
    echo "3. Generate an API key"
    echo "4. Run: export XAI_API_KEY='your-key-here'"
    echo ""
    echo -e "${YELLOW}Alternatively, add XAI_API_KEY to Cursor Dashboard > Cloud Agents > Secrets${NC}"
    exit 1
fi

echo -e "${GREEN}Generating hero images for figmatofullstack.ai and figmatofullstack.com...${NC}\n"

# Define arrays for domain names and enhanced professional prompts
declare -A DOMAINS
DOMAINS=(
    ["figmatofullstack-com"]="Professional cinematic visualization of design-to-code transformation: glowing Figma design frames with UI components (buttons, forms, navigation) in vibrant pink and blue on left, seamlessly morphing into clean React code with syntax highlighting on right. Center shows smooth flowing particles and light trails representing automated conversion. Dark navy gradient background (#0A1628 to #1A2332) with subtle grid pattern. Modern sleek professional tech aesthetic, isometric perspective, photorealistic rendering with soft ambient lighting and blue-pink accent glows, ultra HD quality"
    ["figmatofullstack-ai"]="Sophisticated AI-powered design assistant visualization: center shows sleek holographic interface displaying UI design with floating AI analysis nodes highlighting accessibility issues, spacing improvements, and layout optimizations. Ethereal purple and gold AI particles flow around design representing intelligent enhancement. Multiple device frames (desktop, tablet, mobile) show auto-generated responsive variations. Subtle neural network patterns in background suggesting machine learning. Dark elegant background (#0D0221 to #1A1034) with premium gold accents (#D4AF37) and vibrant purple highlights (#8B5CF6). Professional tech-luxury aesthetic, floating UI elements with glass morphism, soft volumetric lighting, futuristic but approachable, ultra HD quality"
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
echo -e "${GREEN}FigmaToFullstack Image Generation Complete!${NC}"
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
    echo -e "\n${GREEN}All figmatofullstack hero images generated successfully! 🎉${NC}"
    echo -e "\nGenerated images:"
    echo -e "  - docs/public/images/figmatofullstack-ai/hero.png"
    echo -e "  - docs/public/images/figmatofullstack-com/hero.png"
fi
