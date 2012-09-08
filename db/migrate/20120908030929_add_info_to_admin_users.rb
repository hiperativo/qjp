class AddInfoToAdminUsers < ActiveRecord::Migration
  change_table :admin_users do |t|
  	t.string :nome
  	t.string :avatar
  	t.text :resumo
  end
end
