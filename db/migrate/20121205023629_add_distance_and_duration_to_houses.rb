class AddDistanceAndDurationToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :distance, :string
    add_column :houses, :duration, :string
  end
end
