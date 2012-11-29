class CreateCommitmentsTable < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :house_id
      t.integer :user_id, :unique => true
      t.timestamps
    end

    add_index :commitments, [:user_id,:house_id], :unique => true
  end
end
