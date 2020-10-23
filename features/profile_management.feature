Feature: Profile Management
    As an authenticated user
    I should be able to edit, and delete my Profile

    Scenario: Filling in my profile for the first time
        Given I have signed in as an authenticated user
        When I visit the edit profile page
        * I fill in my name and phone number
        * I upload a profile image
        * I enter a bio
        * I enter my external links
        And I click save
        Then I should see the changes reflected in my profile