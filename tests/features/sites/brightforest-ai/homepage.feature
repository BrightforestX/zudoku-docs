@site:brightforest-ai @priority:P1
Feature: BrightForest.ai Homepage
  As a visitor to BrightForest.ai
  I want to understand the AI platform
  So that I can evaluate its capabilities

  Background:
    Given the user navigates to "https://brightforest.ai"
    And the target audience is AI solution seekers

  Scenario: Display AI platform overview
    Given the homepage has loaded
    When the user views the content
    Then the AI platform's purpose should be clear
    And key differentiators should be highlighted
    And primary use cases should be showcased

  Scenario: Interactive AI demo
    Given an interactive demo is available
    When the user tries the demo
    Then the AI capabilities should be demonstrated
    And the demo should be responsive
    And results should showcase the technology

  Scenario: Platform benefits presentation
    Given benefits are listed on the homepage
    When the user reviews benefits
    Then each benefit should be clearly explained
    And supporting evidence should be provided
    And CTAs should guide next steps
