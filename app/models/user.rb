class User < ActiveRecord::Base
  attr_accessible :name, :email, :gender, :bio

  has_one :facebook_profile
  belongs_to :invitation
  has_one :commitment, :dependent => :destroy
  has_one :house, :through => :commitment
  delegate :image, :url, :to =>:facebook_profile

  validates_presence_of :name, :email, :gender
  validates_uniqueness_of :email, :case_sensitive => false

  def self.from_omniauth(auth,invite_code)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth,invite_code)
  end

  def self.create_from_omniauth(auth,invite_code)
    if valid_code?(invite_code)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
        user.email = auth["info"]["email"]
        user.oauth_token = auth["credentials"]["token"]
        user.oauth_expires_at = Time.at(auth["credentials"]["expires_at"])
        user.gender = auth["extra"]["raw_info"]["gender"]

        user.build_facebook_profile :image => auth["info"]["image"], :url => auth["info"]["urls"]["Facebook"]
        set_invitation_code!(user,invite_code)
      end
    end
  end

  def is_admin?
    admin == true
  end

  private
  def self.valid_code?(code)
    Invitation.valid_code?(code)
  end
  
  def self.set_invitation_code!(user,invite_code)
    if Invitation.valid_code?(invite_code)
      user.invitation = Invitation.find_by_code(invite_code)
    end
  end
end
