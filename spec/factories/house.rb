require 'faker'

FactoryGirl.define do
	factory :house do
    sequence :title do |n|
      "Hacker House #{n}"
    end
    address     { Faker::Address.street_address }
    description { Faker::Lorem.paragraph }
		rooms 			{ rand(0..4) }
		beds 				{ rand(1..6) }
		bathrooms   { rand(1..4) }
		capacity 		{ rand(1..12) }
		total_cost 	{ rand(200..15_000) }
		after(:create) do |house|
			house.cohort = create(:cohort) unless house.cohort.present?
			house.save
		end

		factory :invalid_house do
			title 			nil
			address 		nil
		end
	end
end
