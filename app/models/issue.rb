class Issue < ApplicationRecord
  extend FriendlyId
  friendly_id :issue_number

  has_many :stories
  validates_presence_of :title, :issue_number, :release_date
  validates_uniqueness_of :title, :issue_number
end
