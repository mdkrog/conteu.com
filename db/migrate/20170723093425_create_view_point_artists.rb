class CreateViewPointArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :view_point_artists do |t|
      t.integer :view_point_object_id, index: true
      t.string :artwork
      t.text :description
      t.string :artist_name
      t.string :artist_website
      t.string :artist_instagram
      t.date :showcase_date

      t.timestamps
    end
  end
end
