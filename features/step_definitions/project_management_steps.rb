Given('I am an registered user') do
    @registered_user = FactoryBot.create(:user,
        :email => "tester@testdomain.test",
        :password => "pa$$word")
end

Given('I visit the create project page') do
    visit new_project_path
end

When('I name the project') do
    fill_in "project[project_name]", :with => 'Test Project'
end

When('I check every box for development team subsets') do 
    check "programmers"
    check "writers"
    check "ux_ui_designers"
    check "testers"
    check "dev_ops"
    check "subject_matter_experts"
    check "legal"
end

When('I make myself the product owner') do 
    check "product_owner"
end

When('I make myself the project manager') do
    check "project_manager"
end

When('I make myself the scrum master') do
    check "scrum_master"
end

When('I make myself a developer') do 
    check "developer"
end

When ('I specify that I am a programmer') do
    sleep 2
    choose('team_subset_programmers', allow_label_click: true)
end

When('I click create') do
    click_button "Create"
end

Then('I should see my project manager dashboard') do
    message = "You have successfully created a new project"
    expect(page).to have_content(message)
end