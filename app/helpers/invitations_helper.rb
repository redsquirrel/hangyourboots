module InvitationsHelper
	def	cohort_options
		Cohort.all.collect do |cohort|
			[cohort.name, cohort.id]
		end
	end
end
