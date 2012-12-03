class Asset < ActiveRecord::Base
  attr_accessible :image, :house_id
  belongs_to :house
  mount_uploader :image, ImageUploader
end
