require 'rails_helper'

RSpec.describe 'Create event' do
  describe "when user fills in new event form" do
    before(:all) do
      # an issue needs to exist for nav to load
      create(:issue)
    end
    it "creates a new event" do
      user = create(:user)
      visit new_event_path(as: user)

      fill_in 'event_name', with: 'My event name'
      fill_in 'event_description', with: 'This was a really cool event'
      fill_in 'event[date]', with: Date.today
      click_button 'Save'

      expect(page).to have_css '.event-name', 'My event name'
    end
  end
end