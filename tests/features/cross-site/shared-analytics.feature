@cross-site @analytics @priority:P2
Feature: Shared Analytics Tracking
  As a site administrator
  I want consistent analytics across all domains
  So that I can track user behavior across the network

  Background:
    Given analytics tracking is configured
    And multiple domains are instrumented

  Scenario: Track cross-domain user journeys
    Given the user visits multiple domains
    When analytics data is collected
    Then user sessions should be tracked across domains
    And the journey should be attributed correctly
    And domain transitions should be recorded

  Scenario: Consistent event tracking
    Given similar features exist on multiple domains
    When users interact with these features
    Then events should be tracked consistently
    And event naming should follow conventions
    And data should be comparable across domains

  Scenario: Unified analytics reporting
    Given analytics data is collected from all domains
    When reports are generated
    Then data should be aggregatable across domains
    And domain-specific insights should be available
    And cross-domain comparisons should be possible
