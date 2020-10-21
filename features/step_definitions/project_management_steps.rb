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
When('I make myself the project manager') do
    Watir::Wait.until { @browser.input(id: 'project_manager').present? }
    @browser.input(id: 'project_manager').click
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
Then('I should see my project manager dashboard') do
    Watir::Wait.until { @browser.h1(id: 'show-project-header').present? }
end


Given('I am the product owner of a project with improper leadership') do
    # lets assume the tester makes and owns the first project
end
When('I visit the show project page') do
    @browser.goto(@test_base_url + project_path(1))
    Watir::Wait.until { @browser.h1(id: 'show-project-header').present? }
end
Then('I should be notified that my project manager and scrum master are the same person') do
    Watir::Wait.until { @browser.element(id: 'backbone-weaknesses').present? }
    Watir::Wait.until { @browser.p(class: 'weakness').present? }
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
    sleep 10
end
When('I edit a team') do
    pending
end
Then('I should be notified that the team details have changed') do
    pending
end
