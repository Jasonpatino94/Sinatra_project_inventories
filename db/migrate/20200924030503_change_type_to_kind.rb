class ChangeTypeToKind < ActiveRecord::Migration
  def change
    rename_column :inventories, :type, :kind
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
