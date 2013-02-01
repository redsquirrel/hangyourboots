class AddDbcLocationToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :dbc_location, :string
  end
end
