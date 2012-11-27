class AddBathroomToHouse < ActiveRecord::Migration
  def change
  	add_column :houses, :bathrooms, :integer
  end
end
