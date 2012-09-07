class AddLoginToAdminUsers < ActiveRecord::Migration
  def self.up
    add_column :admin_users, :login, :string
  end

  def self.down
    remove_column :admin_users, :login
  end
end
