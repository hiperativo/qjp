class AddAssuntoSlugToArtigos < ActiveRecord::Migration
  def change
    add_column :artigos, :assunto_slug, :string
  end
end
