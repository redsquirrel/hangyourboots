require 'spec_helper'

describe "Houses" do
  # TODO: Remove this and test actual authentication
  before :each do
    @user = create(:user)
    HousesController.any_instance.stub(:current_user) {@user}
  end

  describe "Index page" do

    before do
      5.times do
        create(:house)
      end
      visit houses_path
    end


    it "displays the title of each house" do
      House.all.each do |house|
        page.should have_content(house.title)
      end
    end

    it "displays the total cost of each house" do
      all('span.total-cost').each do |span|
        span.should have_content("$")
      end
    end

    it "a user should be able to see more detail about a house" do
      within('.houses .house:first') {
        click_on('Details')
      }
      page.should have_content(House.first.description)
    end
  end

  describe "Show page" do
    before do
      @house = create(:house, :rooms => 3, :beds => 4, :bathrooms => 2, :capacity => 1)
      com = Commitment.new(:house_id => @house.id)
      com.user_id = @user.id
      com.save
      visit house_path(@house)
    end

    it "displays the title of the house" do
      page.should have_content(@house.title)
    end

    it "displays the cohort it is a part of"

    it "displays the description of the house" do
      page.should have_content(@house.description)
    end

    it "displays the total cost of the house" do
      page.should have_content("$")
    end

    it "displays the address of the house" do
      page.should have_content(@house.address)
    end

    it "displays the beds of the house" do
      page.should have_content(@house.beds)
    end

    it "displays the bathrooms of the house" do
      page.should have_content(@house.bathrooms)
    end

    it "displays the capacity of the house" do
      page.should have_content(@house.capacity)
    end

    it "displays the rooms of the house" do
      page.should have_content(@house.rooms)
    end

    it "does not display the leave button if house is full" do
      page.should_not have_button("Leave House")
    end
  end
end
