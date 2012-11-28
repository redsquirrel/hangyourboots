class FacebookProfile < ActiveRecord::Base
  attr_accessible :url, :image
  belongs_to :user
end