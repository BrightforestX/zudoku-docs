@site:brightforestx-com @priority:P1
Feature: BrightForestX.com Pricing Page
  As a potential customer
  I want to understand pricing options
  So that I can make an informed purchase decision

  Background:
    Given the user navigates to "https://brightforestx.com/pricing"
    And pricing plans are configured

  Scenario: Display pricing tiers
    Given the pricing page has loaded
    When the user views pricing options
    Then multiple pricing tiers should be displayed
    And each tier should list included features
    And pricing should be clearly visible

  Scenario: Compare pricing plans
    Given multiple plans are available
    When the user compares plans
    Then a comparison view should be available
    And differences between tiers should be clear
    And recommended plans should be highlighted

  Scenario: Pricing page CTAs
    Given the user has reviewed pricing
    When the user is ready to proceed
    Then sign-up or contact CTAs should be prominent
    And the purchase flow should be clear
    And multiple contact options should be available
