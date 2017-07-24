class ViewPointObject < ApplicationRecord
  has_many :view_point_trivia
  has_many :view_point_artists

  validates_presence_of :name
end
