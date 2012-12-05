class Cohort < ActiveRecord::Base
	attr_accessible :name
	has_many :users
	has_many :houses
	has_many :invitations
end
