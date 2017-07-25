class ViewPointArtist < ApplicationRecord
  belongs_to :view_point_object

  mount_uploader :artwork, ImageUploader

  def published?
    Date.today >= showcase_date && self.view_point_object.displayed?
  end

  def next
    next_artist = self.class.where("showcase_date > ?", showcase_date).first
    if next_artist.nil? || next_artist.showcase_date > Date.today || !next_artist.view_point_object.displayed?
      nil
    else
      next_artist
    end
  end

  def previous

    previous_artist = self.class.where("showcase_date < ?", showcase_date).first
    if previous_artist.nil? || !previous_artist.view_point_object.displayed?
      nil
    else
      previous_artist
    end
  end
end
