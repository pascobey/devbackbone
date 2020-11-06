Feature: Project Management
    As an authenticated user
    I should be able to create, edit, and delete my projects

    Background:
        Given I have signed in as a registered user

    Scenario: Creating a new project as product and scrum master with every development team subset as a programmer
        Given I visit the create project page
        When I name the project
        * I check every box for development team subsets
        * I make myself the product owner
        * I make myself the scrum master
        * I make myself a developer 
        * I specify that I am a programmer
        And I click create
        Then I should see the project dashboard

    Scenario: Visiting the show project will default to the dashboard
        Given I have access to the project
        When I visit the show project page
        Then I should see the project dashboard

    Scenario: Show a project that was created with improper leadership (scrum master is the product owner)
        Given I am the product owner of a project with improper leadership
        When I visit the show project page
        Then I should be notified that my product owner and scrum master are the same person

    Scenario: Show a project that has no scrum data yet
        Given I am the scrum master of the project
        When I visit the show project page
        Then I should be notified that my schedule is undefined and my backlog is empty
    
    Scenario: Editing the team members of a project
        Given I am the product owner
        When I visit the show project page
        And I click the team button
        * I see the team details
        * I have editing privileges
        * I edit a team
        * I change a leader
        * I click the save changes button
        Then I should be notified that the team details have changed

    Scenario: Editing the scrum details of a project
        Given I am the scrum master of the project
        When I visit the show project page
        And I see click the scrum button
        * I see the scrum details
        * I have editing privileges
        * I set the sprint timeframe
        * I set the daily scrum meeting time
        * I schedule the sprint review meeting
        And I click the save changes button
        Then I should be notified that the scrum details have changed

    Scenario: Editing the project backlog as a team member
        Given I am a member of the development team
        When I visit the show project page
        And I click the backlog button
        * I see the backlog
        * I add a user story
        And I click the save changes button
        Then I should see that the user story has been created

    Scenario: Approving the project backlog as the scrum master
        Given I am the scrum master of the project
        When I visit the show project page
        And I click the backlog button
        * I see the backlog
        * I see if any user stories need approval
        And I approve all user stories
        Then I should not see any unapproved user stories
        
