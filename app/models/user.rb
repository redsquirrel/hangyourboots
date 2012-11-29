class User < ActiveRecord::Base
  attr_accessible :name, :email, :gender, :bio

  has_one :facebook_profile
  has_one :commitment, :dependent => :destroy
  has_one :house, :through => :commitment
  delegate :image, :url, :to =>:facebook_profile

  validates_presence_of :name, :email, :gender
  validates_uniqueness_of :email, :case_sensitive => false

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"])
      user.gender = auth["extra"]["raw_info"]["gender"]

      user.build_facebook_profile :image => auth["info"]["image"], :url => auth["info"]["urls"]["Facebook"]
    end
  end
end
