class AddCoverImagesToIssue < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :cover_left, :string
    add_column :issues, :cover_right, :string
  end
end
