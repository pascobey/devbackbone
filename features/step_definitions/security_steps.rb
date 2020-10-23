When('I visit the edit profile page with an id not matching that of my profile') do
    @browser.goto(@test_base_url + edit_profile_path(1))
end
Then('I should be redirected to my edit profile page') do
    Watir::Wait.until { @browser.element(id: 'flash-content').present? }
end


When('I visit the show project page of a project I am not a part of') do
    @browser.goto(@test_base_url + project_path(2))
end
Then('I should be redirected to the site root') do
    Watir::Wait.until { @browser.element(id: 'flash-content').present? }
    sleep 10
end