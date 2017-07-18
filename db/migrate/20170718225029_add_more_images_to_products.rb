class AddMoreImagesToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :image_thumb, :string
    add_column :products, :image_alt1, :string
  end
end
