class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
