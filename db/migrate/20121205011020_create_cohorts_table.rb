class CreateCohortsTable < ActiveRecord::Migration
  def change
  	create_table :cohorts do |t|
  		t.string :name
  		t.timestamps
  	end

  	remove_column :invitations, :cohort
  	remove_column :houses, :invitation_id
  	remove_column :users, :invitation_id
  	add_column :invitations, :cohort_id, :integer
  	add_column :users, :cohort_id, :integer
    add_column :houses, :cohort_id, :integer
  end
end
