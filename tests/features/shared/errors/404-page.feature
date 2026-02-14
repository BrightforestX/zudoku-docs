@shared @errors @priority:P1
Feature: 404 Error Page
  As a user who encounters a broken link
  I want a helpful 404 error page
  So that I can find my way back to useful content

  Background:
    Given the user navigates to a non-existent URL
    And the 404 page is configured

  Scenario: Display custom 404 page
    Given the requested page does not exist
    When the 404 page loads
    Then a custom 404 page should be displayed
    And the page should explain that the content wasn't found
    And helpful navigation options should be provided

  Scenario: 404 page navigation elements
    Given the 404 page is displayed
    When the user looks for ways to navigate
    Then a link to the homepage should be present
    And a search box should be available
    And suggested popular pages should be shown

  Scenario: 404 page HTTP status code
    Given the user requests a non-existent page
    When the server response is checked
    Then the HTTP status code should be 404
    And search engines should understand the page doesn't exist
    And the response should not be cached
