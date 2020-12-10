Given('I have signed in as a registered user') do
    @browser.goto(@test_base_url + new_user_session_path)
    Watir::Wait.until { @browser.text_field(id: 'user_email').present? }
    @browser.text_field(id: 'user_email').set("tester@testdomain.test")
    sleep 0.8
    Watir::Wait.until { @browser.text_field(id: 'user_password').present? }
    @browser.text_field(id: 'user_password').set('pa$$word')
    sleep 0.8
    Watir::Wait.until { @browser.element(value: 'Log in').present? }
    @browser.element(value: 'Log in').click
end

Given('I visit the create project page') do
    @browser.goto(@test_base_url + new_project_path)
    Watir::Wait.until { @browser.h1(id: 'new-project-header').present? }
end

When('I name the project') do
    Watir::Wait.until { @browser.text_field(id: 'project-name').present? }
    @browser.text_field(id: 'project-name').set('Test Project')
    sleep 1.2
    Watir::Wait.until { @browser.button(id: 'next').present? }
    @browser.button(id: 'next').click
end

When('I check every box for development team subsets') do
    Watir::Wait.until { @browser.input(id: 'programmers').present? }
    @browser.input(id: 'programmers').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'ux_ui_designers').present? }
    @browser.input(id: 'ux_ui_designers').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'writers').present? }
    @browser.input(id: 'writers').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'testers').present? }
    @browser.input(id: 'testers').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'dev_ops').present? }
    @browser.input(id: 'dev_ops').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'subject_matter_experts').present? }
    @browser.input(id: 'subject_matter_experts').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'legal').present? }
    @browser.input(id: 'legal').click
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'next').present? }
    @browser.button(id: 'next').click
end

When('I make myself the product owner') do
    Watir::Wait.until { @browser.input(id: 'product_owner').present? }
    @browser.input(id: 'product_owner').click
    sleep 0.8
end

When('I make myself the scrum master') do
    Watir::Wait.until { @browser.input(id: 'scrum_master').present? }
    @browser.input(id: 'scrum_master').click
    sleep 0.8
end

When('I make myself a developer') do
    Watir::Wait.until { @browser.input(id: 'developer').present? }
    @browser.input(id: 'developer').click
    sleep 0.8
end

When('I specify that I am a programmer') do
    Watir::Wait.until { @browser.input(id: 'development_team_subset_programmers').present? }
    @browser.input(id: 'development_team_subset_programmers').click
    sleep 0.8
end

When('I click create') do
    Watir::Wait.until { @browser.button(id: 'create').present? }
    @browser.button(id: 'create').click
end

Then('I should see the project dashboard') do
    Watir::Wait.until { @browser.div(id: 'show-project-header').present? }
end

Given('I am the product owner of a project with improper leadership') do
    # lets assume the tester makes and owns the first project
end

When('I visit the show project page') do
    @browser.goto(@test_base_url + project_path(1))
    Watir::Wait.until { @browser.div(id: 'show-project-header').present? }
end

Then('I should be notified that my product owner and scrum master are the same person') do
    Watir::Wait.until { @browser.element(id: 'backbone-weaknesses').present? }
    Watir::Wait.until { @browser.p(class: 'weakness').present? }
end

Given('I am the scrum master of the project') do
    # lets assume the tester is the scrum master
end

Then('I should be notified that my schedule is undefined and my backlog is empty') do
    Watir::Wait.until { @browser.element(id: 'backbone-weaknesses').present? }
    Watir::Wait.until { @browser.p(class: 'weakness').present? }
end

When('I see click the scrum button') do
    Watir::Wait.until { @browser.a(id: 'schedule-button').present? }
    @browser.a(id: 'schedule-button').click
    sleep 0.8
end

When('I see the scrum details') do
    Watir::Wait.until { @browser.element(id: 'scrum-container').present? }
end

When('I set the sprint timeframe') do
    Watir::Wait.until { @browser.button(id: 'change-sprint-start').present? }
    @browser.button(id: 'change-sprint-start').click
    sleep 0.8
    Watir::Wait.until { @browser.svg(class: 'bi-calendar-event').present? }
    @browser.svg(class: 'bi-calendar-event').click
    sleep 0.8
    Watir::Wait.until { @browser.td(class: 'day').present? }
    @browser.td(text: '2').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'start-date-input').present? }
    @browser.input(id: 'start-date-input').hover
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'change-sprint-start').present? }
    @browser.button(id: 'change-sprint-start').click
    sleep 1.4
    Watir::Wait.until { @browser.button(id: 'change-sprint-end').present? }
    @browser.button(id: 'change-sprint-end').click
    sleep 0.8
    Watir::Wait.until { @browser.svg(class: 'bi-calendar-event').present? }
    @browser.svg(class: 'bi-calendar-event').click
    sleep 0.8
    Watir::Wait.until { @browser.td(class: 'day').present? }
    @browser.td(text: '13').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'end-date-input').present? }
    @browser.input(id: 'end-date-input').hover
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'change-sprint-end').present? }
    @browser.button(id: 'change-sprint-end').click
    sleep 1.4
end

When('I set the daily scrum meeting time') do
    Watir::Wait.until { @browser.button(id: 'change-sprint-daily-scrum').present? }
    @browser.button(id: 'change-sprint-daily-scrum').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'daily-scrum-time-input').present? }
    @browser.input(id: 'daily-scrum-time-input').send_keys(:command, 'a')
    sleep 0.2
    @browser.input(id: 'daily-scrum-time-input').send_keys('9:00 AM')
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'change-sprint-daily-scrum').present? }
    @browser.button(id: 'change-sprint-daily-scrum').click
    sleep 0.8
end

When('I schedule the sprint review meeting') do
    Watir::Wait.until { @browser.button(id: 'change-sprint-sprint-review').present? }
    @browser.button(id: 'change-sprint-sprint-review').click
    sleep 0.8
    Watir::Wait.until { @browser.svg(class: 'bi-calendar-event').present? }
    @browser.svg(class: 'bi-calendar-event').click
    sleep 0.8
    Watir::Wait.until { @browser.td(class: 'day').present? }
    @browser.td(text: '16').click
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'sprint-review-date-input').present? }
    @browser.input(id: 'sprint-review-date-input').hover
    sleep 0.8
    Watir::Wait.until { @browser.input(id: 'sprint-review-time-input').present? }
    @browser.input(id: 'sprint-review-time-input').send_keys(:command, 'a')
    sleep 0.2
    @browser.input(id: 'sprint-review-time-input').send_keys('10:00 AM')
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'change-sprint-sprint-review').present? }
    @browser.button(id: 'change-sprint-sprint-review').click
    sleep 0.8
end

Then('I should be notified that the scrum details have changed') do
    Watir::Wait.until { @browser.div(id: 'flash-content').present? }
    Watir::Wait.until { @browser.div(text: 'Change logged!').present? }
end

Given('I am the product owner') do
    # lets assume the tester makes and owns the first project
end

When('I click the team button') do
    Watir::Wait.until { @browser.a(id: 'team-button').present? }
    @browser.a(id: 'team-button').click
    sleep 0.8
end

When('I see the team details') do
    Watir::Wait.until { @browser.element(id: 'team-container').present? }
end

When('I have editing privileges') do
    Watir::Wait.until { @browser.button(value: 'edit').present? }
end

When('I edit a team') do
    Watir::Wait.until { @browser.button(id: 'edit-programmers').present? }
    sleep 0.8
    @browser.button(id: 'edit-programmers').click
    sleep 0.8
    Watir::Wait.until { @browser.text_field(id: 'programmers-search').present? }
    sleep 0.8
    @browser.text_field(id: 'programmers-search').set('creator of Ruby on Rails')
    sleep 1
    Watir::Wait.until { @browser.button(id: 'add-David-HeinemeierHansson-to-programmers').present? }
    sleep 1.2
    @browser.button(id: 'add-David-HeinemeierHansson-to-programmers').click
    sleep 1
    Watir::Wait.until { @browser.button(id: 'remove-David-HeinemeierHansson-from-programmers').present? }
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'edit-programmers').present? }
    sleep 0.8
    @browser.button(id: 'edit-programmers').click
    sleep 0.8
end

When('I change a leader') do
    Watir::Wait.until { @browser.button(id: 'change-product-owner').present? }
    sleep 1
    @browser.button(id: 'change-product-owner').click
    sleep 1
    Watir::Wait.until { @browser.text_field(id: 'product-owner-search').present? }
    sleep 1
    @browser.text_field(id: 'product-owner-search').set('Kevin Skoglund')
    sleep 1
    Watir::Wait.until { @browser.button(id: 'make-Kevin-Skoglund-product-owner').present? }
    sleep 1
    @browser.button(id: 'make-Kevin-Skoglund-product-owner').click
    sleep 0.8
    Watir::Wait.until { @browser.p(id: 'product-owner-Kevin-Skoglund') }
    sleep 0.8
end

# When('I click the save changes button') do
#     Watir::Wait.until { @browser.input(value: 'save changes').present? }
#     sleep 0.8
#     @browser.input(value: 'save changes').click
#     sleep 0.8
# end

Then('I should be notified that the team details have changed') do
    Watir::Wait.until { @browser.div(id: 'flash-content').present? }
    sleep 0.8
    Watir::Wait.until { @browser.div(text: 'Change logged!').present? }
    sleep 0.8
end

Given('I have access to the project') do
    # lets assume the tester always has access to the testing project
end

Given('I am a member of the development team') do
    # lets assume the tester always is on the development team
end

When('I click the backlog button') do
    Watir::Wait.until { @browser.button(id: 'backlog-button').present? }
    sleep 0.8
    @browser.button(id: 'backlog-button').click
    sleep 0.8
end

When('I see the backlog') do
    Watir::Wait.until { @browser.div(id: 'backlog-container').present? }
    sleep 0.8
end

When('I add a user story') do
    Watir::Wait.until { @browser.h3(id: 'user-stories-header').present? }
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'new-user-story').present? }
    @browser.button(id: 'new-user-story').click
    sleep 0.8
    Watir::Wait.until { @browser.option(value: '13').present? }
    @browser.option(value: '13').click
    sleep 0.8
    Watir::Wait.until { @browser.textarea(id: 'user-story-input').present? }
    @browser.textarea(id: 'user-story-input').send_keys(:command, 'a')
    sleep 0.3
    @browser.textarea(id: 'user-story-input').send_keys('As the scrum master, I want to be able to approve and disallow changes made to the product backlog so that confusion does not arise out of what its to be done.')
    sleep 0.8
    @browser.button(id: 'add-user-story').hover
    @browser.button(id: 'add-user-story').click
    sleep 0.8
end

Then('I should see that the user story has been created') do
    Watir::Wait.until { @browser.div(id: 'flash-content').present? }
    sleep 0.8
    Watir::Wait.until { @browser.div(text: 'Change logged!').present? }
    sleep 0.8
end

When('I see if any user stories need approval') do
    Watir::Wait.until { @browser.div(class: 'unapproved').present? }
    sleep 0.8
end

When('I approve all user stories') do
    @browser.divs(class: 'unapproved').each do |s|
        s.click
        sleep 0.8
    end
end

Then('I should not see any unapproved user stories') do
    Watir::Wait.until { @browser.divs(class: 'unapproved').size == 0 }
    sleep 0.8
end

