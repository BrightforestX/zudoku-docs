@shared @api @priority:P1
Feature: API Authentication
  As an API user
  I want secure authentication
  So that only authorized requests can access protected resources

  Background:
    Given the API has authentication requirements
    And protected endpoints exist

  Scenario: Authenticated request success
    Given the user has valid credentials
    When the user makes a request with proper authentication
    Then the request should be accepted
    And the response should return the requested data
    And the status code should be 200

  Scenario: Unauthenticated request rejection
    Given the user makes a request to a protected endpoint
    When no authentication credentials are provided
    Then the request should be rejected
    And the response status code should be 401
    And an authentication error message should be returned

  Scenario: Invalid token handling
    Given the user provides an invalid or expired token
    When the request is made
    Then the API should return a 401 status
    And the error message should indicate token invalidity
    And guidance for re-authentication should be provided
