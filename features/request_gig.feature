Feature: Request a gig
  In order to request a gig
  As a user
  I want to create a request

  Scenario: Make a request
    Given I request Wires in the Walls to play in Oakland, CA for 5 dollars
    When I go to the list of requests
    Then I should see "Wires in the Walls"
    And I should see "Oakland, CA"
    And I should see "1 request"
    And I should see "5 dollars"

