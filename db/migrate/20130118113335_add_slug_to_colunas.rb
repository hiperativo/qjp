class AddSlugToColunas < ActiveRecord::Migration
  def change
    add_column :colunas, :slug, :string
  end
end
