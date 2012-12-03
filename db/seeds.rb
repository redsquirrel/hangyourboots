require 'factory_girl_rails'

puts 'Creating houses and users in the database...'
5.times do |house_id|
  FactoryGirl.create(:house)

  3.times do |index|
    FactoryGirl.create(:asset, :house_id => house_id+1, :image => File.open(File.join(Rails.root, "/spec/factories/images/house#{index}.jpg")))
  end

  FactoryGirl.create(:user)
end

puts 'Creating invitation codes in the database...'
FactoryGirl.create(:invitation, :code => "goodcode")
FactoryGirl.create(:invalid_invitation, :code => "badcode")
