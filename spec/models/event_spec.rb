require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "fields and validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:date) }
    it { is_expected.to respond_to(:published) }
    it "has default published set to true" do
      event = build(:event)
      expect(event.published).to be true
    end
  end
end