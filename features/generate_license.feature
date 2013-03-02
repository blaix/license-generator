Feature: Generate a License
  In order to release my code to the public without worry
  As an open source developer
  I want to generate a LICENSE file in my project

  Scenario: Run without authors
    When I run `licgen bsd` interactively
    And I type "Justin Blake"
    And I type "Hentzia"
    Then a file named "LICENSE" should exist
    And the file "LICENSE" should contain a copyright notice for "Justin Blake"
    And the file "LICENSE" should contain "Neither the name of Hentzia nor the names of its"

  Scenario: Run with authors
    When I run `licgen bsd "James Pearson"` interactively
    And I type "Hentzia"
    Then a file named "LICENSE" should exist
    And the file "LICENSE" should contain a copyright notice for "James Pearson"
    And the file "LICENSE" should contain "Neither the name of Hentzia nor the names of its"

  @wip
  Scenario: Bad template name
    When I run `licgen asdfaowefnasdfaoweranasdflao`
    Then I should see a graceful failure message
