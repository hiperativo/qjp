class AddColunaIdToArtigos < ActiveRecord::Migration
  def self.up
    add_column :artigos, :coluna_id, :integer
  end

  def self.down
    remove_column :artigos, :coluna_id
  end
end
