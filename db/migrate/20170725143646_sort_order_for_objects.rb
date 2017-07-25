class SortOrderForObjects < ActiveRecord::Migration[5.0]
  def change
    add_column :view_point_objects, :sort_order, :integer, default: 0
  end
end
