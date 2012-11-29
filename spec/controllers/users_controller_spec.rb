require 'spec_helper'

describe UsersController do
  before(:each) do
    @a_user = create(:admin_user)
    set_user_session @a_user
  end

  # Skip authorization for the unit controller tests
  # HousesController.send(:skip_before_filter,:authorize_user)

  describe 'GET #new' do
    it 'assigns a new user to @user' do
      get :new
      assigns(:user).should be_a_new(User)
    end

    it 'renders the :new template' do
      get :new
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    it 'saves the new user in the database' do
      expect {
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end

    it 'should redirects to :show template' do
      post :create, user: attributes_for(:user)
      response.should redirect_to user_path(assigns[:user])
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user to @a_user' do
      get :edit, id: @a_user
      assigns(:user).should eq @a_user
    end

    it 'assigns the requested user to @a_user' do
      get :edit, id: @a_user
      response.should render_template :edit
    end
  end

  describe 'PUT #update' do
    it 'updates the user attributes' do
      put :update, id: @a_user,
        user: attributes_for(:user,
          name: 'Jeremy')
      @a_user.reload
      @a_user.name.should eq('Jeremy')
    end
  end

  describe 'DELETE destroy' do
    it "deletes the user" do
      expect {
        delete :destroy, id: @a_user
      }.to change(User, :count).by(-1)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user to @user' do
      user = create(:user)
      get :show, id: user
      assigns(:user).should eq user

      expect{
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end
  end
end
