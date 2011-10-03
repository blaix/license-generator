Feature: List templates
  In order to see the available templates
  I want to list them like a boss

Scenario: Run `lickjen list`
  When I run `lickjen list`
  Then the output should contain "bsd"
  # TODO: add a couple more conditions when we have more templates
