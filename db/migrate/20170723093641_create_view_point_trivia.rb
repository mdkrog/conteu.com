class CreateViewPointTrivia < ActiveRecord::Migration[5.0]
  def change
    create_table :view_point_trivia do |t|
      t.integer :view_point_object_id, index: true
      t.text :description
      t.date :showcase_date

      t.timestamps
    end
  end
end
