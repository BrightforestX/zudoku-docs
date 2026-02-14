@site:appnowhq-com @priority:P1
Feature: AppNowHQ.com App Builder
  As a user
  I want to build apps quickly
  So that I can launch my product fast

  Background:
    Given the user is logged into "https://appnowhq.com"
    And the app builder is accessible

  Scenario: Start new app project
    Given the user wants to create a new app
    When the user initiates app creation
    Then project setup should be guided
    And app type selection should be available
    And templates should be offered

  Scenario: Design app interface
    Given the app builder is open
    When the user designs the UI
    Then drag-and-drop interface building should work
    And component library should be accessible
    And preview should update in real-time

  Scenario: Configure app functionality
    Given the UI is designed
    When the user adds functionality
    Then business logic configuration should be intuitive
    And integrations should be easy to add
    And data models should be definable

  Scenario: Publish app
    Given the app is complete
    When the user publishes
    Then deployment should be automated
    And the app should be accessible immediately
    And deployment URL should be provided
