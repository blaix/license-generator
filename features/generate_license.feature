Feature: Generate a License
  In order to release my code in some way
  As a developer
  I want to generate a LICENSE file in my project
  
  Scenario: Run `lickjen bsd`
    When I run `lickjen bsd` interactively
    And I type "Justin Blake"
    And I type "Hentzia"
    Then a file named "LICENSE" should exist
    And the file "LICENSE" should contain a copyright notice for "Justin Blake"
    And the file "LICENSE" should contain "Neither the name of Hentzia nor the names of its"
