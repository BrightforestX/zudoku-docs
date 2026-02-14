@site:getdiyrpa-com @priority:P1
Feature: GetDIYRPA.com Automation Builder
  As a user
  I want to build automation workflows
  So that I can automate repetitive tasks

  Background:
    Given the user is logged into "https://getdiyrpa.com"
    And the automation builder is accessible

  Scenario: Create new automation workflow
    Given the user starts a new automation
    When the workflow builder loads
    Then a visual workflow designer should be available
    And action blocks should be selectable
    And workflow logic should be easy to define

  Scenario: Configure automation triggers
    Given the automation workflow is being created
    When the user sets up triggers
    Then multiple trigger types should be available
    And trigger conditions should be configurable
    And scheduling options should be flexible

  Scenario: Test automation before deployment
    Given the automation is configured
    When the user tests the automation
    Then test mode should simulate execution
    And step-by-step results should be shown
    And errors should be clearly indicated

  Scenario: Monitor running automations
    Given automations are deployed
    When the user checks automation status
    Then execution history should be visible
    And success/failure rates should be displayed
    And logs should be accessible for troubleshooting
