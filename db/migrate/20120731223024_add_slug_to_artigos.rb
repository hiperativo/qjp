class AddSlugToArtigos < ActiveRecord::Migration
  def self.up
    add_column :artigos, :slug, :string
  end

  def self.down
    remove_column :artigos, :slug
  end
end
