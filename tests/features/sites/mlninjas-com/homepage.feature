@site:mlninjas-com @priority:P1
Feature: MLNinjas.com Homepage
  As a visitor to MLNinjas.com
  I want to understand the ML consulting services
  So that I can determine if they match my needs

  Background:
    Given the user navigates to "https://mlninjas.com"
    And the target audience is companies seeking ML expertise

  Scenario: Display consulting services overview
    Given the homepage has loaded
    When the user views the content
    Then ML consulting services should be clearly described
    And areas of expertise should be highlighted
    And success stories should be featured

  Scenario: Team expertise showcase
    Given the team section is on the homepage
    When the user views team information
    Then team members' credentials should be displayed
    And relevant experience should be highlighted
    And expertise areas should be clear

  Scenario: Client testimonials and case studies
    Given client testimonials are featured
    When the user reads testimonials
    Then testimonials should include client names and roles
    And specific outcomes should be mentioned
    And links to full case studies should be available
