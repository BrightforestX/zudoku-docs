@site:brightpath-ai @priority:P1
Feature: BrightPath.ai API Documentation
  As a developer
  I want comprehensive API documentation
  So that I can integrate BrightPath.ai into my applications

  Background:
    Given the user navigates to "https://brightpath.ai/docs"
    And API documentation is published

  Scenario: Browse API endpoints
    Given the API documentation is displayed
    When the user explores available endpoints
    Then all endpoints should be documented
    And request/response examples should be provided
    And authentication requirements should be clear

  Scenario: Interactive API playground
    Given an API playground is available
    When the user tests API calls
    Then the user can make live API requests
    And responses should be displayed in real-time
    And different parameters can be tested

  Scenario: Code samples in multiple languages
    Given developers use various programming languages
    When code examples are shown
    Then examples should be available in multiple languages
    And code should be copy-able
    And examples should demonstrate best practices
