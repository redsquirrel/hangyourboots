require 'factory_girl_rails'

puts 'Creating invitation code "goodcode" and "anothergoodcode" in the database...'
cohort1 = Cohort.create(:name => "Fall 2012")
cohort2 = Cohort.create(:name => "Winter 2013")
invitation1 = FactoryGirl.create(:invitation, :code => "goodcode", :cohort => cohort1, :updated_at => "2012-12-05 08:00:00", :created_at => "2012-12-05 08:00:00")
invitation2 = FactoryGirl.create(:invitation, :code => "anothergoodcode", :cohort => cohort2, :updated_at => "20l2-12-05 08:00:00", :created_at => "2012-12-05 08:00:00")

puts 'Creating users...'
5.times do
  FactoryGirl.create(:user,:cohort => Cohort.find([1,2].sample))
end

puts 'Creating houses in the database...'
  house = House.create(:title => "Archstone 2-BR",
               :listing => 'http://www.archstoneapartments.com/Apartments/California/Northern_California/Archstone_South_Market/',
               :address => "One Saint Francis Pl., San Francisco, CA 94107",
               :description => "Located on the corner of 3rd and Folsom streets, Archstone South Market is in a premier Downtown location.",
               :rooms => 2,
               :beds => 3,
               :capacity => 6,
               :total_cost => 6450,
               :cohort => Cohort.find([1,2].sample),
               :bathrooms => 2)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone3.png")))

  house = House.create(:title => "Archstone 1-BR",
               :listing => 'http://www.archstoneapartments.com/Apartments/California/Northern_California/Archstone_South_Market/',
               :address => "One Saint Francis Pl., San Francisco, CA 94107",
               :description => "Located on the corner of 3rd and Folsom streets, Archstone South Market is in a premier Downtown location.",
               :rooms => 1,
               :beds => 2,
               :capacity => 4,
               :total_cost => 5250,
               :cohort => Cohort.find([1,2].sample),
               :bathrooms => 1)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone3.png")))

  house = House.create(:title => "Archstone 1-BR",
               :listing => 'http://www.archstoneapartments.com/Apartments/California/Northern_California/Archstone_South_Market/',
               :address => "One Saint Francis Pl., San Francisco, CA 94107",
               :description => "Located on the corner of 3rd and Folsom streets, Archstone South Market is in a premier Downtown location.",
               :rooms => 1,
               :beds => 2,
               :capacity => 4,
               :total_cost => 5250,
               :cohort => Cohort.find([1,2].sample),
               :bathrooms => 1)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone3.png")))

  house = House.create(:title => "Trinity Pine St 2-BR",
               :address => "845 Pine St, San Francisco, CA 94108",
               :description => "This is a really close location from the office, on top of nob hill. Big hill, but worth it.",
               :rooms => 2,
               :beds => 3,
               :capacity => 6,
               :total_cost => 4499,
               :cohort => Cohort.find([1,2].sample),
               :bathrooms => 2)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity3.png")))

  house = House.create(:title => "Trinity Pine St 1-BR",
               :address => "845 Pine St, San Francisco, CA 94108",
               :description => "This is a really close location from the office, on top of nob hill. Big hill, but worth it.",
               :rooms => 1,
               :beds => 2,
               :capacity => 4,
               :total_cost => 2899,
               :cohort => Cohort.find([1,2].sample),
               :bathrooms => 1)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity3.png")))
