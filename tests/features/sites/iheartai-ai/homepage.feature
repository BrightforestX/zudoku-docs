@site:iheartai-ai @priority:P1
Feature: iHeartAI.ai Homepage
  As a visitor to iHeartAI.ai
  I want to discover AI resources and tools
  So that I can explore my interest in AI

  Background:
    Given the user navigates to "https://iheartai.ai"
    And the target audience is AI enthusiasts and learners

  Scenario: Display community-focused welcome
    Given the homepage has loaded
    When the user views the content
    Then a welcoming message should greet visitors
    And the community aspect should be emphasized
    And latest highlights should be featured

  Scenario: Featured AI tools showcase
    Given popular AI tools are featured
    When the user browses featured tools
    Then tool cards should be visually appealing
    And brief descriptions should be provided
    And links to try or learn more should be available

  Scenario: Community engagement CTAs
    Given the site encourages participation
    When engagement options are displayed
    Then join community CTAs should be prominent
    And ways to contribute should be clear
    And social proof should be visible
