@site:pathx-ai @priority:P1
Feature: PathX.ai Homepage
  As a visitor to PathX.ai
  I want to understand the platform offerings
  So that I can evaluate the solution for my needs

  Background:
    Given the user navigates to "https://pathx.ai"
    And the target audience is AI solution seekers

  Scenario: Display platform overview
    Given the homepage has loaded
    When the user views the content
    Then the platform's core functionality should be clear
    And key benefits should be prominently displayed
    And visual elements should support the message

  Scenario: Feature highlights
    Given the platform has multiple features
    When features are presented on the homepage
    Then each feature should have a clear description
    And icons or imagery should illustrate features
    And links to learn more should be available

  Scenario: Getting started journey
    Given new users need guidance
    When the user looks for next steps
    Then a clear getting started path should be visible
    And onboarding steps should be outlined
    And sign-up or trial options should be prominent
