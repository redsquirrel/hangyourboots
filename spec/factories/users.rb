require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    gender { ['M', 'F'][rand(0..1)] }
    bio { Faker::Lorem.paragraph(sentence_count = 3, supplemental = false) }
    after(:create) do |user|
      user.oauth_token = "1234"
      user.oauth_expires_at = "1234",
      user.uid = "1234",
      user.provider = "facebook",
      user.save
    end
    factory :admin_user do
      after(:create) do |user|
        user.admin = true
        user.save
      end
    end
  end
  factory :facebook_profile do
    image {"http://www.example.com"}
    url {"http://www.example.com"}
    user
  end
end
