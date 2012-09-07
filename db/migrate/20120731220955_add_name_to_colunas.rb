class AddNameToColunas < ActiveRecord::Migration
  def self.up
    add_column :colunas, :name, :string
  end

  def self.down
    remove_column :colunas, :name
  end
end
