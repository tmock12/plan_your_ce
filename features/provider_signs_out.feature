Feature: Provider signs out

  Scenario:
    Given I am signed in
    And I am on the courses page
    When I follow "Sign out"
    Then I should be signed out
    And I should see "You are now signed out"
