class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :name, :unique => true
      t.string :password

      t.timestamps null: false
    end

    
    execute "ALTER TABLE admin_users ALTER created_at SET DEFAULT now()"
    execute "ALTER TABLE admin_users ALTER updated_at SET DEFAULT now()"
  end

end
