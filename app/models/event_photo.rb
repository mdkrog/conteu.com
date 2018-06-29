class EventPhoto < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :event

  validates_presence_of(:image)
  default_scope { order(order: :asc) }
end
