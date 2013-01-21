Feature: Admin approves provider

  Scenario:
    Given I am signed in as an admin
    And the following provider:
      | name        | Island Dentistry |
    When I am on the admins dashboard page
    And I follow "Approve"
    Then I should see "You have approved Island Dentistry"
    And "fritz@example.com" should receive an approval email
    And that email should contain a link to sign in
