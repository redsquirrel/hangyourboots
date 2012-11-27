class User < ActiveRecord::Base

  attr_accessible :name, :email, :gender, :bio

  validates_presence_of :name, :email, :gender
  validates_uniqueness_of :email, :case_sensitive => false


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
