class AddNumeroDeArtigosToColunas < ActiveRecord::Migration
  def change
    add_column :colunas, :numero_de_artigos, :integer, default: 0
  end
end
