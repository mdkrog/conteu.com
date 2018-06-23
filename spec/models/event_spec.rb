require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "correct fields present" do
    it "does something" do
      event = Event.new(name: 'Flight', date: Date.new())
      expect(event.name).to eq('Flight')
    end
  end
end