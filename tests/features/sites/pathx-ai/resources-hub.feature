@site:pathx-ai @priority:P2
Feature: PathX.ai Resources Hub
  As a user seeking information
  I want access to educational resources
  So that I can learn about AI and the platform

  Background:
    Given the user navigates to "https://pathx.ai/resources"
    And resources are published

  Scenario: Browse resource library
    Given the resources page has loaded
    When the user explores available resources
    Then resources should be categorized by type
    And filtering options should be available
    And resources should be easy to find

  Scenario: Download gated content
    Given some resources require registration
    When the user wants to download gated content
    Then a registration form should appear
    And the form should be simple and quick
    And the download should start after submission

  Scenario: Resource search functionality
    Given many resources are available
    When the user searches for specific topics
    Then search results should be relevant
    And results should include resource type
    And clicking results should open the resource
