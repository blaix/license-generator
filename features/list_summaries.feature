Feature: List Summaries
  In order to see the available summaries
  I want to list them like a boss

Scenario: Run `licgen info`
  When I run `licgen info`
  Then the output should contain "bsd"
  And the output should contain "mit"
