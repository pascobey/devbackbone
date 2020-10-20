Given('I have signed in as an authenciated user') do
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("tester@testdomain.test")
    @browser.element(id: 'user_password').send_keys('pa$$word')
    @browser.element(value: 'Log in').click
end

Given('I visit the edit profile page') do
    @browser.goto(@test_base_url + edit_profile_path(1))
    # @browser.element(id: 'edit-profile-header').present?
end

When('I fill in my name and phone number') do
    @browser.element(id: 'first-name').send_keys(:command, 'a')
    @browser.element(id: 'first-name').send_keys('Bob')
    sleep 1
    @browser.element(id: 'last-name').send_keys(:command, 'a')
    @browser.element(id: 'last-name').send_keys('Tester')
    sleep 1
    @browser.element(id: 'phone-number').send_keys(:command, 'a')
    @browser.element(id: 'phone-number').send_keys('9015906456')
    sleep 1
end

When('I upload a profile image') do
    @browser.file_field(id: 'profile-image-upload').set(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/development_data/tester.jpg')
    sleep 1
end

When('I enter a bio') do
    @browser.element(id: 'user-bio').send_keys(:command, 'a')
    @browser.element(id: 'user-bio').send_keys('Software Testing Expert')
    sleep 1
end

When('I enter my external links') do
    @browser.element(id: 'externals-github-address').send_keys(:command, 'a')
    @browser.element(id: 'externals-github-address').send_keys('github.com')
    sleep 1
    @browser.element(id: 'externals-twitter-address').send_keys(:command, 'a')
    @browser.element(id: 'externals-twitter-address').send_keys('twitter.com')
    sleep 1
    @browser.element(id: 'externals-facebook-address').send_keys(:command, 'a')
    @browser.element(id: 'externals-facebook-address').send_keys('facebook.com')
    sleep 1
    @browser.element(id: 'externals-instagram-address').send_keys(:command, 'a')
    @browser.element(id: 'externals-instagram-address').send_keys('instagram.com')
    sleep 1
    @browser.element(id: 'externals-site-address').send_keys(:command, 'a')
    @browser.element(id: 'externals-site-address').send_keys('changed-website.com')
    sleep 1
end

When('I click save') do
    @browser.element(type: 'submit').click
end

Then('I should see the changes reflected in my profile') do
    # @browser.element(id: 'edit-profile-header').present?
    sleep 5
end