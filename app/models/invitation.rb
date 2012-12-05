class Invitation < ActiveRecord::Base
	attr_accessible :code, :expires_at

	has_many :users

	def self.valid_code?(code)
		self.find_by_code(code).try(:active?)
	end

	def expired?
		Time.now >= expires_at
	end

  def active?
    Time.now < expires_at
  end
end
