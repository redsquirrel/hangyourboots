require 'spec_helper'

describe House do
	let!(:house)  { FactoryGirl.create(:house) }

	it "is invalid without a title" do
		house.title = nil
	  house.should_not be_valid
	end

	it "is invalid without an address" do
	  house.address = nil
	  house.should_not be_valid
	end

	it "is invalid without a description" do
	  house.description = nil
	  house.should_not be_valid
	end

	it "is invalid without a maps_link" do
	  house.maps_link = nil
	  house.should_not be_valid
	end

	it "is invalid without a rooms number" do
	  house.rooms = nil
	  house.should_not be_valid
	end

	it "is invalid without a beds number" do
	  house.beds = nil
	  house.should_not be_valid
	end

	it "is invalid without a bathroom number" do
	  house.bathrooms = nil
	  house.should_not be_valid
	end

	it "is invalid without a capacity" do
	  house.capacity = nil
	  house.should_not be_valid
	end

	it "is invalid without a total cost" do
	  house.total_cost = nil
	  house.should_not be_valid
	end
	
end