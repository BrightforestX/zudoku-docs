@shared @tools @brightpath @priority:P1
Feature: Brightpath CLI Documentation
  As a developer
  I want comprehensive brightpath CLI documentation on the docs site
  So that I can learn how to use the CLI for agent orchestration

  Background:
    Given the documentation site is running
    And the Tools section is visible in the sidebar navigation

  Scenario: Brightpath CLI overview page loads correctly
    When I navigate to the brightpath CLI overview page
    Then the page title should contain "Brightpath CLI"
    And the page should describe multi-provider AI agent orchestration
    And the page should list key features including batch operations and multi-round orchestration

  Scenario: Command reference page is complete
    When I navigate to the brightpath CLI commands page
    Then the page should list all command groups
    And each command group should include "agent", "run", "sandbox", "actions", "merge"
    And each command should show available flags and usage examples

  Scenario: Installation page has correct setup instructions
    When I navigate to the brightpath CLI installation page
    Then the page should include build from source instructions
    And the page should document required environment variables
    And the page should show .brightpath.yaml configuration example

  Scenario: Batch operations guide is actionable
    When I navigate to the brightpath CLI batch operations page
    Then the page should explain the batch file format
    And the page should include a real batch file example
    And the page should document the launch, monitor, and merge workflow

  Scenario: Multi-round orchestration guide covers DAG pipelines
    When I navigate to the brightpath CLI multi-round page
    Then the page should explain multi-round orchestration concepts
    And the page should document DAG-based pipeline configuration
    And the page should include budget controls and merge strategies

  Scenario: Provider documentation covers all 5 providers
    When I navigate to the brightpath CLI providers page
    Then the page should document Cursor provider setup
    And the page should document Linear provider setup
    And the page should document Copilot provider setup
    And the page should document PostForMe provider setup
    And the page should document Upload-Post provider setup

  Scenario: CLI command examples are copy-able
    When I navigate to any brightpath CLI documentation page
    Then all CLI command blocks should have a copy button
    And clicking the copy button should copy the command to clipboard
