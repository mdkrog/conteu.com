require 'rails_helper'

describe 'Create event', type: :feature do
  describe "when user fills in new event form" do
    before(:all) do
      # an issue needs to exist for nav to load
      create(:issue)
      @user = create(:user)
    end

    it "creates a new event" do
      visit new_event_path(as: @user)

      fill_in 'event_name', with: 'My event name'
      fill_in 'event_description', with: 'This was a really cool event'
      fill_in 'event[date]', with: Date.today
      # attach_file("event_cover_image", Rails.root + "spec/fixtures/capybara.jpg")
      click_button 'Save'
      
      expect(page).to have_css '.event-name', 'My event name'
    end
    
    it "creates a new event with photos", js: true do
      visit new_event_path(as: @user)
      
      fill_in 'event_name', with: 'Another event name'
      fill_in 'event_description', with: 'This was a really cool event'
      fill_in 'event[date]', with: Date.today
      click_link 'Add Photo'
      page.all(:css, '#components input[type="file"]').each do |el|
        el.set "#{Rails.root + 'spec/fixtures/capybara.jpg'}"
      end
      click_button 'Save'

      expect(page).to have_css '.event-name', 'Another event name'
      expect(page).to have_selector '.event-photos img'
    end
  end
end