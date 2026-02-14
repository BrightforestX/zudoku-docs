@site:brightforest-io @priority:P2
Feature: BrightForest.io Content Structure
  As a content creator
  I want well-structured content pages
  So that visitors can easily consume information

  Background:
    Given the user is on "https://brightforest.io"
    And content pages follow a consistent structure

  Scenario: Article page layout
    Given the user navigates to an article page
    When the page loads
    Then the article title should be prominent
    And author information should be displayed
    And publication date should be visible
    And content should be well-formatted and readable

  Scenario: Table of contents for long articles
    Given the article is longer than 3 screens
    When the user views the article
    Then a table of contents should be available
    And TOC links should jump to relevant sections
    And the current section should be highlighted

  Scenario: Related content recommendations
    Given the user is reading an article
    When the user reaches the end of the content
    Then related articles should be suggested
    And recommendations should be relevant
    And links should navigate to related content
