require 'factory_girl_rails'

puts 'Creating houses and users in the database...'
5.times do
  FactoryGirl.create(:house)
  FactoryGirl.create(:facebook_profile)
end

puts 'Creating invitation codes in the database...'
FactoryGirl.create(:invitation, :code => "goodcode")
FactoryGirl.create(:invalid_invitation, :code => "badcode")
