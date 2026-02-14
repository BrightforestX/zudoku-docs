@site:appnowhq-com @priority:P2
Feature: AppNowHQ.com Team Collaboration
  As a team member
  I want to collaborate on app development
  So that multiple people can work together

  Background:
    Given the user is logged into "https://appnowhq.com"
    And team features are enabled

  Scenario: Invite team members
    Given the user wants to add collaborators
    When team members are invited
    Then invitations should be sent via email
    And invite status should be trackable
    And access levels should be configurable

  Scenario: Collaborate on app in real-time
    Given multiple team members are working
    When changes are made
    Then changes should be visible to all team members
    And conflicts should be prevented
    And activity should be logged

  Scenario: Manage team permissions
    Given team members have different roles
    When permissions are configured
    Then role-based access should be enforceable
    And permissions should be granular
    And changes should take effect immediately
