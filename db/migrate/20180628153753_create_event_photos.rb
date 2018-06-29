class CreateEventPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :event_photos do |t|
      t.string :image, null: false
      t.text :description
      t.integer :order, default: 0

      t.belongs_to :event, index: true
      t.timestamps
    end
  end
end
