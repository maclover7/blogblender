class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.string :domain
      t.string :twitter_name
      t.string :facebook_url

      t.timestamps
    end
  end
end
