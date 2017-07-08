class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :title, null: false
      t.integer :issue_number, null: false
      t.boolean :published, default: false
      t.date :release_date

      t.timestamps
    end
  end
end
