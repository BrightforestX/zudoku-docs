@site:iheartai-ai @priority:P1
Feature: iHeartAI.ai Tools Directory
  As a user
  I want to discover AI tools
  So that I can find solutions for my needs

  Background:
    Given the user navigates to "https://iheartai.ai/tools"
    And a directory of AI tools is available

  Scenario: Browse AI tools catalog
    Given the tools directory has loaded
    When the user explores available tools
    Then tools should be displayed in a grid or list
    And each tool should have a card with key info
    And thumbnails or icons should be shown

  Scenario: Filter tools by category
    Given multiple tool categories exist
    When the user applies category filters
    Then only tools in selected categories should show
    And active filters should be clearly indicated
    And filter counts should be updated

  Scenario: Search for specific tools
    Given the user knows what they're looking for
    When a search query is entered
    Then relevant tools should be returned
    And search should cover tool names and descriptions
    And results should be ranked by relevance

  Scenario: View detailed tool information
    Given the user clicks on a tool
    When the tool detail page loads
    Then comprehensive information should be displayed
    And user reviews and ratings should be shown
    And links to try the tool should be prominent
