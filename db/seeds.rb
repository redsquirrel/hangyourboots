require 'factory_girl_rails'

puts 'Creating houses and users in the database...'
  house = House.create(:title => "Archstone 2-BR",
               :address => "One Saint Francis Pl., San Francisco, CA 94107",
               :description => "Located on the corner of 3rd and Folsom streets, Archstone South Market is in a premier Downtown location.",
               :maps_link => "https://maps.google.com/maps?q=Archstone+South+Market,+St+Francis+Pl,+San+Francisco,+CA&hl=en&sll=37.7577,-122.4376&sspn=0.248904,0.198784&oq=one+st+francis+&hq=Archstone+South+Market,&hnear=St+Francis+Pl,+San+Francisco,+California+94107&t=m&z=16",
               :rooms => 2,
               :beds => 3,
               :capacity => 6,
               :total_cost => 6450,
               :bathrooms => 2)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone3.png")))

  house = House.create(:title => "Archstone 1-BR",
               :address => "One Saint Francis Pl., San Francisco, CA 94107",
               :description => "Located on the corner of 3rd and Folsom streets, Archstone South Market is in a premier Downtown location.",
               :maps_link => "https://maps.google.com/maps?q=Archstone+South+Market,+St+Francis+Pl,+San+Francisco,+CA&hl=en&sll=37.7577,-122.4376&sspn=0.248904,0.198784&oq=one+st+francis+&hq=Archstone+South+Market,&hnear=St+Francis+Pl,+San+Francisco,+California+94107&t=m&z=16",
               :rooms => 1,
               :beds => 2,
               :capacity => 4,
               :total_cost => 5250,
               :bathrooms => 1)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone3.png")))

  house = House.create(:title => "Archstone 1-BR",
               :address => "One Saint Francis Pl., San Francisco, CA 94107",
               :description => "Located on the corner of 3rd and Folsom streets, Archstone South Market is in a premier Downtown location.",
               :maps_link => "https://maps.google.com/maps?q=Archstone+South+Market,+St+Francis+Pl,+San+Francisco,+CA&hl=en&sll=37.7577,-122.4376&sspn=0.248904,0.198784&oq=one+st+francis+&hq=Archstone+South+Market,&hnear=St+Francis+Pl,+San+Francisco,+California+94107&t=m&z=16",
               :rooms => 1,
               :beds => 2,
               :capacity => 4,
               :total_cost => 5250,
               :bathrooms => 1)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/archstone3.png")))

  house = House.create(:title => "Trinity Pine St 2-BR",
               :address => "845 Pine St, San Francisco, CA 94108",
               :description => "This is a really close location from the office, on top of nob hill. Big hill, but worth it.",
               :maps_link => "https://maps.google.com/maps?q=845+Pine+Street&hl=en&ll=37.790913,-122.409754&spn=0.01555,0.012424&sll=37.783797,-122.398366&sspn=0.015551,0.012424&hnear=845+Pine+St,+San+Francisco,+California+94108&t=m&z=16",
               :rooms => 2,
               :beds => 3,
               :capacity => 6,
               :total_cost => 4499,
               :bathrooms => 2)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity3.png")))

  house = House.create(:title => "Trinity Pine St 1-BR",
               :address => "845 Pine St, San Francisco, CA 94108",
               :description => "This is a really close location from the office, on top of nob hill. Big hill, but worth it.",
               :maps_link => "https://maps.google.com/maps?q=845+Pine+Street&hl=en&ll=37.790913,-122.409754&spn=0.01555,0.012424&sll=37.783797,-122.398366&sspn=0.015551,0.012424&hnear=845+Pine+St,+San+Francisco,+California+94108&t=m&z=16",
               :rooms => 1,
               :beds => 2,
               :capacity => 4,
               :total_cost => 2899,
               :bathrooms => 1)
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity2.png")))
  Asset.create(:house_id => house.id, :image => File.open(File.join(Rails.root, "/app/assets/images/trinity3.png")))

puts 'Creating users...'
5.times do
  FactoryGirl.create(:user)
end

puts 'Creating invitation codes in the database...'
FactoryGirl.create(:invitation, :code => "goodcode")
FactoryGirl.create(:invalid_invitation, :code => "badcode")
