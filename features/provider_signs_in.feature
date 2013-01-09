Feature: Provider signs in

  Scenario: as an unapproved provider
    Given I am on the home page
    And the following provider:
      | email    | ernst@example.com |
    When I follow "Sign in"
    And I fill in the following:
      | email    | ernst@example.com |
      | password | shipwreck         |
    And I press "Sign in"
    Then I should see "Your account is pending approval"
