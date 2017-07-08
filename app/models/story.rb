class Story < ApplicationRecord
  belongs_to :issue

  validates_presence_of :title, :issue_id
end
