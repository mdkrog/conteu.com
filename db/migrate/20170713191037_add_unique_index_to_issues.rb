class AddUniqueIndexToIssues < ActiveRecord::Migration[5.0]
  def change
    change_column :issues, :issue_number, :string
    add_index_options :issues, [:issue_number], unique: true

  end
end
