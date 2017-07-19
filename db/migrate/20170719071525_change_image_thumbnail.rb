class ChangeImageThumbnail < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :image_thumb, :image_store_front
  end
end
