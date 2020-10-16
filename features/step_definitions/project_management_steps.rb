Given('I have signed in as a registered user') do
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("tester@testdomain.test")
    @browser.element(id: 'user_password').send_keys('pa$$word')
    @browser.element(value: 'Log in').click
end
Given('I visit the create project page') do
    @browser.goto(@test_base_url + new_project_path)
    @browser.element(id: 'project-name').present?
end
When('I name the project') do
    @browser.element(id: 'project-name').send_keys(:command, 'a')
    @browser.element(id: 'project-name').send_keys('Test Project')
    sleep 0.3
    @browser.button(id: 'next').click
    sleep 0.3
end
When('I check every box for development team subsets') do
    @browser.input(id: 'programmers').click
    sleep 0.3
    @browser.input(id: 'ux_ui_designers').click
    sleep 0.3
    @browser.input(id: 'writers').click
    sleep 0.3
    @browser.input(id: 'testers').click
    sleep 0.3
    @browser.input(id: 'dev_ops').click
    sleep 0.3
    @browser.input(id: 'subject_matter_experts').click
    sleep 0.3
    @browser.input(id: 'legal').click
    sleep 0.3
    @browser.button(id: 'next').click
    sleep 0.3
end
When('I make myself the product owner') do
    @browser.input(id: 'product_owner').click
    sleep 0.3
end
When('I make myself the project manager') do
    @browser.input(id: 'project_manager').click
    sleep 0.3
end
When('I make myself the scrum master') do
    @browser.input(id: 'scrum_master').click
    sleep 0.3
end
When('I make myself a developer') do
    @browser.input(id: 'developer').click
    sleep 0.3
end
When('I specify that I am a programmer') do
    @browser.input(id: 'development_team_subset_programmers').click
    sleep 0.3
end
When('I click create') do
    @browser.button(id: 'create').click
    sleep 0.3
end
Then('I should see my project manager dashboard') do
    @browser.p.present?
end