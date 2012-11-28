class User < ActiveRecord::Base
  attr_accessible :name, :email, :gender, :bio

  has_one :facebook_profile
  delegate :image, :url, :to =>:facebook_profile

  validates_presence_of :name, :email, :gender
  validates_uniqueness_of :email, :case_sensitive => false

 def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.gender = auth.extra.raw_info.gender
      user.image = auth.info.image
      user.url = auth.info.urls.Facebook
      user.save!
    end
  end
end