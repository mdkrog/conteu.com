class Issue < ApplicationRecord
  has_many :stories
  validates_presence_of :title, :issue_number, :release_date
end
