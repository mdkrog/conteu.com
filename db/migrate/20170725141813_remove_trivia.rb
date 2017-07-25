class RemoveTrivia < ActiveRecord::Migration[5.0]
  ViewPointArtist.update_all({ view_point_object_id: 1 })
  def change
    connection.execute 'drop table if exists view_point_trivia'

    add_column :view_point_artists, :trivia, :text
    change_column :view_point_artists, :view_point_object_id, :integer, null: false
  end
end
