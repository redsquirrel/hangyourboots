class User < ActiveRecord::Base

  attr_accessible :name, :email, :gender, :bio, :provider, :uid

  validates_presence_of :name, :email, :gender, :provider, :uid
  validates_uniqueness_of :email, :case_sensitive => false

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = "Please enter your email"
      user.gender = "Please enter your gender"
    end
  end

end
