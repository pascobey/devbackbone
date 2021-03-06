Feature: Authentication
    As a user
    I should be able to sign up, log in, and log out

    Scenario: Signing up
        Given I visit the sign up page
        When I fill in the sign up form
        And I confirm the email
        Then I should see that my account is confirmed

    Scenario: User Logs In
        Given I visit the log in page
        When I fill in the login form
        Then I should be logged in

    Scenario: User Logs Out
        Given I am logged in
        And I visit the homepage
        When I click on the log out link
        Then I should be logged out

 