Feature: Provider signs up
  Scenario: successful registration
    Given I am on the home page
    When I follow "Register"
    Then I fill in the following:
      | Name                           | Swiss Family Dentistry |
      | Address                        | 1117 Duval St          |
      | City                           | Key West               |
      | Zip Code                       | 33040                  |
      | Phone                          | 770-867-5309           |
      | Fax                            | 404-867-5309           |
      | Website                        | www.babyelephant.com   |
      | Email                          | ernst@example.com      |
      | ADA Cerp Number                | 123456                 |
      | provider_password              | shipwreck              |
      | provider_password_confirmation | shipwreck              |
    And I select "Florida" from "State"
    When I press "Register"
    Then I should be on the thank you page
    And I should see "Thank you for registering"

