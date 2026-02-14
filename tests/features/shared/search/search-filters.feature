@shared @search @priority:P2
Feature: Search Filters and Refinement
  As a user
  I want to filter search results
  So that I can find exactly what I'm looking for

  Background:
    Given the user has performed a search
    And results are displayed

  Scenario: Filter by content type
    Given search results include multiple content types
    When the user selects a content type filter
    Then only results of that type should be displayed
    And the filter selection should be clearly indicated
    And the result count should update

  Scenario: Sort search results
    Given search results are displayed
    When the user changes the sort order
    Then results should be reordered accordingly
    And sort options should include relevance, date, and title
    And the current sort should be clearly shown

  Scenario: Clear all filters
    Given the user has applied filters
    When the user clicks "clear filters"
    Then all filters should be removed
    And the original unfiltered results should be shown
    And the search query should remain
