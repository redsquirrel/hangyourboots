class House < ActiveRecord::Base
attr_accessible :title, :address, :description, :maps_link, :rooms,
								:beds, :bathrooms, :capacity, :total_cost

validates :title, :address, :description, :maps_link,
					:rooms, :beds, :bathrooms, :capacity, :total_cost, 		:presence => true

end