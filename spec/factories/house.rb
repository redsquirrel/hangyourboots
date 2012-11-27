FactoryGirl.define do 
	factory :house do
		title 			"Archstone"
		address 		"3rd and folsom"
		description "amazing house super awesome"
		maps_link 	"http://www.google.com"
		rooms 			2
		beds 				3
		bathrooms   2
		capacity 		6
		total_cost 	15_000
	end
	
end