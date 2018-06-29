class AddCoverImageToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :cover_image, :string
  end
end
