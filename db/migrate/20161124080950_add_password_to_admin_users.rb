class AddPasswordToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :password, :string
  end
end
