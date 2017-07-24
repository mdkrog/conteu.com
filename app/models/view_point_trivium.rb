class ViewPointTrivium < ApplicationRecord
  belongs_to :view_point_object

  def published?
    Date.today <= showcase_date ? true : false
  end
end
