class AddDefaultTimings < ActiveRecord::Migration
  def change
        execute "ALTER TABLE admin_users ALTER created_at SET DEFAULT now()"
        execute "ALTER TABLE admin_users ALTER updated_at SET DEFAULT now()"
  end
end
