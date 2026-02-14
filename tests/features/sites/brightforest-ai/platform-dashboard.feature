@site:brightforest-ai @priority:P1
Feature: BrightForest.ai Platform Dashboard
  As a platform user
  I want a comprehensive dashboard
  So that I can manage my AI projects effectively

  Background:
    Given the user is logged into "https://brightforest.ai"
    And the dashboard is accessible

  Scenario: View project overview
    Given the user has active projects
    When the dashboard loads
    Then all projects should be listed
    And project status should be visible
    And quick actions should be available

  Scenario: Monitor AI model performance
    Given AI models are deployed
    When performance metrics are viewed
    Then key performance indicators should be displayed
    And trends should be visualized
    And alerts should highlight issues

  Scenario: Access recent activity
    Given the user has performed actions
    When activity feed is displayed
    Then recent actions should be chronologically listed
    And activity types should be clearly indicated
    And activities should be clickable for details

  Scenario: Quick create new project
    Given the user wants to start a new project
    When quick create is accessed from dashboard
    Then project creation should be streamlined
    And templates should be quickly selectable
    And the user can start working immediately
