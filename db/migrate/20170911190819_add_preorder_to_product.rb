class AddPreorderToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :preorder, :boolean, default: false
    add_column :products, :preorder_dispatch_date, :date
  end
end
