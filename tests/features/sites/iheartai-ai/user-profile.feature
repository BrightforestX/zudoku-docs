@site:iheartai-ai @priority:P2
Feature: iHeartAI.ai User Profile
  As a registered user
  I want to manage my profile
  So that I can personalize my experience and track progress

  Background:
    Given the user is logged into "https://iheartai.ai"
    And user profiles are available

  Scenario: View personal profile
    Given the user accesses their profile
    When the profile page loads
    Then user information should be displayed
    And activity history should be visible
    And achievements or badges should be shown

  Scenario: Edit profile information
    Given the user wants to update their profile
    When editing profile details
    Then all editable fields should be accessible
    And changes should be validated
    And updates should be saved successfully

  Scenario: Track learning progress
    Given the user has taken courses
    When progress is viewed
    Then completed courses should be listed
    And in-progress courses should show completion percentage
    And certificates should be downloadable

  Scenario: Manage saved items
    Given the user has saved tools or resources
    When saved items are accessed
    Then all saved items should be listed
    And items can be organized into collections
    And items can be removed from saved list
