class AddFriendsName < ActiveRecord::Migration[5.0]
  def change
    add_column :friend_products, :partner_name, :string
    rename_column :friend_products, :link, :partner_link
  end
end
