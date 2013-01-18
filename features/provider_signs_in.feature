Feature: Provider signs in

  Background:
    Given I am on the home page
    And 1 provider
    When I follow "Sign in"
    Then I fill in the following:
      | email    | fritz@example.com |
      | password | shipwrecked       |

  Scenario: as an unapproved provider
    Given I press "Sign in"
    Then I should see "Your account is pending approval"

  Scenario: as an approved provider
    Given that provider has been approved
    When I press "Sign in"
    Then I should be on the providers dashboard page
