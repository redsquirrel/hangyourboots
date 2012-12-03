class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :house_id, :null => false
      t.string :image

      t.timestamps
    end
  end
end
