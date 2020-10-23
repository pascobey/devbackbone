Feature: Security
    As an unpermitted user,
    there should be pages I cannot access

    Scenario: Trying to edit another user's profile 
        Given I have signed in as an authenticated user
        When I visit the edit profile page with an id not matching that of my profile
        Then I should be redirected to my edit profile page

    Scenario: Trying to enter a project I am not a part of
        Given I have signed in as an authenticated user
        When I visit the show project page of a project I am not a part of
        Then I should be redirected to the site root 