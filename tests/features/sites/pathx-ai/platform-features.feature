@site:pathx-ai @priority:P1
Feature: PathX.ai Platform Features
  As a user
  I want to explore platform features
  So that I can understand capabilities before signing up

  Background:
    Given the user navigates to "https://pathx.ai/features"
    And feature pages are available

  Scenario: Browse feature categories
    Given the features page has loaded
    When the user explores features
    Then features should be organized by category
    And each category should have descriptive content
    And visual examples should illustrate functionality

  Scenario: Feature comparison with competitors
    Given competitive analysis is available
    When the user wants to compare solutions
    Then a comparison table should be accessible
    And key differentiators should be highlighted
    And comparison should be fair and accurate

  Scenario: Feature availability by plan
    Given different pricing tiers exist
    When the user checks feature availability
    Then features should indicate which plans include them
    And upgrade prompts should be clear
    And plan comparison should be easy
