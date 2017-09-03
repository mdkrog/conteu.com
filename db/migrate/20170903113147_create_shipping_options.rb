class CreateShippingOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :shipping_options do |t|
      t.string :name, null: false
      t.integer :price, null: false, default: 0
      t.string :estimated_delivery
      t.integer :country_limitations, default: 0
      t.string :additional_info

      t.timestamps
    end
  end
end
