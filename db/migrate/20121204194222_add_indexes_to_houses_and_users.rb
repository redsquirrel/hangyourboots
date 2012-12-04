class AddIndexesToHousesAndUsers < ActiveRecord::Migration
  def change
  	add_index :users, :invitation_id
  	add_index :houses, :invitation_id
  end
end
