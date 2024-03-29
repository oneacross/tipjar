Feature: Request a gig
  In order to request a gig
  As a user
  I want to create a request

  Scenario: Make a request
    Given I request Wires in the Walls to play in Oakland, CA for 5 bucks
    Then I should see "I would pay 5 bucks to see Wires in the Walls play in Oakland, CA"

  @wip
  Scenario: Make multiple requests
    Given I request Wires in the Walls to play in Oakland, CA for 5 bucks
    And I request Wires in the Walls to play in Oakland, CA for 10 bucks
    When I go to the list of requests
    Then I should see "Wires in the Walls"
    And I should see "Oakland, CA"
    And I should see "2 requests"
    And I should see "15 dollars"

  @wip
  Scenario: A user can delete a request

  @wip
  Scenario: User can sign up with google account

  @wip
  Scenario: User can view their requests

  @wip
  Scenario: User can delete a request

  @wip
  Scenario: User can make a request

