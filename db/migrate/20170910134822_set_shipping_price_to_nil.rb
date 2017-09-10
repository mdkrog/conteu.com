class SetShippingPriceToNil < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :shipping_option, :integer, default: 0
    rename_column :orders, :shipping_price, :fixed_shipping_price
    change_column :orders, :fixed_shipping_price, :integer, default: -1
  end
end
