class AddPublicoToArtigos < ActiveRecord::Migration
  def change
    add_column :artigos, :publico, :boolean
  end
end
