class AddLandscapeOptionToViewpoint < ActiveRecord::Migration[5.0]
  def change
    add_column :view_point_artists, :landscape, :boolean, default: false
  end
end
