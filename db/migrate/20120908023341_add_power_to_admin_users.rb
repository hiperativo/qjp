class AddPowerToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :power, :integer
  end
end
