class Story < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :issue
  has_many :components

  mount_uploader :contents_page_image, ImageUploader

  validates_presence_of :title, :issue_id
  accepts_nested_attributes_for :components, reject_if: :all_blank, allow_destroy: true

  ContentsLayoutIcon = Struct.new(:id, :image)
  CONTENTS_LAYOUTS = [ContentsLayoutIcon.new(1, "layout-1.gif")]

  default_scope { order(page_number: :asc) }
end
