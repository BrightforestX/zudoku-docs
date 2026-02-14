@cross-site @monitoring @priority:P3
Feature: Consistent Monitoring and Error Tracking
  As a site administrator
  I want unified monitoring across all domains
  So that I can detect and respond to issues quickly

  Background:
    Given error tracking is configured
    And monitoring tools are deployed across domains

  Scenario: Centralized error reporting
    Given errors occur on different domains
    When errors are captured
    Then all errors should be reported to a central system
    And errors should include domain context
    And error patterns should be identifiable across domains

  Scenario: Uptime monitoring for all domains
    Given uptime monitoring is configured
    When domains are checked
    Then all domains should be monitored for availability
    And alerts should trigger when sites go down
    And response times should be tracked for each domain

  Scenario: Performance monitoring consistency
    Given performance metrics are collected
    When sites are analyzed
    Then the same metrics should be tracked on all domains
    And performance should be comparable across sites
    And performance regressions should be detectable
