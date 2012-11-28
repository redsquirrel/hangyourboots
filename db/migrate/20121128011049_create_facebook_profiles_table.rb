class CreateFacebookProfilesTable < ActiveRecord::Migration
  def change
    create_table :facebook_profiles do |t|
      t.integer :user_id, :null => false
      t.string :image
      t.string :url

      t.timestamps
    end
    add_index :facebook_profiles, :user_id, :unique => true
  end
end
