class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :image_alt1, ImageUploader
  mount_uploader :image_store_front, ImageUploader
  validates_presence_of :title
end
