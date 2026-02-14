@shared @api @priority:P1
Feature: API Response Format
  As an API consumer
  I want consistent response formats
  So that I can reliably parse and use the data

  Background:
    Given the API is accessible
    And endpoints are properly configured

  Scenario: Successful response format
    Given the user makes a valid API request
    When the API processes the request successfully
    Then the response should have a 2xx status code
    And the response should be valid JSON
    And the response should include expected data fields

  Scenario: Error response format
    Given the user makes an invalid API request
    When the API returns an error
    Then the response should have an appropriate error status code
    And the error response should include an error message
    And the error should include a descriptive error code

  Scenario: Response data consistency
    Given the API returns data
    When multiple requests are made
    Then field names should be consistent across responses
    And data types should remain consistent
    And null values should be handled appropriately
