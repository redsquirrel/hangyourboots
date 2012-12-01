class Invitation < ActiveRecord::Base
	attr_accessible :code, :expires_at

	has_many :users

	def self.valid_code?(code)
		invite = find_by_code(code)
		invite && !invite.try(:expired?)
	end

	def expired?
		Time.now >= expires_at
	end
end
