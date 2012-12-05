require 'distance'

class House < ActiveRecord::Base
  before_create :calculate_distance_and_duration

  attr_accessible :title, :address, :description, :maps_link, :rooms,
  								:beds, :bathrooms, :capacity, :total_cost, :assets_attributes,
                  :distance, :duration

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

  # def distance
  #   begin
  #     if self.distance == nil

  #       self.update_attributes(:distance => distance)
  #     else
  #       self.distance
  #     end
  #   rescue
  #     "no data"
  #   end
  # end

  # def duration
  #   begin
  #     if self.duration == nil
  #       duration = Distance.calculate(self.address)[:duration]
  #       self.update_attributes(:duration => duration)
  #     else
  #       self.duration
  #     end
  #   rescue
  #     "no data"
  #   end
  # end
  private
  def calculate_distance_and_duration
    begin
      self.distance = Distance.calculate(self.address)[:distance]
      self.duration = Distance.calculate(self.address)[:duration]
    rescue
      "no data"
    end
  end

end
