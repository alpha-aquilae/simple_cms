class AlterAdminUsers < ActiveRecord::Migration

  def self.up
    rename_table("admin_users", "users")
    add_column("users", "admin", :boolean)
    add_column("users", "captain", :boolean)
    add_index("users", "username")
  end

  def self.down
    remove_index("admin_users", "username")
    remove_column("admin_users", "salt")
    rename_column("admin_users", "hashed_password", "password")
    change_column("admin_users", "email", :string, :default => "", :null => false)
    remove_column("admin_users", "username")
    rename_table("admin_users", "users")
  end

end
