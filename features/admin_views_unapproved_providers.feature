Feature: Admin views unaproved providers

  Scenario:
    Given I am signed in as an admin
    And 3 random providers
    When I am on the admins dashboard page
    And I follow "Unapproved Providers"
    Then I should see 3 providers
    And I should see the providers:
      | fields      |
      | name        |
      | cerp_number |
      | email       |
    And I should see the link "Approve"
    And I should see the link "Reject"
