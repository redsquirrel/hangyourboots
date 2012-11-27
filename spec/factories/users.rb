require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    gender { ['M', 'F'][rand(0..1)] }
    bio { Faker::Lorem.paragraph(sentence_count = 3, supplemental = false) }
    provider "Twitter"
    uid "123456"
  end
end
