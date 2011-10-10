Feature: Log in with OpenID
  In order to log in
  As a user
  I want to use my OpenID

  Scenario: Log in with Google OpenID
    Given I login with Google's OpenID url
    And I enter my credentials
    Then I should see my name

  @wip
  Scenario: Issue error with invalid OpenID url
    Given I login with an invalid OpenID url
    Then I should see "Invalid OpenID url"
