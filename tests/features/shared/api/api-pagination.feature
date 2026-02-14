@shared @api @priority:P2
Feature: API Pagination
  As an API consumer
  I want paginated responses for large datasets
  So that I can efficiently retrieve data in manageable chunks

  Background:
    Given the API endpoint returns a large dataset
    And pagination is implemented

  Scenario: First page of results
    Given the user requests the first page
    When the API responds
    Then the response should include paginated results
    And metadata should indicate total count
    And links to next page should be provided

  Scenario: Navigate to next page
    Given the user is viewing page 1
    When the user requests page 2
    Then the next set of results should be returned
    And pagination metadata should update
    And links to previous and next pages should be included

  Scenario: Custom page size
    Given the user specifies a page size parameter
    When the request is made
    Then the API should return the specified number of items
    And the page size should not exceed maximum limits
    And pagination should respect the custom size
