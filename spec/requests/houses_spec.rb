require 'spec_helper'

describe "Houses" do
  # TODO: Remove this and test actual authentication
  before :each do
    @user = create(:user, :cohort => create(:cohort))
    HousesController.any_instance.stub(:current_user) {@user}
  end

  describe "Index page" do

    before do
      5.times do
        create(:house, :cohort => @user.cohort)
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

    it "displays the distance" do
      page.should have_content(House.first.distance)
    end

    it "displays the duration of walk" do
      page.should have_content(House.first.duration)
    end

    it "a user should be able to see more detail about a house" do
      within('.houses .house:first') {
        click_on('Details')
      }
      page.should have_content(House.first.description)
    end

    it "has a button to add a house" do
      page.should have_content("Add a house")
    end
  end

  describe "Show page" do
    before do
      @house = create(:house, :rooms => 3, :beds => 4,
              :bathrooms => 2, :capacity => 1, :cohort => @user.cohort,
              :listing => 'http://www.archstoneapartments.com/Apartments/California/Northern_California/Archstone_South_Market/')
      com = Commitment.new(:house_id => @house.id)
      com.user_id = @user.id
      com.save
      visit house_path(@house)
    end

    it "displays the title of the house" do
      page.should have_content(@house.title)
    end

    it "displays the original listing of the house" do
      page.should have_link("Original Listing", @house.listing)
    end

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

    context "if user is admin" do
      it "has a delete button" do
        @user.admin = true
        @user.save
        visit house_path(@house)

        page.should have_link("Delete House")
      end
    end

    context "if user owns the house" do
      it "has a delete button" do
        @house.user_id = @user.id
        @house.save
        visit house_path(@house)

        page.should have_link("Delete House")
      end
    end

    context "if user is not an admin and did not create the house" do
      it "has no delete button" do
        page.should_not have_link("Delete House")
      end
    end

    context "if user is admin" do
      it "has an edit button" do
        @user.admin = true
        @user.save
        visit house_path(@house)

        page.should have_link("Edit House")
      end
    end

    context "if user owns the house" do
      it "has an edit button" do
        @house.user_id = @user.id
        @house.save
        visit house_path(@house)

        page.should have_link("Edit House")
      end
    end

    context "if user is not an admin and did not create the house" do
      it "has no edit button" do
        page.should_not have_link("Edit House")
      end
    end
  end
end
