@shared @search @priority:P2
Feature: Search Autocomplete
  As a user
  I want search suggestions as I type
  So that I can find content faster and discover related topics

  Background:
    Given the search input field is focused
    And autocomplete is enabled

  Scenario: Display autocomplete suggestions
    Given the user starts typing in the search box
    When at least 2 characters are entered
    Then autocomplete suggestions should appear
    And suggestions should be relevant to the query
    And suggestions should update as the user types

  Scenario: Navigate autocomplete with keyboard
    Given autocomplete suggestions are visible
    When the user presses the down arrow key
    Then the first suggestion should be highlighted
    And arrow keys should navigate through suggestions
    And Enter should select the highlighted suggestion

  Scenario: Select autocomplete suggestion
    Given autocomplete suggestions are displayed
    When the user clicks on a suggestion
    Then the search should execute with that suggestion
    And the results page should load
    And the selected term should appear in the search box
