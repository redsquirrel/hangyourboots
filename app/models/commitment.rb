class Commitment < ActiveRecord::Base
  belongs_to :user
  belongs_to :house
  attr_accessible :house_id

  validates_uniqueness_of :user_id
  validate :check_capacity
  validates_associated :user, :house

  def check_capacity
    if house.full?
      errors.add(:house, "is full. Please try a different house")
    end
  end

end
