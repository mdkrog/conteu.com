class Component < ApplicationRecord
  belongs_to :story
  store :settings

  default_scope { order(order: :asc) }
end
