Given("I am on the admin page") do
  # an issue needs to exist for nav to load
  create(:event, name: 'Event 1')
  create(:event, name: 'Event 2')
  create(:issue)
  user = create(:user)
  visit admin_path(as: user)
end
 
When("I click the events tab") do
  click_on 'Events'
end
 
Then("I should see a list of events") do
  expect(page).to have_text "Event 1"
  expect(page).to have_text "Event 2"
end
