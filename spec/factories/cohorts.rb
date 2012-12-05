require 'faker'

FactoryGirl.define do
  factory :cohort do
    name {Faker::Lorem.paragraph}
  end
end