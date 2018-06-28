Given(/^I am on the sign in page$/) do
  # an issue needs to exist for nav to load
  create(:issue)
  create(:user)
  visit sign_in_path
end
 
When(/^I submit the login form$/) do
  fill_in('session_email', with: 'matt@conteu.com')
  fill_in('session_password', with: 'mypassword')
  click_on 'Sign In'
end
 
Then(/^I should see the text "([^"]*)"$/) do |text|
  expect(page).to have_content text
end
