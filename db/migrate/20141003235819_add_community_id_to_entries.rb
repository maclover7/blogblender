class AddCommunityIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :community_id, :integer
    add_index :entries, :community_id
  end
end
