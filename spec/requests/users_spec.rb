require 'spec_helper'

describe "Users",  :js => true do

  context 'As a user you want to see a list of other users (potential roommates)' do

    let!(:some_users) { 5.times { create(:user) } }

    describe 'users_path' do
      it 'shows a list of all users that are not admins' do

      end
    end

  end

end