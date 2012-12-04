class AddInvitationIdToHouses < ActiveRecord::Migration
  def change
  	add_column :houses, :invitation_id, :integer
  end
end
