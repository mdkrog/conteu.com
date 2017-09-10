class AddFieldsForShipping < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping_option, :integer, default: 0
    add_column :orders, :shipping_price, :integer, default: 0
    add_column :products, :local_shipping_price, :integer, default: 54
    add_column :products, :local_estimated_delivery_time, :string, default: '2 Days'
    add_column :products, :international_shipping_price, :integer, default: 250
    add_column :products, :international_estimated_delivery_time, :string, default: '3 Months'
  end
end
