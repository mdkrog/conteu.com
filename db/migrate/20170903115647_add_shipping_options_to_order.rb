class AddShippingOptionsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shipping_option_id, :integer
  end
end
