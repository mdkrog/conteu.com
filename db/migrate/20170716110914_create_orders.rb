class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.string :name,     null: false, default: ""
      t.string :email,    null: false, default: "", index: true
      t.string :phone,    null: false, default: ""
      t.string :address,  null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :country, null: false, default: ""
      t.string :order_number
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
