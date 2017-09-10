class DropShippingOptionIdField < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :shipping_option_id
  end
end
