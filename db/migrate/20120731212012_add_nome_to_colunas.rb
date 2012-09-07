class AddNomeToColunas < ActiveRecord::Migration
  def self.up
    add_column :colunas, :nome, :string
  end

  def self.down
    remove_column :colunas, :nome
  end
end
