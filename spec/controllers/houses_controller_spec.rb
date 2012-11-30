require 'spec_helper'

describe HousesController do

  shared_examples("member access to houses") do
    it "gets all the houses in the database" do
      house = FactoryGirl.create(:house)
      get :index
      assigns(:houses).should eq [house]
    end
    describe 'GET #index' do
      it "gets all the houses in the database" do
        house = FactoryGirl.create(:house)
        get :index
        assigns(:houses).should eq [house]
      end
    end #GET index

    describe "GET #show" do
      it "assigns the requested house to @house" do
        house = FactoryGirl.create(:house)
        get :show, id: house
        assigns(:house).should eq house
      end
    end #@GET show
  end

  shared_examples("unauthorized access to houses") do
    describe "#create" do 
      before {post :create, house: FactoryGirl.attributes_for(:house)}
      it { should redirect_to root_url }
    end

    describe "#edit" do 
      before do 
        house = FactoryGirl.create(:house)
        get :edit, id: house.id
      end
      it { should redirect_to root_url }
    end
    
    describe "#update" do 
      before do 
        house = FactoryGirl.create(:house)
        put :update, id: house.id, house: FactoryGirl.attributes_for(:house)
      end
      it { should redirect_to root_url }
    end
    
    describe "#destroy" do 
      before do 
        house = FactoryGirl.create(:house)
        delete :destroy, id: house.id
      end
      it { should redirect_to root_url }
    end
  end

  shared_examples("admin access to houses") do
    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new house in the database" do
          expect {
            post :create, house: FactoryGirl.attributes_for(:house)
          }.to change(House, :count).by(1)
        end

        it "redirects to the house show page" do
          post :create, house: FactoryGirl.attributes_for(:house)
          response.should redirect_to house_path(House.last.id)
        end
      end #valid attrs

      context "with invalid attributes" do
        it "does not save the new house in the database" do
          expect {
            post :create, house: FactoryGirl.attributes_for(:invalid_house)
          }.to_not change(House, :count)
        end

        it "re-renders the :new template" do
          post :create, house: FactoryGirl.attributes_for(:invalid_house)
          response.should render_template :new
        end
      end #invalid attrs
    end #POST create

    describe'PUT#update' do

      subject { FactoryGirl.create(:house) }

      it "locates the requested house" do
        put :update, id: subject, house: FactoryGirl.attributes_for(:house)
        assigns(:house).should eq(subject)
      end

      context "valid attributes" do
        it "changes house's attributes" do
          put :update, id: subject, house: FactoryGirl.attributes_for(:house, title: "New title")
          subject.reload
          subject.title.should eq("New title")
        end

        it "redirects to the updated house" do
          put :update, id: subject, house: FactoryGirl.attributes_for(:house)
          response.should redirect_to subject
        end
      end
    end
  end

  context "admin access to houses" do
    before(:each) {set_user_session create(:admin_user)}
    it_behaves_like "member access to houses"
    it_behaves_like "admin access to houses"
  end

  context "non-admin access to houses" do
    before(:each) {set_user_session create(:user)}
    it_behaves_like "member access to houses"
    it_behaves_like "unauthorized access to houses"
  end
end
