class RemoveShippingOptions < ActiveRecord::Migration[5.0]
  def change
    drop_table :shipping_options
    drop_table :product_shipping_options
  end
end
