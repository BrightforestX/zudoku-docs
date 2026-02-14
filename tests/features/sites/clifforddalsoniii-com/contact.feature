@site:clifforddalsoniii-com @priority:P2
Feature: CliffordDalsonIII.com Contact
  As a visitor
  I want to get in touch
  So that I can reach out for opportunities or collaboration

  Background:
    Given the user navigates to "https://clifforddalsoniii.com/contact"
    And contact options are available

  Scenario: Submit contact message
    Given the contact form is displayed
    When the user fills out and submits the form
    Then the message should be sent successfully
    And a confirmation should be displayed
    And the user should know when to expect a response

  Scenario: Professional social media links
    Given social media links are provided
    When the user views contact options
    Then LinkedIn profile should be linked
    And other professional networks should be available
    And links should open in new tabs

  Scenario: Alternative contact methods
    Given multiple contact options exist
    When the user prefers different contact methods
    Then email address should be displayed
    And availability or response time should be indicated
    And professional boundaries should be clear
