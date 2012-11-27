require 'spec_helper'

describe UsersController do
  before do
    @a_user = create(:user)
  end

  describe 'GET #new' do
    it 'assigns a new user to @user' do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe 'POST #create' do
    it 'saves the new user in the database' do
      expect{
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end
  end
end