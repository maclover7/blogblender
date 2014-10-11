class AddEntryIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :entry_id, :integer
    add_index :comments, :entry_id
  end
end
