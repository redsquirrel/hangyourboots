class RemoveMapsLinkFromHouses < ActiveRecord::Migration
  remove_column :houses, :maps_link
end
