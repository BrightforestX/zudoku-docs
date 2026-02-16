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
    echo "Please set your xAI API key in Cursor Dashboard:"
    echo "  1. Go to Cursor Dashboard > Cloud Agents > Secrets"
    echo "  2. Add secret: XAI_API_KEY"
    echo "  3. Set value to your xAI API key from https://x.ai/api"
    exit 1
fi

echo -e "${GREEN}Starting GetDIYAI.com image generation...${NC}\n"

# Define images for GetDIYAI.com
declare -A IMAGES
IMAGES=(
    ["hero"]="Professional DIY AI workshop illustration with floating AI building blocks, gears, neural network nodes, and toolkit icons, dark navy background with warm yellow and orange gradient accents, modern flat design, 3D isometric style, tech illustration, no text"
    ["builder-interface"]="Visual AI workflow builder interface showing drag-and-drop canvas with connected AI component nodes, data flow connections, modern UI design, dark theme with yellow/orange accents, clean professional look, dashboard screenshot style, no text"
    ["template-gallery"]="AI template marketplace grid showing diverse template cards with icons for chatbot, image processing, text analysis, and automation, organized layout, dark background, colorful category badges, professional UI design, no text"
    ["components-library"]="AI component palette showing modular blocks for text analysis, image processing, data transformation, and integrations, color-coded by type (blue=data, green=ML, orange=integration), modern component library UI, dark theme, no text"
    ["deployment-dashboard"]="Deployment status dashboard with workflow execution metrics, success indicators, API endpoint display, monitoring graphs, modern dashboard UI, dark theme with green success states, professional analytics interface, no text"
    ["learning-hub"]="Educational learning hub with tutorial cards, video course thumbnails, progress tracking indicators, achievement badges, warm educational theme, dark background with yellow/orange highlights, friendly modern design, no text"
    ["workflow-testing"]="Real-time AI workflow testing interface showing input/output panels, debug console, test results visualization, modern IDE-style interface, dark theme with syntax highlighting, professional developer tool UI, no text"
    ["template-customization"]="Template customization interface showing editable workflow with configuration panels, property editors, preview mode, modern UI with side panels, dark theme with orange accents, professional design tool interface, no text"
)

# API configuration
API_ENDPOINT="https://api.x.ai/v1/images/generations"
MODEL="grok-2-image"
OUTPUT_DIR="docs/public/images/getdiyai-com"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Counter for progress
TOTAL=${#IMAGES[@]}
CURRENT=0
SUCCESS_COUNT=0
FAILED_COUNT=0
declare -a FAILED_IMAGES

# Function to generate image
generate_image() {
    local name=$1
    local prompt=$2
    local output_file="${OUTPUT_DIR}/${name}.png"
    
    CURRENT=$((CURRENT + 1))
    
    echo -e "${BLUE}[$CURRENT/$TOTAL] Generating: ${name}${NC}"
    echo -e "  Prompt: ${prompt:0:80}..."
    
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
        FAILED_IMAGES+=("$name")
        return 1
    fi
    
    # Extract image URL from response
    local image_url=$(echo "$body" | jq -r '.data[0].url // empty')
    
    if [ -z "$image_url" ] || [ "$image_url" = "null" ]; then
        echo -e "  ${RED}✗ Failed to extract image URL from response${NC}"
        echo "  Response: $body"
        FAILED_COUNT=$((FAILED_COUNT + 1))
        FAILED_IMAGES+=("$name")
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
        FAILED_IMAGES+=("$name")
        return 1
    fi
}

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is required but not installed${NC}"
    echo "Installing jq..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get update && sudo apt-get install -y jq
    elif command -v brew &> /dev/null; then
        brew install jq
    else
        echo "Please install jq manually: https://stedolan.github.io/jq/download/"
        exit 1
    fi
fi

# Process each image
for name in "${!IMAGES[@]}"; do
    prompt="${IMAGES[$name]}"
    generate_image "$name" "$prompt"
    
    # Add a small delay between requests to avoid rate limiting
    if [ $CURRENT -lt $TOTAL ]; then
        sleep 2
    fi
done

# Summary
echo -e "\n${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}GetDIYAI.com Image Generation Complete!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "  Total images: ${TOTAL}"
echo -e "  ${GREEN}Successfully generated: ${SUCCESS_COUNT}${NC}"

if [ $FAILED_COUNT -gt 0 ]; then
    echo -e "  ${RED}Failed: ${FAILED_COUNT}${NC}"
    echo -e "\n${YELLOW}Failed images:${NC}"
    for failed_image in "${FAILED_IMAGES[@]}"; do
        echo -e "  - $failed_image"
    done
    exit 1
else
    echo -e "\n${GREEN}All GetDIYAI.com images generated successfully! 🎉${NC}"
    echo -e "\nGenerated images:"
    for name in "${!IMAGES[@]}"; do
        echo -e "  ✓ ${name}.png"
    done
fi
