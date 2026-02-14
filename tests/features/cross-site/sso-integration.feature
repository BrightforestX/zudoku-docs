@cross-site @authentication @priority:P2
Feature: Single Sign-On Integration
  As a user with accounts on multiple domains
  I want single sign-on capability
  So that I can access all sites with one set of credentials

  Background:
    Given SSO is configured across domains
    And authentication services are operational

  Scenario: Sign in on one domain, access another
    Given the user signs in on domain A
    When the user navigates to domain B
    Then the user should already be authenticated on domain B
    And session should be shared securely
    And no additional login should be required

  Scenario: Sign out propagates across domains
    Given the user is signed in on multiple domains
    When the user signs out on one domain
    Then the user should be signed out on all domains
    And session tokens should be invalidated everywhere
    And protected content should no longer be accessible

  Scenario: Session timeout consistency
    Given the user has active sessions on multiple domains
    When the session timeout period expires
    Then sessions should expire consistently across domains
    And users should be prompted to re-authenticate
    And timeout duration should be configurable
