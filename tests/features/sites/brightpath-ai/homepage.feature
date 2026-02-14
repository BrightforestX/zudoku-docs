@site:brightpath-ai @priority:P1
Feature: BrightPath.ai Homepage
  As a visitor to BrightPath.ai
  I want to understand the AI solutions offered
  So that I can determine if they meet my needs

  Background:
    Given the user navigates to "https://brightpath.ai"
    And the target audience is AI/ML practitioners

  Scenario: Display AI solution overview
    Given the homepage has loaded
    When the user views the main content
    Then AI capabilities should be clearly described
    And use cases should be highlighted
    And technology differentiators should be evident

  Scenario: Interactive demos or examples
    Given the homepage features product demonstrations
    When the user explores demos
    Then interactive examples should be functional
    And demo controls should be intuitive
    And results should be displayed clearly

  Scenario: Technical documentation access
    Given developers need technical information
    When the user looks for documentation
    Then links to API docs should be prominent
    And getting started guides should be accessible
    And code examples should be available
