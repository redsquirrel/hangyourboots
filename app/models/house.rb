class House < ActiveRecord::Base
  attr_accessible :title, :address, :description, :maps_link, :rooms,
  								:beds, :bathrooms, :capacity, :total_cost, :image

  validates :title, :address, :description, :maps_link,
  					:rooms, :beds, :bathrooms, :capacity, :total_cost,
            :presence => true

  has_many :commitments
  has_many :users, :through => :commitments
  has_many :assets

  def full?
    commitments.size == capacity
  end

  def roommates
    users
  end

  def people_committed
    commitments.size
  end

end
