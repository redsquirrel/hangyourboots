require 'faker'

FactoryGirl.define do
	factory :invitation do
    code     { SecureRandom.urlsafe_base64(7) }
    expires_at { Date.parse("January 5 2099") }
    cohort { Faker::Lorem.paragraph }

    factory :invalid_invitation do
    	expires_at { Date.parse("January 5 1980") }
    end
	end
end
