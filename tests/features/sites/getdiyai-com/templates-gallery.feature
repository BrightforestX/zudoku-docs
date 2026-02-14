@site:getdiyai-com @priority:P2
Feature: GetDIYAI.com Templates Gallery
  As a user
  I want pre-built AI templates
  So that I can start quickly with proven solutions

  Background:
    Given the user navigates to "https://getdiyai.com/templates"
    And templates are available

  Scenario: Browse template categories
    Given the templates gallery has loaded
    When the user browses templates
    Then templates should be organized by use case
    And each template should have a clear description
    And preview or demo should be available

  Scenario: Use template as starting point
    Given the user selects a template
    When the user chooses to use it
    Then the template should be copied to the user's workspace
    And the user should be able to customize it
    And original template should remain unchanged

  Scenario: Community-contributed templates
    Given community templates are available
    When the user views community templates
    Then ratings and reviews should be displayed
    And popular templates should be highlighted
    And users can contribute their own templates
