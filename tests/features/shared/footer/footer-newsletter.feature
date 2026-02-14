@shared @footer @priority:P3
Feature: Footer Newsletter Signup
  As a user
  I want to subscribe to a newsletter from the footer
  So that I can stay updated with site content

  Background:
    Given the footer contains a newsletter signup form
    And the form is visible

  Scenario: Newsletter form submission
    Given the user enters a valid email address
    When the user submits the newsletter form
    Then a success message should be displayed
    And the email should be added to the mailing list
    And confirmation feedback should be clear

  Scenario: Newsletter form validation
    Given the user enters an invalid email
    When the user attempts to submit
    Then an error message should be displayed
    And the message should indicate what's wrong
    And the form should not submit

  Scenario: Newsletter privacy assurance
    Given the newsletter form is visible
    When the user views the form
    Then a privacy statement or link should be present
    And users should be informed how their data will be used
    And the form should comply with GDPR if applicable
