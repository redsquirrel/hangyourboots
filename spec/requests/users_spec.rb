require 'spec_helper'

describe "Users" do

  context 'As a user you want to see a list of other users (potential roommates)' do

    before do
    	5.times do
    		create(:user)
    	end
    	@users = User.all
    	@house = create(:house)
    end

    describe 'users_path' do
      it 'shows a list of all users that are not admins' do
      	visit users_path
      	@users.each do |user|
	      	page.should have_content(user.name)
	      end 
      end
      
      it 'displays the user pictures' do
      	visit users_path
        all('img').each do |img|
          img[:src].should_not be nil
        end
      	# @users.each do |user|
	      # 	page.should have_xpath("//img[@src ='http://lorempixel.com/50/50/']")
	      
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