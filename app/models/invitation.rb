class Invitation < ActiveRecord::Base
	attr_accessible :code, :expires_at
	
	def self.valid_code?(code)
		false	
	end
end
