class CreateHousesTable < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :title
      t.string :address, :null => false
      t.text :description
      t.string :maps_link
      t.integer :rooms
      t.integer :beds
      t.integer :capacity
      t.integer :total_cost, :null => false

      t.timestamps
    end
  end
end
