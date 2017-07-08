class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :issue

  validates_presence_of :title, :issue_id
end
