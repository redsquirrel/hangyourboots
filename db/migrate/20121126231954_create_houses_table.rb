class CreateHousesTable < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :title
      t.string :address
      t.text :description
      t.string :maps_link
      t.integer :rooms
      t.integer :beds
      t.integer :capacity
      t.integer :total_cost
      t.integer :distance_miles

      t.timestamps
    end
  end
end
