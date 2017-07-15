class CreateFriendProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_products do |t|
      t.string :title, null: false
      t.text :description
      t.string :image
      t.string :price
      t.string :link
      t.boolean :displayed, default: false
      t.integer :sort_order, default: 0

      t.timestamps
    end
  end
end
