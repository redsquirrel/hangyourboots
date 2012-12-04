module InvitationsHelper
	def	cohort_options
		# The unique set of the existing cohorts plus at least three others
		Invitation.all.collect {|i| i.cohort } |
		["Fall 2012", "Winter 2013", "Spring 2013"]
	end
end
