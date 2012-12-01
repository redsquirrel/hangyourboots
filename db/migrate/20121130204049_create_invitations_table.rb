class CreateInvitationsTable < ActiveRecord::Migration
  def change
  	create_table :invitations do |t|
  		t.string :code
  		t.datetime :expires_at
  		t.timestamps
  	end
  	add_index :invitations, :code, :unique => true
  end
end
