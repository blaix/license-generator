Feature: Get help
  In order to use this thing like a pro
  As a small scared child
  I want to get help

  Scenario: Run licken with no args
    When I run `lickjen`
    Then I should see the generic help output
    
  @wip
  Scenario: Run licken help task
    When I run `lickjen help`
    Then I should see the generic help output
    
  @wip
  Scenario: Run lickjen help task for the list task
  
  @wip
  Scenario: Run lickjen help task for the bsd template
