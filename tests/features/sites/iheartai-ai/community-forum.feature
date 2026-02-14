@site:iheartai-ai @priority:P2
Feature: iHeartAI.ai Community Forum
  As a community member
  I want to participate in discussions
  So that I can share knowledge and get help

  Background:
    Given the user is logged into "https://iheartai.ai"
    And the community forum is accessible

  Scenario: Browse forum topics
    Given the forum has active discussions
    When the user visits the forum
    Then topics should be organized by category
    And recent activity should be highlighted
    And popular discussions should be featured

  Scenario: Create new discussion thread
    Given the user wants to start a discussion
    When a new thread is created
    Then the thread creation interface should be intuitive
    And rich text formatting should be available
    And the thread should appear in the appropriate category

  Scenario: Reply to existing threads
    Given the user wants to contribute
    When replying to a thread
    Then replies should be nested appropriately
    And formatting options should be available
    And notifications should be sent to thread participants

  Scenario: Upvote and mark helpful responses
    Given helpful responses exist
    When the user finds a helpful answer
    Then upvoting should be easy
    And helpful answers should be highlighted
    And reputation points should be awarded
