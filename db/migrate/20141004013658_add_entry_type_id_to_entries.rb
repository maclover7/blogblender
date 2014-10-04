class AddEntryTypeIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :entry_type_id, :integer
    add_index :entries, :entry_type_id
  end
end
