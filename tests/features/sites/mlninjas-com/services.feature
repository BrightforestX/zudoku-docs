@site:mlninjas-com @priority:P1
Feature: MLNinjas.com Services
  As a potential client
  I want to explore available services
  So that I can find the right solution for my project

  Background:
    Given the user navigates to "https://mlninjas.com/services"
    And service offerings are detailed

  Scenario: Browse service categories
    Given the services page has loaded
    When the user explores services
    Then services should be organized by category
    And each service should have detailed descriptions
    And deliverables should be clearly stated

  Scenario: Service process and methodology
    Given the user wants to understand how services are delivered
    When process information is reviewed
    Then the engagement process should be explained
    And timelines should be indicated
    And methodologies should be described

  Scenario: Request service consultation
    Given the user is interested in a service
    When the user wants to inquire
    Then a consultation request form should be available
    And the form should capture project details
    And next steps should be clearly communicated
