Feature: Admin rejects provider

  @javascript
  Scenario: Admin rejects provider
    Given I am signed in as an admin
    And the following provider:
      | name        | Island Dentistry |
      | cerp_number | 54321            |
    When I am on the admins dashboard page
    And I follow "Reject"
    And I fill in the following:
      | Comment | Your id is wrong |
    When I press "Confirm Reject"
    Then I should see "You have rejected Island Dentistry"
    And that provider should be rejected
    And I should not see "54321"
