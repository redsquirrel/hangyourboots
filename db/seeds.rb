require 'factory_girl_rails'

5.times do
  FactoryGirl.create(:house)
  FactoryGirl.create(:user)
end
