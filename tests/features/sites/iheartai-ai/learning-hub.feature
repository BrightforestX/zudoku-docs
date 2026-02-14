@site:iheartai-ai @priority:P1
Feature: iHeartAI.ai Learning Hub
  As a learner
  I want educational AI content
  So that I can improve my AI knowledge

  Background:
    Given the user navigates to "https://iheartai.ai/learn"
    And educational resources are published

  Scenario: Browse learning paths
    Given structured learning paths are available
    When the user views learning paths
    Then paths should be organized by skill level
    And each path should have a clear curriculum
    And estimated completion time should be shown

  Scenario: Access tutorials and guides
    Given tutorials are available
    When the user selects a tutorial
    Then the content should be well-structured
    And code examples should be included where relevant
    And the user can track completion progress

  Scenario: Watch video lessons
    Given video content is available
    When the user watches a video
    Then videos should be high quality
    And playback controls should be functional
    And related videos should be suggested

  Scenario: Take quizzes and assessments
    Given assessments are available
    When the user completes a quiz
    Then questions should test understanding
    And immediate feedback should be provided
    And scores should be recorded
