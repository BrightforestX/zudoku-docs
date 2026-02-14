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
    ["brightforest-io"]="Elegant minimalist tech platform visualization featuring interconnected forest-themed nodes representing a distributed ecosystem. Organic tree structures merged with digital network topology, flowing data streams between nodes, and layered architecture. Modern clean illustration with vibrant green and teal color palette, subtle gradients, and geometric patterns. Dark charcoal background with luminous connections. Professional design suitable for modern SaaS platforms."
    ["brightforestx-com"]="Professional enterprise cloud infrastructure visualization featuring multi-tenant architecture layers with secure data isolation, distributed microservices, and high-availability clusters. Modern isometric tech illustration with sophisticated blue and purple color palette, glowing connections between nodes, security shields, and performance monitoring dashboards. Dark navy background with luminous accents. Corporate professional style suitable for Fortune 500 presentations."
    ["brightpath-ai"]="Sophisticated neural network visualization depicting illuminated pathways through complex AI architecture. Abstract representation of data flowing through deep learning layers, with bright golden neural connections forming an optimized path through a dark digital landscape. Cyan and golden light trails showing model inference, gradient descent visualization, and decision boundaries. Modern tech art style with depth and dimension. Dark background with radiant energy flows."
    ["pathx-ai"]="Advanced algorithm optimization dashboard featuring dynamic flowcharts, performance metrics, and efficiency graphs showing upward trends. Computational complexity visualizations with Big-O notation, parallel processing pipelines, and optimization curves. Clean technical illustration with vibrant orange primary color and crisp white accents for data points and metrics. Dark background emphasizing data visualization clarity. Professional computer science aesthetic."
    ["figmatofullstack-com"]="Stunning design-to-code transformation visualization showing Figma design frames seamlessly morphing into live React component code. Vector design elements transitioning into JSX syntax, with component trees, props flowing between layers, and responsive breakpoints. Modern gradient design with pink-to-blue spectrum, floating design tokens, and code syntax highlighting. Dark background with vibrant UI elements. Professional design-developer workflow aesthetic."
    ["figmatofullstack-ai"]="Intelligent AI design assistant interface with autonomous UI elements, smart layout suggestions, and generative design components floating in 3D space. Machine learning models predicting user needs, component recommendations, and accessibility improvements shown as magical sparkles and glowing insights. Rich purple and gold color palette with premium metallic accents. Dark background with ethereal lighting. Cutting-edge AI-powered design tool aesthetic."
    ["mlninjas-com"]="Dynamic machine learning ninja warrior in action pose, wielding an illuminated data katana blade slicing through layers of structured datasets and neural networks. Japanese-inspired technical art style with data visualization elements, confusion matrices shattering, and model accuracy scores floating around. Bold red and metallic silver color scheme with energy effects. Dark background with dramatic lighting. Professional yet playful ML education aesthetic."
    ["getdiyai-com"]="Welcoming DIY AI workshop environment with accessible tools, building blocks, and hands-on learning elements. Neural network construction kits, pre-trained model libraries on shelves, tutorial notebooks, and friendly robotic assistants helping learners. Warm and inviting illustration with bright yellow and orange color palette suggesting creativity and innovation. Dark background with warm lighting creating an approachable atmosphere. Educational and empowering aesthetic."
    ["getdiyrpa-com"]="Enterprise robotic process automation visualization featuring interconnected workflow automation nodes, intelligent bots performing tasks, and business process flowcharts being optimized. Software robots handling repetitive tasks across applications, data validation checkpoints, and integration endpoints. Professional automation diagram with blue and green technology colors, conveying reliability and efficiency. Dark background with glowing automation pathways. Corporate digital transformation aesthetic."
    ["appnowhq-com"]="Rapid application development platform showing modular building blocks dynamically assembling into complete mobile and web applications. Low-code/no-code interface elements, drag-and-drop components, API connectors, and instant deployment pipelines. Modern tech illustration with vibrant coral primary color and refreshing teal accents. Dark background emphasizing the speed and agility of the platform. Contemporary app builder aesthetic with energy and momentum."
    ["brightforest-ai"]="Comprehensive MLOps pipeline infrastructure showing the complete machine learning lifecycle from data ingestion to model serving. Feature engineering stages, distributed model training across GPU clusters, automated testing gates, containerized deployment, real-time monitoring dashboards, and feedback loops. Professional technical diagram with green data flows and blue infrastructure layers. Dark background with glowing pipeline stages. Enterprise AI operations aesthetic."
    ["clifforddalsoniii-com"]="Polished professional developer portfolio showcase featuring elegant code editor windows with syntax-highlighted projects, interactive project cards with live previews, technical skill graphs, and GitHub contribution visualizations. Modern developer aesthetic with emerald green as primary accent color and clean white elements for contrast. Dark sophisticated background. Portfolio design that balances technical credibility with visual appeal. Clean and minimal professional aesthetic."
    ["iheartai-ai"]="Welcoming heart-shaped circuit board design symbolizing passion for artificial intelligence and machine learning education. Warm electronic pathways forming neural network patterns within the heart shape, friendly AI learning nodes, and educational content flowing through circuits. Approachable and warm illustration with vibrant red and soft pink gradients, white accent lights at connection points. Dark background creating contrast. Warm educational technology aesthetic that feels inclusive and inspiring."
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
