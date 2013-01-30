Feature: visitor searches for flights

  @vcr
  Scenario: Valid flight search
    Given 1 airport
    And that airport has 1 course
    And that course has the dates:
      | start           | end             |
      | 3 days from now | 1 week from now |
    And that course has the address:
      | city    | state |
      | Atlanta | GA    |
    When I am on that courses show page
    And I follow "Search for flights"
    And I fill in "Departure Airport" with "Atlantic City, NJ-ACY"
    And I press "Search"
    Then I should see the following:
      | Text      |
      | $1,989.65 |
      | PHL       |
      | DFW       |
