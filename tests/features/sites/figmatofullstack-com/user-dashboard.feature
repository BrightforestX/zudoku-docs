@site:figmatofullstack-com @priority:P2
Feature: FigmaToFullstack.com User Dashboard
  As a registered user
  I want to manage my projects and conversions
  So that I can track my work efficiently

  Background:
    Given the user is logged into "https://figmatofullstack.com"
    And the dashboard is accessible

  Scenario: View conversion history
    Given the user has performed conversions
    When the dashboard loads
    Then all past conversions should be listed
    And conversion details should be accessible
    And projects can be organized and filtered

  Scenario: Manage account settings
    Given the user wants to update preferences
    When the user accesses account settings
    Then profile information can be edited
    And notification preferences can be configured
    And API keys can be managed if applicable

  Scenario: Monitor usage and quotas
    Given the user has plan limits
    When the user checks usage
    Then current usage should be displayed
    And remaining quota should be visible
    And upgrade options should be available if needed
