class AddAuthorIdToArtigos < ActiveRecord::Migration
  def change
    add_column :artigos, :author_id, :integer
  end
end
