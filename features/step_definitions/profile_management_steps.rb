Given('I have signed in as an authenticated user') do
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

Given('I visit the edit profile page') do
    @browser.goto(@test_base_url + edit_profile_path(1))
    Watir::Wait.until { @browser.element(id: 'edit-profile-header').present? }
end

When('I fill in my name and phone number') do
    # Watir::Wait.until { @browser.text_field(id: 'first-name').present? }
    @browser.text_field(id: 'first-name').set('Bob')
    sleep 0.8
    # Watir::Wait.until { @browser.text_field(id: 'last-name').present? }
    @browser.text_field(id: 'last-name').set('Tester')
    sleep 0.8
    # Watir::Wait.until { @browser.text_field(id: 'phone-number').present? }
    @browser.text_field(id: 'phone-number').set('9015906456')
    sleep 0.8
end

When('I upload a profile image') do
    # Watir::Wait.until { @browser.file_field(id: 'profile-image-upload').present? }
    @browser.file_field(id: 'profile-image-upload').set(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/development_data/tester.jpg')
    sleep 0.8
end

When('I enter a bio') do
    # Watir::Wait.until { @browser.text_field(id: 'user-bio').present? }
    @browser.text_field(id: 'user-bio').set('Software Testing Expert')
    sleep 0.8
end

When('I enter my external links') do
    @browser.text_field(id: 'externals-github-address').send_keys(:command, 'a')
    sleep 0.2
    @browser.text_field(id: 'externals-github-address').set('github.com')
    sleep 0.8
    @browser.text_field(id: 'externals-twitter-address').send_keys(:command, 'a')
    sleep 0.2
    @browser.text_field(id: 'externals-twitter-address').set('twitter.com')
    sleep 0.8
    @browser.text_field(id: 'externals-facebook-address').send_keys(:command, 'a')
    sleep 0.2
    @browser.text_field(id: 'externals-facebook-address').set('facebook.com')
    sleep 0.8
    @browser.text_field(id: 'externals-instagram-address').send_keys(:command, 'a')
    sleep 0.2
    @browser.text_field(id: 'externals-instagram-address').set('instagram.com')
    sleep 0.8
    @browser.text_field(id: 'externals-site-address').send_keys(:command, 'a')
    sleep 0.2
    @browser.text_field(id: 'externals-site-address').set('changed-website.com')
    sleep 0.8
end

When('I click save') do
    Watir::Wait.until { @browser.element(type: 'submit').present? }
    @browser.element(type: 'submit').click
end

Then('I should see the changes reflected in my profile') do
    Watir::Wait.until { @browser.element(id: 'show-profile-header').present? }
end


When('I visit the show profile page') do
    pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see my profile') do
    pending # Write code here that turns the phrase above into concrete actions
end