@javascript
Feature: Admin rejects provider

  Background:
    Given I am signed in as an admin
    And the following provider:
      | name        | Island Dentistry |
      | cerp_number | 54321            |
    When I am on the admins dashboard page
    And I follow "Unapproved Providers"
    And I follow "Reject"

  Scenario: Admin rejects provider
    Given I fill in the following:
      | Comment | Your id is wrong |
    When I press "Confirm Reject"
    Then I should see "You have rejected Island Dentistry"
    And that provider should be rejected
    And I should not see "54321"
    And "fritz@example.com" should receive a rejection email
    And that email should contain "Your id is wrong"

  Scenario: Admin cancels rejection
    Given I follow "Cancel"
    Then I should be on the unapproved providers page
    And I should see "54321"
