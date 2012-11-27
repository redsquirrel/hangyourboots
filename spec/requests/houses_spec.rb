require 'spec_helper'

describe "Sleepers" do
  describe "Index page" do
    it "has a list of houses" do
      visit houses_path
      binding.pry
      House.all.each do |house|
        page.should have_content(house.title)
      end
    end

    it "a user should be able to see more detail about a house"
  end
end