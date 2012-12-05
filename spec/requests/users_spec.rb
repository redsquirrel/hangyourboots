require 'spec_helper'

describe "Users" do

  context 'As a user you want to see a list of other users (potential roommates)' do

    before do
    	cohort = create(:cohort)
      5.times do
    		create(:user, :cohort_id => cohort.id)
    	end
    	@current_user = create(:user, :cohort_id => cohort.id)
      UsersController.any_instance.stub(:current_user) {@current_user}
      @users = User.all
    	@house = create(:house, :cohort_id => cohort.id)
    end

    describe 'users_path' do
      it "shows a list of all users that are in the current user's cohort" do
      	visit users_path
      	@users.each do |user|
	      	page.should have_content(user.name) if user.cohort == @current_user.cohort_id
	      end
      end

      it "does not show users not in the current user's cohort" do
        visit users_path
        other_user = create(:user)
        page.should_not have_content(other_user.name)
      end

      it 'displays the user pictures' do
      	visit users_path
      	@users.each do |user|
	      	page.should have_xpath("//img[@src ='http://lorempixel.com/50/50/']")
	      end
      end

      it 'shows the house that a user is committed to' do
    		com = Commitment.create(:house_id => @house.id)
    		com.user_id = User.last.id
    		com.save
    		visit users_path
    		page.should have_content(@house.title)
      end

      it 'does not show a house that no users are committed to' do
      	visit users_path
      	page.should_not have_content(@house.title)
      end

    end

  end

end
