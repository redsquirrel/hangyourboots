require 'distance'

class House < ActiveRecord::Base
  before_create :calculate_distance_and_duration

  attr_accessible :title, :address, :description, :rooms,
  								:beds, :bathrooms, :capacity, :total_cost, :assets_attributes, :cohort_id, :cohort,
                  :distance, :duration

  validates :title, :address, :description,
  					:rooms, :beds, :bathrooms, :capacity, :total_cost,
            :presence => true

  belongs_to :cohort
  belongs_to :user

  has_many :commitments
  has_many :users, :through => :commitments
  has_many :assets

  accepts_nested_attributes_for :assets, :allow_destroy => true
  
  def self.for_user_cohort(user)
    find_all_by_cohort_id(user.cohort_id)
  end

  def full?
    commitments.size == capacity
  end

  def roommates
    users
  end

  def build_assets
    (5-assets.length).times { assets.build }
  end

  def people_committed
    commitments.size
  end

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
