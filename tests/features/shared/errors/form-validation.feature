@shared @errors @priority:P1
Feature: Form Validation Errors
  As a user filling out a form
  I want clear validation error messages
  So that I can correct my mistakes and submit successfully

  Background:
    Given the user is on a page with a form
    And form validation is implemented

  Scenario: Display inline validation errors
    Given the user enters invalid data in a form field
    When the field loses focus or the form is submitted
    Then an error message should appear near the field
    And the message should clearly explain the error
    And the field should be visually indicated as invalid

  Scenario: Required field validation
    Given a form has required fields
    When the user attempts to submit without filling required fields
    Then required field errors should be displayed
    And the first error field should receive focus
    And a summary of errors should be shown

  Scenario: Real-time validation feedback
    Given the user is typing in a validated field
    When the input becomes valid
    Then the error message should disappear
    And a success indicator should appear
    And the field should be marked as valid
