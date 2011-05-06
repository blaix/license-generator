Feature: Generate BSD License
  In order to release my code under the BSD license
  As an open source developer
  I want to generate a BSD LICENSE file in my project
  
  Scenario: Run `lickjen bsd` with no arguments
    When I successfully run `lickjen bsd`
    Then the output should contain "No value provided for required options"    
  
  Scenario: Run `lickjen bsd --name='Justin Blake' --organization=Hentzia`
    When I successfully run `lickjen bsd --name='Justin Blake' --organization=Hentzia`
    Then the output should say the file "LICENSE" was created
    And a file named "LICENSE" should exist
    And the file "LICENSE" should contain a copyright notice for "Justin Blake"
    And the file "LICENSE" should contain "Neither the name of Hentzia nor the names of its"
