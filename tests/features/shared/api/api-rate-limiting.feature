@shared @api @priority:P2
Feature: API Rate Limiting
  As a system administrator
  I want rate limiting on API endpoints
  So that the system is protected from abuse and overload

  Background:
    Given the API implements rate limiting
    And rate limits are configured per endpoint

  Scenario: Stay within rate limits
    Given the user makes requests within the allowed rate
    When requests are sent
    Then all requests should be processed successfully
    And rate limit headers should be included in responses
    And remaining quota should be indicated

  Scenario: Exceed rate limit
    Given the user exceeds the rate limit
    When additional requests are made
    Then the API should return a 429 status code
    And the response should indicate rate limit exceeded
    And the response should include retry-after information

  Scenario: Rate limit reset
    Given the user has been rate limited
    When the rate limit window expires
    Then the user should be able to make requests again
    And the rate limit counter should be reset
    And requests should be processed normally
