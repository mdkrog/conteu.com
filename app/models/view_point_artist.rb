class ViewPointArtist < ApplicationRecord
  belongs_to :view_point_object

  mount_uploader :artwork, ImageUploader

  def published?
    Date.today >= showcase_date
  end
end
