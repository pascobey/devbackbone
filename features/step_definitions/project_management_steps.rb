# Given('I am an authenticated user') do
#     @registered_user = FactoryBot.create(:user,
#         :email => "tester@testdomain.test",
#         :password => "pa$$word")
# end
  

# Given('I visit the create project page') do
#     visit new_project_path
# end
# When('I fill out the create project form') do
#     fill_in "project_name", :with => 'Test Project'

#     check "product_owner_no"
#     fill_in "project_owner_first_name", :with => "Paul"
#     fill_in "product_owner_last_name", :with => "Garland"
#     fill_in "product_owner_email", :with => "pgarland@testdomain.test"

#     check "project_manager_yes"
#     check "scrum_master_yes"

#     check "programmers"
#     check "writers"
#     check "ux_ui_designers"
#     check "testers"
#     check "delivery_integration"
#     check "subject_matter_experts"
#     check "legal"

#     check "on_development_team"
#     click_button "programmer"

#     click_button "Create"
# end
# Then('I should see my project manager dashboard') do
#     message = "You have successfully created a new project"
#     expect(page).to have_content(message)
# end



# Given('I visit my project manager dashboard') do
#     visit project_path(Project.find_by(project_name: "Test Project").id)
# end

# When('I click the additional options button') do
#     pending # Write code here that turns the phrase above into concrete actions
# end

# When('I click then delete project button') do
#     pending # Write code here that turns the phrase above into concrete actions
# end

# When('I confirm that I am okay with losing all project data') do
#     pending # Write code here that turns the phrase above into concrete actions
# end

# Then('I should see that the project has been deleted') do
#     pending # Write code here that turns the phrase above into concrete actions
# end