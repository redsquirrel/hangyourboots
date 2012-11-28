require 'spec_helper'

describe Commitment do
  it { should belong_to(:user) }
  it { should belong_to(:house) }

    describe "committing to a house" do

    before do
     @user = FactoryGirl.create(:user)
     @house = FactoryGirl.create(:house, :capacity => 5)
     @users = []
     4.times { @users << FactoryGirl.create(:user)}
     @users.each {|user| user.build_commitment(:house_id => @house.id);user.save}
    end

    it "should be able to commit to a non-full house" do
      expect {
        @user.build_commitment(:house_id => @house.id)
        @user.save
        }.to change(Commitment, :count).by(1)
    end

    it "should not be able to commit to a full house" do
      new_user = FactoryGirl.create(:user)
      new_user.build_commitment(:house_id => @house.id)
      new_user.save
      expect {
        @user.build_commitment(:house_id => @house.id)
        @user.save
        }.not_to change(Commitment, :count).by(1)
    end

  end
end
