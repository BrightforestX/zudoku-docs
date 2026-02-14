@shared @navigation @priority:P2
Feature: Pagination Controls
  As a user
  I want to navigate through paginated content
  So that I can browse multiple pages of content efficiently

  Background:
    Given the user is on a page with paginated content
    And there are multiple pages of results

  Scenario: Display pagination controls
    Given the page has loaded
    When the user scrolls to the pagination section
    Then pagination controls should be visible
    And the current page should be highlighted

  Scenario: Navigate to next page
    Given the user is on page 1
    When the user clicks the "Next" button
    Then the user should be taken to page 2
    And the content should update accordingly

  Scenario: Navigate to specific page
    Given the user sees page numbers
    When the user clicks on a specific page number
    Then the user should be taken to that page
    And the page number should be highlighted
