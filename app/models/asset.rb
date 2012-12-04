class Asset < ActiveRecord::Base
  attr_accessible :image, :house_id, :house
  belongs_to :house
  mount_uploader :image, ImageUploader
end
