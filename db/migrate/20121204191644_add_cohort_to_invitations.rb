class AddCohortToInvitations < ActiveRecord::Migration
  def change
  	add_column :invitations, :cohort, :string, :null => false, :default => "Please add a cohort"
  end
end
