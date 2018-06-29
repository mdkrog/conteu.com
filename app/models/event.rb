class Event < ApplicationRecord
  mount_uploader :cover_image, ImageUploader
  has_many :event_photos
  
  validates_presence_of(:name)
  accepts_nested_attributes_for :event_photos, reject_if: :all_blank, allow_destroy: true
end
