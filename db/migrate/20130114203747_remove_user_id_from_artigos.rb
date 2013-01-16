class RemoveUserIdFromArtigos < ActiveRecord::Migration
  def up
  	remove_column :artigos, :user_id
  end

  def down
  end
end
