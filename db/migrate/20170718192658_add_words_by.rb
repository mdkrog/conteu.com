class AddWordsBy < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :words_by, :string, default: ''
    add_column :stories, :images_by, :string, default: ''
  end
end
