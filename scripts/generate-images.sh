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
    exit 1
fi

echo -e "${GREEN}Starting hero image generation for 13 documentation domains...${NC}\n"

# Define arrays for domain names and prompts
declare -A DOMAINS
DOMAINS=(
    ["brightforest-io"]="Minimal tech platform illustration with interconnected forest-themed nodes and data streams, dark background, green and teal accent colors, modern flat design"
    ["brightforestx-com"]="Enterprise cloud architecture diagram with multi-tenant layers, dark background, blue and purple gradients, professional tech illustration"
    ["brightpath-ai"]="Abstract neural network pathways forming a bright illuminated path through digital space, dark background, golden and cyan light trails"
    ["pathx-ai"]="Algorithm optimization visualization with flowcharts and performance graphs trending upward, dark background, orange and white accents"
    ["figmatofullstack-com"]="Design-to-code transformation showing Figma frame morphing into React components, dark background, pink and blue gradients"
    ["figmatofullstack-ai"]="AI-powered design assistant with floating UI elements and magic sparkles, dark background, purple and gold accents"
    ["mlninjas-com"]="Professional machine learning ninja warrior in dynamic stance, wielding a glowing red energy katana cutting through streams of flowing data and neural network patterns, surrounded by floating Python code snippets and matplotlib training graphs, dramatic cinematic lighting with red and silver accent colors, dark futuristic background with subtle grid patterns, modern tech illustration style, educational and empowering aesthetic, high detail, professional quality"
    ["clifforddalsoniii-com"]="Professional developer portfolio with floating code blocks and project cards, dark background, emerald and white accents"
    ["getdiyai-com"]="DIY AI workshop with tools, gears, and neural network building blocks, dark background, yellow and orange warm tones"
    ["getdiyrpa-com"]="Robotic process automation with connected workflow nodes and automation bots, dark background, blue and green accents"
    ["appnowhq-com"]="Rapid app development with building blocks assembling into mobile and web apps, dark background, coral and teal accents"
    ["brightforest-ai"]="MLOps pipeline visualization with model training, deployment, and monitoring stages, dark background, green and blue data flows"
    ["iheartai-ai"]="Heart-shaped circuit board with AI learning pathways, warm educational theme, dark background, red and pink with white light"
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
    echo -e "  Prompt: ${prompt:0:60}..."
    
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
    echo -e "\n${GREEN}All hero images generated successfully! 🎉${NC}"
fi
