class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :image_alt1, ImageUploader
  mount_uploader :image_thumb, ImageUploader
  validates_presence_of :title
end
