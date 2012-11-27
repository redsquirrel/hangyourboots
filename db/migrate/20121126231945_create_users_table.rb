class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :gender
      t.text  :bio
      t.timestamps
    end
  end
end
