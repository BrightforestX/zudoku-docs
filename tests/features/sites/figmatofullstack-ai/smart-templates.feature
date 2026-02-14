@site:figmatofullstack-ai @priority:P2
Feature: FigmaToFullstack.ai Smart Templates
  As a user
  I want AI-powered smart templates
  So that I can start with intelligent design patterns

  Background:
    Given the user navigates to "https://figmatofullstack.ai/templates"
    And smart templates are available

  Scenario: Browse AI-generated templates
    Given the templates page has loaded
    When the user browses templates
    Then AI-generated templates should be displayed
    And templates should be categorized by use case
    And preview images should be shown

  Scenario: Customize template with AI
    Given the user selects a template
    When the user wants to customize it
    Then AI-assisted customization should be available
    And the AI should suggest relevant modifications
    And customizations should maintain design consistency

  Scenario: Generate custom template from description
    Given the user describes their needs
    When the AI processes the description
    Then a custom template should be generated
    And the template should match the requirements
    And further refinements should be possible
