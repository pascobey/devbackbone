Given('I have signed in as an authenciated user') do
    @browser.goto(@test_base_url + new_user_session_path)
    @browser.element(id: 'user_email').send_keys("tester@testdomain.test")
    @browser.element(id: 'user_password').send_keys('pa$$word')
    @browser.element(value: 'Log in').click
end

Given('I visit the edit profile page') do
    @browser.goto(@test_base_url + edit_profile_path(1))
    @browser.element(id: 'edit-profile-header').present?
end

When('I fill in my name and phone number') do
    @browser.element(id: 'first-name').send_keys(:command, 'a')
    @browser.element(id: 'first-name').send_keys('Bob')
    @browser.element(id: 'last-name').send_keys(:command, 'a')
    @browser.element(id: 'last-name').send_keys('Tester')
    @browser.element(id: 'phone-number').send_keys(:command, 'a')
    @browser.element(id: 'phone-number').send_keys('9015906456')
end

When('I upload a profile image') do
    @browser.file_field(id: 'profile-image-upload').set(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/test/data/IMG_0667.jpg')
end

When('I enter a bio') do
    @browser.element(id: 'bio').send_keys(:command, 'a')
    @browser.element(id: 'bio').send_keys('Software Testing Expert')
end

When('I enter my external links') do
    @browser.element(id: 'github-address').send_keys(:command, 'a')
    @browser.element(id: 'github-address').send_keys('github.com')
    @browser.element(id: 'twitter-address').send_keys(:command, 'a')
    @browser.element(id: 'twitter-address').send_keys('twitter.com')
    @browser.element(id: 'facebook-address').send_keys(:command, 'a')
    @browser.element(id: 'facebook-address').send_keys('facebook.com')
    @browser.element(id: 'instagram-address').send_keys(:command, 'a')
    @browser.element(id: 'instagram-address').send_keys('instagram.com')
    @browser.element(id: 'site-address').send_keys(:command, 'a')
    @browser.element(id: 'site-address').send_keys('changed-website.com')
end

When('I click save') do
    @browser.button(id: 'save').click
end

Then('I should see the changes reflected in my profile') do
    @browser.element(id: 'edit-profile-header').present?
    sleep 1000
end