@site:getdiyai-com @priority:P1
Feature: GetDIYAI.com Builder Interface
  As a user
  I want an intuitive AI builder interface
  So that I can create AI solutions without coding

  Background:
    Given the user is logged into "https://getdiyai.com"
    And the AI builder is accessible

  Scenario: Start new AI project
    Given the user wants to create a new AI solution
    When the user initiates a new project
    Then a project setup wizard should guide the user
    And template options should be available
    And project goals should be captured

  Scenario: Drag-and-drop component assembly
    Given the builder interface is open
    When the user assembles AI components
    Then components should be draggable
    And connections should be visual and intuitive
    And validation should prevent invalid configurations

  Scenario: Test AI solution in real-time
    Given the user has built an AI workflow
    When the user tests the solution
    Then testing should be available without deployment
    And results should be displayed immediately
    And debugging information should be helpful

  Scenario: Deploy AI solution
    Given the AI solution is complete and tested
    When the user deploys the solution
    Then deployment options should be clear
    And the process should be automated
    And deployment status should be visible
