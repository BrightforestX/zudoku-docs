@site:getdiyai-com @priority:P1
Feature: GetDIYAI.com Homepage
  As a visitor to GetDIYAI.com
  I want to understand the DIY AI platform
  So that I can determine if it helps me build AI solutions

  Background:
    Given the user navigates to "https://getdiyai.com"
    And the target audience is DIY enthusiasts and small businesses

  Scenario: Display platform value proposition
    Given the homepage has loaded
    When the user views the content
    Then the DIY approach to AI should be clearly explained
    And no-code/low-code benefits should be highlighted
    And target use cases should be shown

  Scenario: Quick start demonstration
    Given new users need to understand ease of use
    When demo or walkthrough is displayed
    Then the simplicity of the platform should be evident
    And time to first AI solution should be emphasized
    And success stories should inspire confidence

  Scenario: Platform capabilities overview
    Given the user wants to know what's possible
    When capabilities are presented
    Then supported AI types should be listed
    And integration options should be shown
    And limitations should be transparent
