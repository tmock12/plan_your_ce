Feature: Admin signs in
  Scenario:
    Given I am on the home page
    And 1 admin
    When I follow "Sign in"
    And I fill in the following:
      | email    | admin@example.com |
      | password | shipwrecked       |
    When I press "Sign in"
    Then I should be on the admins dashboard page
