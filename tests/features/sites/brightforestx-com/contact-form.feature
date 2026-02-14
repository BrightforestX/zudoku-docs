@site:brightforestx-com @priority:P2
Feature: BrightForestX.com Contact Form
  As a visitor
  I want to contact the company
  So that I can get answers to my questions

  Background:
    Given the user navigates to "https://brightforestx.com/contact"
    And the contact form is available

  Scenario: Submit contact inquiry
    Given the user fills out the contact form
    When all required fields are completed
    And the user submits the form
    Then a success message should be displayed
    And the inquiry should be received by the team
    And the user should receive a confirmation email

  Scenario: Contact form validation
    Given the user is filling out the contact form
    When invalid data is entered
    Then validation errors should be displayed
    And error messages should be helpful
    And the form should not submit until valid

  Scenario: Alternative contact methods
    Given the user is on the contact page
    When additional contact options are needed
    Then email addresses should be displayed
    And phone numbers should be available
    And business hours should be indicated
