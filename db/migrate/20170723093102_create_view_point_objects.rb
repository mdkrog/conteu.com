class CreateViewPointObjects < ActiveRecord::Migration[5.0]
  def change
    create_table :view_point_objects do |t|
      t.string :name, null: false
      t.boolean :displayed, default: false

      t.timestamps
    end
  end
end
