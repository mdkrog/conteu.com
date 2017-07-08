class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.integer :issue_id, null: false
      t.integer :author_id
      t.string :slug
      t.integer :page_number
      t.integer :contents_layout
      t.text :contents_page_blurb
      t.string :contents_page_image

      t.timestamps
    end
  end
end
