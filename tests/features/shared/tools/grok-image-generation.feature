@shared @tools @grok @images @priority:P2
Feature: Grok Imagine API Image Generation
  As a documentation site maintainer
  I want to generate professional images using the xAI Grok Imagine API
  So that each domain has unique, branded hero imagery

  Background:
    Given the xAI Grok Imagine API is accessible
    And the docs/public/images/ directory structure exists

  Scenario: XAI_API_KEY environment variable is configured
    When I check the environment configuration
    Then the XAI_API_KEY variable should be set
    And the API key should be valid for the xAI platform

  Scenario: Image generation script exists and is executable
    When I check the docs/scripts/ directory
    Then generate-images.sh should exist
    And the script should be executable
    And the script should check for XAI_API_KEY before running

  Scenario: Single image generation returns valid URL
    Given the XAI_API_KEY is valid
    When I send a text-to-image request to the Grok API
    Then the response should contain a valid image URL
    And the image URL should be downloadable
    And the downloaded image should be a valid PNG or JPEG

  Scenario: Generated images are saved to correct directory
    Given the generate-images.sh script is running
    When an image is generated for the "brightpath-ai" domain
    Then the image should be saved to docs/public/images/brightpath-ai/hero.png
    And the file should be a valid image

  Scenario: All 13 domains have generated images
    Given the generate-images.sh script has completed
    When I check each domain's image directory
    Then brightforest-io/hero.png should exist
    And brightforestx-com/hero.png should exist
    And brightpath-ai/hero.png should exist
    And pathx-ai/hero.png should exist
    And figmatofullstack-com/hero.png should exist
    And figmatofullstack-ai/hero.png should exist
    And mlninjas-com/hero.png should exist
    And clifforddalsoniii-com/hero.png should exist
    And getdiyai-com/hero.png should exist
    And getdiyrpa-com/hero.png should exist
    And appnowhq-com/hero.png should exist
    And brightforest-ai/hero.png should exist
    And iheartai-ai/hero.png should exist

  Scenario: Image generation handles API errors gracefully
    Given the Grok API returns an error for a request
    When the generate-images.sh script processes that domain
    Then the script should log the error
    And the script should continue with the next domain
    And the placeholder SVG should remain as fallback

  Scenario: Domain-specific prompts produce relevant images
    When images are generated with domain-specific prompts
    Then the brightpath-ai image should have AI/neural pathway theme
    And the mlninjas-com image should have ML/data science theme
    And the figmatofullstack-com image should have design-to-code theme
    And each image should have a dark background with accent colors
