class AddListingToHouses < ActiveRecord::Migration
  def change
	add_column :houses, :listing, :string
  end
end
