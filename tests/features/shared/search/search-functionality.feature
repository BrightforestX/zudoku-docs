@shared @search @priority:P1
Feature: Search Functionality
  As a user
  I want to search the site
  So that I can find content quickly

  Background:
    Given the site has a search feature
    And searchable content is indexed

  Scenario: Basic search execution
    Given the user is on any page
    When the user enters a search query
    And submits the search
    Then relevant results should be displayed
    And results should be ranked by relevance
    And the number of results should be shown

  Scenario: Search with no results
    Given the user enters a query with no matches
    When the search is executed
    Then a "no results" message should be displayed
    And search suggestions or alternatives should be offered
    And the user should be able to refine the search

  Scenario: Search query highlighting
    Given search results are displayed
    When the user views result snippets
    Then matching keywords should be highlighted
    And context around matches should be shown
    And result snippets should be informative
