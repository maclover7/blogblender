class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :slug
      t.string :domain

      t.timestamps
    end
  end
end
