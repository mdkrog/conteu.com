class CreateProductShippingOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :product_shipping_options do |t|
      t.belongs_to :product, index: true
      t.belongs_to :shipping_option, index: true

      t.timestamps
    end
  end
end
