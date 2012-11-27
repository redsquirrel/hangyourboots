class User < ActiveRecord::Base

  attr_accessible :name, :email, :gender, :bio

  validates_presence_of :name, :email, :gender
  validates_uniqueness_of :email, :case_sensitive => false

end
