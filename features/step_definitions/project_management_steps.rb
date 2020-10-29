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
    Watir::Wait.until { @browser.h1(id: 'show-project-header').present? }
end


Given('I am the product owner of a project with improper leadership') do
    # lets assume the tester makes and owns the first project
end
When('I visit the show project page') do
    @browser.goto(@test_base_url + project_path(1))
    Watir::Wait.until { @browser.h1(id: 'show-project-header').present? }
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


When('I see click the scrum details button') do
    Watir::Wait.until { @browser.button(id: 'scrum-details-button').present? }
    @browser.button(id: 'scrum-details-button').click
    sleep 0.8
end
When('I see the scrum details') do
    Watir::Wait.until { @browser.element(id: 'scrum-details-header').present? }
end
When('I set the sprint timeframe') do
    Watir::Wait.until { @browser.input(id: 'start-date-month').present? }
    @browser.input(id: 'start-date-month').double_click
    @browser.input(id: 'start-date-month').set('11')
    Watir::Wait.until { @browser.input(id: 'start-date-day').present? }
    @browser.input(id: 'start-date-day').double_click
    @browser.input(id: 'start-date-day').set('1')
    Watir::Wait.until { @browser.input(id: 'start-date-year').present? }
    @browser.input(id: 'start-date-year').double_click
    @browser.input(id: 'start-date-year').set('2020')
    Watir::Wait.until { @browser.input(id: 'end-date-month').present? }
    @browser.input(id: 'end-date-month').double_click
    @browser.input(id: 'end-date-month').set('11')
    Watir::Wait.until { @browser.input(id: 'end-date-day').present? }
    @browser.input(id: 'end-date-day').double_click
    @browser.input(id: 'end-date-day').set('1')
    Watir::Wait.until { @browser.input(id: 'end-date-year').present? }
    @browser.input(id: 'end-date-year').double_click
    @browser.input(id: 'end-date-year').set('2020')
    sleep 0.8
end
When('I set the daily scrum meeting time') do
    Watir::Wait.until { @browser.input(id: 'daily-scrum-time-hour').present? }
    @browser.input(id: 'daily-scrum-time-hour').double_click
    @browser.input(id: 'daily-scrum-time-hour').set('10')
    Watir::Wait.until { @browser.input(id: 'daily-scrum-time-minute').present? }
    @browser.input(id: 'daily-scrum-time-minute').double_click
    @browser.input(id: 'daily-scrum-time-minute').set('00')
    sleep 0.8
end
When('I schedule the sprint review meeting') do
    Watir::Wait.until { @browser.input(id: 'sprint-review-time').present? }
    @browser.input(id: 'sprint-review-time').double_click
    @browser.input(id: 'sprint-review-time').set('10')
    Watir::Wait.until { @browser.input(id: 'sprint-review-time').present? }
    @browser.input(id: 'sprint-review-time').double_click
    @browser.input(id: 'sprint-review-time').set('00')
    sleep 0.8
end
Then('I should be notified that the scrum details have changed') do
    Watir::Wait.until { @browser.div(id: 'flash-content').present? }
    Watir::Wait.until { @browser.div(text: 'Changes Successfully Saved!').present? }
end


Given('I am the product owner') do
    # lets assume the tester makes and owns the first project
end
When('I click the team details button') do
    Watir::Wait.until { @browser.button(id: 'team-details-button').present? }
    @browser.button(id: 'team-details-button').click
    sleep 0.8
end
When('I see the team details') do
    Watir::Wait.until { @browser.element(id: 'team-details-header').present? }
end
When('I have editing priviledges') do
    Watir::Wait.until { @browser.button(value: 'edit').present? }
end
When('I change a leader') do
    Watir::Wait.until { @browser.button(id: 'change-scrum-master').present? }
    @browser.button(id: 'change-scrum-master').click
    Watir::Wait.until { @browser.text_field(id: 'scrum-master-search').present? }
    @browser.text_field(id: 'scrum-master-search').set('Kevin Skoglund')
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'make-Kevin-Skoglund-scrum-master').present? }
    sleep 0.8
    @browser.button(id: 'make-Kevin-Skoglund-scrum-master').click
    Watir::Wait.until { @browser.p(id: 'scrum-master-Kevin-Skoglund') }
    Watir::Wait.until { @browser.button(id: 'change-scrum-master').present? }
    sleep 0.8
    @browser.button(id: 'change-scrum-master').click
    sleep 0.8
end
When('I edit a team') do
    Watir::Wait.until { @browser.button(id: 'edit-programmers').present? }
    @browser.button(id: 'edit-programmers').click
    Watir::Wait.until { @browser.text_field(id: 'programmers-search').present? }
    @browser.text_field(id: 'programmers-search').set('creator of Ruby on Rails')
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'add-David-HeinemeierHansson-to-programmers').present? }
    sleep 0.8
    @browser.button(id: 'add-David-HeinemeierHansson-to-programmers').click
    Watir::Wait.until { @browser.button(id: 'remove-David-HeinemeierHansson-from-programmers').present? }
    sleep 0.8
    Watir::Wait.until { @browser.button(id: 'edit-programmers').present? }
    @browser.button(id: 'edit-programmers').click
end
When('I click the save changes button') do
    Watir::Wait.until { @browser.input(value: 'save changes').present? }
    @browser.input(value: 'save changes').click
end
Then('I should be notified that the team details have changed') do
    Watir::Wait.until { @browser.div(id: 'flash-content').present? }
    Watir::Wait.until { @browser.div(text: 'Changes Successfully Saved!').present? }
end
