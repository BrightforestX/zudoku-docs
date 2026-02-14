@site:getdiyai-com @priority:P2
Feature: GetDIYAI.com Learning Resources
  As a new user
  I want learning resources
  So that I can effectively use the platform

  Background:
    Given the user navigates to "https://getdiyai.com/learn"
    And learning content is available

  Scenario: Interactive tutorials
    Given tutorials are available
    When the user starts a tutorial
    Then step-by-step guidance should be provided
    And interactive exercises should reinforce learning
    And progress should be tracked

  Scenario: Video course library
    Given video courses are offered
    When the user browses courses
    Then courses should be organized by skill level
    And course descriptions should set expectations
    And videos should be high quality and clear

  Scenario: Community forum access
    Given a community forum exists
    When the user needs help
    Then forum should be easily accessible
    And questions should be searchable
    And active community participation should be evident
