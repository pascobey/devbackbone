Given('I visit the sign up page') do
    @browser.goto(@test_base_url + new_user_registration_path)
end
When('I fill in the sign up form') do
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(id: 'user_password_confirmation').send_keys(@user_password)
    @browser.element(value: 'Sign up').click
end
When('I confirm the email') do
    # MUST BE MANUALlY CONFIRMED IN BROWSER!!!
    sleep 5
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(value: 'Log in').click
end
Then('I should see that my account is confirmed') do
    @browser.a(id: 'sign-out').click
end


Given('I am a registered user') do
    @browser.goto(@test_base_url + new_user_registration_path)
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(id: 'user_password_confirmation').send_keys(@user_password)
    @browser.element(value: 'Sign up').click
    # MUST BE MANUALlY CONFIRMED IN BROWSER!!!
    sleep 5
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(value: 'Log in').click
    @browser.a(id: 'sign-out').click
end
When('I visit the log in page') do 
    @browser.goto(@test_base_url + new_user_session_path)
end
When('I fill in the login form') do
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(value: 'Log in').click
end
Then('I should be logged in') do
    @browser.a(id: 'sign-out').click
end


Given("I am logged in") do
    @browser.goto(@test_base_url + new_user_registration_path)
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(id: 'user_password_confirmation').send_keys(@user_password)
    @browser.element(value: 'Sign up').click
    # MUST BE MANUALlY CONFIRMED IN BROWSER!!!
    sleep 5
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(value: 'Log in').click
    @browser.a(id: 'sign-out').click
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("#{@user_email}@testdomain.test")
    @browser.element(id: 'user_password').send_keys(@user_password)
    @browser.element(value: 'Log in').click
end
When('I visit the homepage') do 
    @browser.goto(@test_base_url)
end
When('I click on the log out link') do
    @browser.a(id: 'sign-out').click
end
Then('I should be logged out') do
    @browser.a(id: 'sign-in').click
end
