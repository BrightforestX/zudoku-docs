@site:brightforestx-com @priority:P1
Feature: BrightForestX.com Homepage
  As a visitor to BrightForestX.com
  I want to see relevant homepage content
  So that I can understand the platform and get started

  Background:
    Given the user navigates to "https://brightforestx.com"
    And the target audience is enterprise clients

  Scenario: Display homepage value proposition
    Given the homepage has loaded
    When the user views the main content
    Then the unique value proposition should be clear
    And enterprise-focused messaging should be prominent
    And trust indicators should be visible

  Scenario: Product showcase
    Given the homepage displays product information
    When the user explores product features
    Then key product capabilities should be highlighted
    And demos or screenshots should be available
    And clear next steps should be provided

  Scenario: Call-to-action effectiveness
    Given CTAs are placed throughout the homepage
    When the user encounters CTAs
    Then primary CTAs should stand out visually
    And CTA text should be action-oriented
    And clicking CTAs should lead to appropriate pages
