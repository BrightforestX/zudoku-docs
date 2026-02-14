@site:brightforest-io @priority:P2
Feature: BrightForest.io User Engagement
  As a site owner
  I want to engage visitors
  So that they return and interact with content

  Background:
    Given the user is on "https://brightforest.io"
    And engagement features are implemented

  Scenario: Newsletter subscription
    Given a newsletter signup form is available
    When the user enters their email and subscribes
    Then a confirmation message should appear
    And the user should receive a welcome email
    And the subscription should be recorded

  Scenario: Social sharing functionality
    Given the user is viewing shareable content
    When social sharing buttons are displayed
    Then users can share to multiple platforms
    And share metadata should be correctly formatted
    And sharing should work across different social networks

  Scenario: Comment or feedback system
    Given the site supports user feedback
    When the user wants to leave feedback
    Then a feedback mechanism should be available
    And submissions should be captured
    And users should receive confirmation
