class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string  :title,         null: false
      t.text    :description
      t.integer :price,         default: 0
      t.string  :image
      t.boolean :native_store,  default: true
      t.integer :quantity,      default: 1
      t.string  :partner_name
      t.string  :partner_link
      t.boolean :featured,      default: false
      t.boolean :displayed,     default: false
      t.integer :sort_order,    default: 1

      t.timestamps
    end
  end
end
