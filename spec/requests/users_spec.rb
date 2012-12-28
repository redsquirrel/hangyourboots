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
        all('img').each do |img|
          img[:src].should_not be nil
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

      describe 'delete links' do
        it 'displays a delete user button if user is current user' do
          visit users_path
          page.should have_link('Delete User', :href => user_path(@current_user))
        end

        it 'can delete self' do
          visit users_path
          expect { click_link('Delete User') }.to change(User, :count).by(-1)
        end

        it 'does not display a delete user button if user is not current user' do
          visit users_path
          page.should_not have_link('Delete User', :href => user_path(User.first))
        end

        context 'when current user is an admin' do
          before do
            @current_user.admin = true
            @current_user.save
            visit users_path
          end

          it 'displays a delete user button if current user is admin' do
            page.should have_link('Delete User', :href => user_path(User.first))
          end

          it 'can delete another user' do
            expect { first(:link, 'Delete User').click }.to change(User, :count).by(-1)
          end
        end

      end

    end

  end

end
