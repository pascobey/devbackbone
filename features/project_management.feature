Feature: Project Management
    As an authenticated user
    I should be able to create, edit, and delete my projects

    Background:
        Given I have signed in as a registered user

    Scenario: Creating a new project as project_owner, project manager, and scrum master with every development team subset as a programmer
        Given I visit the create project page
        When I name the project
        * I check every box for development team subsets
        * I make myself the product owner
        * I make myself the project manager
        * I make myself the scrum master
        * I make myself a developer 
        * I specify that I am a programmer
        And I click create
        Then I should see my project manager dashboard

    Scenario: Show a project that was created with improper leadership (scrum master is the project manager)
        Given I am the product owner of a project with improper leadership
        When I visit the show project page
        Then I should be notified that my project manager and scrum master are the same person
    
    Scenario: Editing (reflexively) the team members of a project
        Given I am the product owner
        When I visit the show project page
        And I click the team details button
        * I see the team details
        * I have editing priviledges
        * I change a leader
        * I edit a team
        Then I should be notified that the team details have changed

    