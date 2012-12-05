class House < ActiveRecord::Base
  attr_accessible :title, :address, :description, :maps_link, :rooms,
  								:beds, :bathrooms, :capacity, :total_cost, :assets_attributes

  validates :title, :address, :description, :maps_link,
  					:rooms, :beds, :bathrooms, :capacity, :total_cost,
            :presence => true

  belongs_to :user
  has_many :commitments
  has_many :users, :through => :commitments
  has_many :assets

  accepts_nested_attributes_for :assets, :allow_destroy => true

  def full?
    commitments.size == capacity
  end

  def roommates
    users
  end

  def people_committed
    commitments.size
  end

  def distance
    begin
      Distance.calculate(self.address)[:distance]
    rescue
      "no data"
    end
  end

  def duration
    begin
      Distance.calculate(self.address)[:duration]
    rescue
      "no data"
    end
  end

end
