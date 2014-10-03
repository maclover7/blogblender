class AddNetworkIdToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :network_id, :integer
    add_index :communities, :network_id
  end
end
