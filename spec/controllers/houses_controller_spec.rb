require 'spec_helper'

describe HousesController do

  describe 'GET #index' do
    it "gets all the houses in the database" do
      house = FactoryGirl.create(:house)
      get :index
      assigns(:houses).should eq [house]
    end
  end #GET index

  describe "GET #show" do
    before(:each) { @house = FactoryGirl.create(:house) }

    it "assigns the requested house to @house" do      
      get :show, id: @house
      assigns(:house).should eq @house
    end

    it "assigns the committed users to @roommates" do
      user = FactoryGirl.create(:user)
      commitment = @house.commitments.new
      commitment.user_id = user.id
      commitment.save
      get :show, id: @house
      @house.users.should eq [user]
    end
  end #@GET show

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
