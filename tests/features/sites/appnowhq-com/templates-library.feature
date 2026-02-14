@site:appnowhq-com @priority:P2
Feature: AppNowHQ.com Templates Library
  As a user
  I want access to app templates
  So that I can start with a solid foundation

  Background:
    Given the user navigates to "https://appnowhq.com/templates"
    And templates are available

  Scenario: Browse template categories
    Given the templates page has loaded
    When the user browses templates
    Then templates should be organized by app type
    And each template should have a preview
    And template complexity should be indicated

  Scenario: Preview template before use
    Given the user selects a template
    When the template preview loads
    Then a live demo should be available
    And included features should be listed
    And customization scope should be explained

  Scenario: Clone template to workspace
    Given the user decides to use a template
    When the user clones the template
    Then a copy should be created in their workspace
    And all template features should be included
    And the user can modify without affecting the original
