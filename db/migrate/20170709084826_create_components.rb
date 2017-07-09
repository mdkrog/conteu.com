class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.string :type, null: false
      t.integer :story_id, null: false
      t.integer :order
      t.text :settings

      t.timestamps
    end
  end
end
