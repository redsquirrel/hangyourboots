class Invitation < ActiveRecord::Base
	def self.valid_code?(code)
		true
	end
end
