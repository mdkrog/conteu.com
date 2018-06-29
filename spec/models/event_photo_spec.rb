require 'rails_helper'

RSpec.describe EventPhoto, type: :model do
  describe "fields and validation" do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:order) }
  end
end
