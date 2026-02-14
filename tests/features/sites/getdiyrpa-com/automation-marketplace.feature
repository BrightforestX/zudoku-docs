@site:getdiyrpa-com @priority:P2
Feature: GetDIYRPA.com Automation Marketplace
  As a user
  I want access to pre-built automations
  So that I can quickly implement common workflows

  Background:
    Given the user navigates to "https://getdiyrpa.com/marketplace"
    And automation templates are available

  Scenario: Search automation marketplace
    Given the marketplace has loaded
    When the user searches for automations
    Then relevant results should be displayed
    And filters should help narrow results
    And automation descriptions should be clear

  Scenario: Preview automation before installing
    Given the user selects an automation
    When the preview is displayed
    Then the automation workflow should be visible
    And required integrations should be listed
    And user reviews should be shown

  Scenario: Install marketplace automation
    Given the user wants to use a marketplace automation
    When the user clicks install
    Then the automation should be added to their account
    And required setup steps should be guided
    And the automation should be ready to customize
