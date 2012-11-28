class House < ActiveRecord::Base
attr_accessible :title, :address, :description, :maps_link, :rooms,
								:beds, :bathrooms, :capacity, :total_cost, :image

validates :title, :address, :description, :maps_link,
					:rooms, :beds, :bathrooms, :capacity, :total_cost, 		:presence => true

mount_uploader :image, ImageUploader
has_many :commitments
has_many :users, :through => :commitments
end