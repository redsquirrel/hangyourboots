class House < ActiveRecord::Base
  attr_accessible :title, :address, :description, :maps_link, :rooms,
  								:beds, :bathrooms, :capacity, :total_cost, :assets_attributes, :cohort

  validates :title, :address, :description, :maps_link,
  					:rooms, :beds, :bathrooms, :capacity, :total_cost,
            :presence => true

  belongs_to :cohort
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

  def people_committed
    commitments.size
  end
end
