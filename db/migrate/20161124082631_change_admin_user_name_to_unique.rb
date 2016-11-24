class ChangeAdminUserNameToUnique < ActiveRecord::Migration
  def change
    add_index :admin_users, [:name], :unique => true
  end
end
