@site:getdiyrpa-com @priority:P1
Feature: GetDIYRPA.com Homepage
  As a visitor to GetDIYRPA.com
  I want to understand the DIY RPA platform
  So that I can determine if it helps me automate tasks

  Background:
    Given the user navigates to "https://getdiyrpa.com"
    And the target audience is small businesses and individuals

  Scenario: Display RPA value proposition
    Given the homepage has loaded
    When the user views the content
    Then the DIY approach to RPA should be clearly explained
    And automation benefits should be highlighted
    And common use cases should be showcased

  Scenario: Automation examples
    Given automation examples are featured
    When the user views examples
    Then real-world automation scenarios should be shown
    And time savings should be quantified
    And complexity levels should be indicated

  Scenario: Getting started CTA
    Given the user is interested in trying RPA
    When the user looks for next steps
    Then clear CTAs should be prominent
    And free trial or demo options should be available
    And the signup process should be straightforward
