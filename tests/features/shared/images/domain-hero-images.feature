@shared @images @hero @priority:P2
Feature: Domain Hero Images
  As a documentation site visitor
  I want visually appealing hero images on each domain's documentation
  So that each site has a professional and branded appearance

  Background:
    Given the documentation site is running
    And the images directory contains domain-specific subdirectories

  Scenario: Each domain has a hero image or placeholder
    When I check the images directory for each of the 13 domains
    Then brightforest-io should have a hero image or placeholder SVG
    And brightforestx-com should have a hero image or placeholder SVG
    And brightpath-ai should have a hero image or placeholder SVG
    And pathx-ai should have a hero image or placeholder SVG
    And figmatofullstack-com should have a hero image or placeholder SVG
    And figmatofullstack-ai should have a hero image or placeholder SVG
    And mlninjas-com should have a hero image or placeholder SVG
    And clifforddalsoniii-com should have a hero image or placeholder SVG
    And getdiyai-com should have a hero image or placeholder SVG
    And getdiyrpa-com should have a hero image or placeholder SVG
    And appnowhq-com should have a hero image or placeholder SVG
    And brightforest-ai should have a hero image or placeholder SVG
    And iheartai-ai should have a hero image or placeholder SVG

  Scenario: Hero images load without errors
    When I visit a page with a DomainHero component
    Then the hero image should load successfully
    And the image should not return a 404 error
    And the image should have appropriate alt text

  Scenario: Placeholder SVGs display domain name
    When I view a placeholder SVG for a domain
    Then the SVG should contain the domain name as text
    And the SVG should have a gradient background
    And the SVG dimensions should be 1200x630 pixels

  Scenario: Images are optimized for web
    When I check the size of hero images
    Then each image should be under 500KB
    And images should use an appropriate format (PNG, WebP, or SVG)

  Scenario: Grok Imagine API generated images replace placeholders
    Given the XAI_API_KEY environment variable is set
    When the generate-images.sh script is run
    Then each domain directory should contain a hero.png file
    And each hero.png should be a valid image file
    And the placeholder SVG should still exist as fallback
