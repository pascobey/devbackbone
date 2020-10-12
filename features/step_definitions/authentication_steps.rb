

Given('I visit the sign up page') do
    visit new_user_registration_path
end

When('I fill in the sign up form') do
    # click_link "Sign up"
    fill_in "user_email", :with => "tester@testdomain.test"
    fill_in "user_password", :with => "pa$$word"
    fill_in "user_password_confirmation", :with => "pa$$word"
    click_button "Sign up"
end

When('I confirm the email') do
    open_email("tester@testdomain.test")
    visit_in_email("Confirm my account")
end

Then('I should see that my account is confirmed') do
    message = "Your email address has been successfully confirmed"
    expect(page).to have_content(message)
end



Given('I am a registered user') do
    @registered_user = FactoryBot.create(:user,
                                         :email => "tester@testdomain.test",
                                         :password => "pa$$word")
end

When('I visit the log in page') do 
    visit new_user_session_path
end

When('I fill in the login form') do
    fill_in "user_email",:with => "tester@testdomain.test"
    fill_in "user_password", :with => "pa$$word"
    click_button "Log in"
end

Then('I should be logged in') do
    expect(page).to have_content("Signed in")
end

Given("I am logged in") do
    visit new_user_session_path
    fill_in "user_email", :with => "tester@testdomain.test"
    fill_in "user_password", :with => "pa$$word"
    click_button "Log in"
end

When('I visit the homepage') do 
    visit root_path
end

When('I click on the log out link') do
    click_link "Log out"
end

Then('I should be logged out') do
    expect(page).to have_content("Signed out")
end