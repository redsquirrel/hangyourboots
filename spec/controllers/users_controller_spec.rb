require 'spec_helper'

describe UsersController do


  shared_examples("member access to users") do
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
    end

    describe 'PUT #update' do
      it 'updates the user attributes' do
        put :update, id: @user,
          user: attributes_for(:user,
            name: 'Jeremy')
        @user.reload
        @user.name.should eq('Jeremy')
      end
    end

    describe 'DELETE destroy' do
      it "deletes the user" do
        expect {
          delete :destroy, id: @user
        }.to change(User, :count).by(-1)
      end
    end
  end

  shared_examples("unauthorized member access to users") do
    describe "#edit" do 
      before do 
        user2 = FactoryGirl.create(:user)
        get :edit, id: user2.id
      end
      it { should redirect_to root_url }
    end
    
    describe "#update" do 
      before do 
        user2 = FactoryGirl.create(:user)
        put :update, id: user2.id, user: FactoryGirl.attributes_for(:user)
      end
      it { should redirect_to root_url }
    end
    
    describe "#destroy" do 
      before do 
        user2 = FactoryGirl.create(:user)
        delete :destroy, id: user2.id
      end
      it { should redirect_to root_url }
    end
  end
  
  context "member access to users" do
    before(:each) do
      @user = create(:user)
      set_user_session @user
    end

    it_behaves_like("member access to users")
    it_behaves_like("unauthorized member access to users")
  end

  context "admin access to users" do
    before(:each) do
      @user = create(:admin_user)
      set_user_session @user
    end
    it_behaves_like("member access to users")
  end
end
