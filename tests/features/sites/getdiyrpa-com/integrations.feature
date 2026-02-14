@site:getdiyrpa-com @priority:P2
Feature: GetDIYRPA.com Integrations
  As a user
  I want to integrate with various applications
  So that I can automate across different tools

  Background:
    Given the user navigates to "https://getdiyrpa.com/integrations"
    And integration capabilities are documented

  Scenario: Browse available integrations
    Given the integrations page has loaded
    When the user views available integrations
    Then popular integrations should be highlighted
    And integrations should be categorized
    And setup difficulty should be indicated

  Scenario: Connect new integration
    Given the user wants to add an integration
    When the user selects an integration to connect
    Then authentication flow should be clear
    And permissions requested should be explained
    And connection status should be confirmed

  Scenario: Manage existing integrations
    Given the user has active integrations
    When the user views their integrations
    Then all connected integrations should be listed
    And connection health should be indicated
    And integrations can be disconnected or reconfigured
