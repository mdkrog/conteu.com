class AddImageAndBlurbToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :blurb, :text
    add_column :issues, :cover_thumbnail, :string
  end
end
