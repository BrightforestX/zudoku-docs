@shared @errors @priority:P2
Feature: Network Error Handling
  As a user with connectivity issues
  I want to be informed about network problems
  So that I understand why content isn't loading

  Background:
    Given the user is browsing the site
    And network conditions may vary

  Scenario: Display offline message
    Given the user loses internet connectivity
    When the app detects the offline state
    Then an offline notification should be displayed
    And the message should be clear and non-technical
    And cached content should still be accessible if available

  Scenario: Retry failed requests
    Given a network request fails
    When the failure is detected
    Then the user should see a retry option
    And clicking retry should attempt the request again
    And multiple retries should be handled gracefully

  Scenario: Partial content loading failure
    Given the page loads but some resources fail
    When resource loading errors occur
    Then the page should remain functional
    And error states should be shown for failed content
    And the user should be able to continue using the site
