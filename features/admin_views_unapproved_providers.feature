Feature: Admin views unaproved providers

  Scenario:
    Given I am signed in as an admin
    And 3 random providers
    When I am on the dashboard page
    Then I should see 3 unaproved providers
    And I should see the providers:
      | fields      |
      | name        |
      | cerp_number |
      | email       |
