Feature: Admin views list of approved providers

  Scenario:
    Given I am signed in as an admin
    And 3 random providers
    And those providers have been approved
    When I am on the dashboard page
    And I follow "Approved Providers"
    Then I should see 3 providers
    And I should see the providers:
      | fields      |
      | name        |
      | cerp_number |
      | email       |
    And I should not see the link "Reject"
