class AddUserIdToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :user_id, :intenger
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
