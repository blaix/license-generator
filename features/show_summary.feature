Feature: Show License Summary
  In order to release my code to the public without worry
  As an open source developer
  I want to show a summary for a license in my project

  Scenario: Run with license argument
    When I run `licgen info mit` interactively
    Then the output should contain "# MIT"
