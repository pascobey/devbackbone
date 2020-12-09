Given('I visit the sign up page') do
    @browser.goto(@test_base_url + new_user_registration_path)
    Watir::Wait.until { @browser.element(id: 'sign-up-header').present? }
end
When('I fill in the sign up form') do
    Watir::Wait.until { @browser.text_field(id: 'user_email').present? }
    @browser.text_field(id: 'user_email').set("tester@testdomain.test")
    Watir::Wait.until { @browser.text_field(id: 'user_password').present? }
    @browser.text_field(id: 'user_password').set('pa$$word')
    Watir::Wait.until { @browser.text_field(id: 'user_password_confirmation').present? }
    @browser.text_field(id: 'user_password_confirmation').set('pa$$word')
    Watir::Wait.until { @browser.element(value: 'Sign up').present? }
    @browser.element(value: 'Sign up').click
    Watir::Wait.until { @browser.element(text: 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.') }
end
When('I confirm the email') do
    sleep 2
    @browser.goto "file://#{Dir.glob(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/tmp/letter_opener/**/rich.html').first}"
    Watir::Wait.until { @browser.iframe.a(text: 'Confirm my account').present? }
    @browser.iframe.a(text: 'Confirm my account').click
    sleep 2
    @browser.goto(@test_base_url + new_user_session_path)
    Watir::Wait.until { @browser.text_field(id: 'user_email').present? }
    @browser.text_field(id: 'user_email').set("tester@testdomain.test")
    Watir::Wait.until { @browser.text_field(id: 'user_password').present? }
    @browser.text_field(id: 'user_password').set('pa$$word')
    Watir::Wait.until { @browser.element(value: 'Log in').present? }
    @browser.element(value: 'Log in').click
end
Then('I should see that my account is confirmed') do
    Watir::Wait.until { @browser.div(id: 'flash-content').present? }
end


Given('I visit the log in page') do 
    @browser.goto(@test_base_url + new_user_session_path)
    Watir::Wait.until { @browser.element(id: 'sign-in-header').present? }
end
When('I fill in the login form') do
    Watir::Wait.until { @browser.text_field(id: 'user_email').present? }
    @browser.text_field(id: 'user_email').set("tester@testdomain.test")
    Watir::Wait.until { @browser.text_field(id: 'user_password').present? }
    @browser.text_field(id: 'user_password').set('pa$$word')
    Watir::Wait.until { @browser.element(value: 'Log in').present? }
    @browser.element(value: 'Log in').click
end
Then('I should be logged in') do
    Watir::Wait.until { @browser.div(id: 'flash-content').present? }
end


Given("I am logged in") do
    @browser.goto(@test_base_url + new_user_session_path)
    Watir::Wait.until { @browser.text_field(id: 'user_email').present? }
    @browser.text_field(id: 'user_email').set("tester@testdomain.test")
    Watir::Wait.until { @browser.text_field(id: 'user_password').present? }
    @browser.text_field(id: 'user_password').set('pa$$word')
    Watir::Wait.until { @browser.element(value: 'Log in').present? }
    @browser.element(value: 'Log in').click
end
When('I visit the homepage') do 
    @browser.goto(@test_base_url)
    Watir::Wait.until { @browser.a(id: 'profile').present? }
    @browser.a(id: 'profile').click
end
When('I click on the log out link') do
    @browser.a(id: 'sign-out').click
end
Then('I should be logged out') do
    Watir::Wait.until { @browser.a(id: 'sign-in').present? }
end
