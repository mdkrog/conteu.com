class ViewPointArtist < ApplicationRecord
  belongs_to :view_point_object

  mount_uploader :artwork, ImageUploader

  def published?
    Date.today >= showcase_date
  end

  def next
    next_artist = self.class.where("showcase_date > ?", showcase_date).first
    if next_artist.nil? || next_artist.showcase_date > Date.today
      nil
    else
      next_artist
    end
  end

  def previous
    self.class.where("showcase_date < ?", showcase_date).last
  end
end
