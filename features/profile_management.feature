Feature: Profile Management
    As an authenticated user
    I should be able to edit, and delete my Profile

    Background:
        Given I have signed in as an authenciated user

    Scenario: Filling in my profile for the first time
        Given I visit the edit profile page
        When I fill in my name and phone number
        * I upload a profile image
        * I enter a bio
        * I enter my external links
        And I click save
        Then I should see the changes reflected in my profile
