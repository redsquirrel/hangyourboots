require 'spec_helper'

describe User do

  let!(:user)  { FactoryGirl.create(:user) }

  context 'A FactoryGirl factory exists for generating users during testing' do

    describe '#create' do
      it 'is a valid factory for users' do
        FactoryGirl.create(:user).should be_valid
      end
    end
  end

  context 'prior to creating user instances, valid information is provided' do

    describe '#validates_presence_of' do
      it { should validate_presence_of :email }
      it { should validate_presence_of :gender }
    end

    describe '#validates_uniqueness_of' do
      it { should validate_uniqueness_of :email }

      it 'is invalid with a duplicate email of a different case' do
        lower_case_user = create(:user, :email => "uppercase@email.com")
        upper_case_user = build(:user, :email => "UpperCase@email.com")
        upper_case_user.should_not be_valid
      end
    end

    it 'is invalid with no name' do
      user.name = nil
      user.should_not be_valid
    end

    it 'is invalid with no email' do
      user.email = nil
      user.should_not be_valid
    end

    it 'is invalid with no gender' do
      user.gender = nil
      user.should_not be_valid
    end
  end

  context "associations" do
    it { should have_one(:house).through(:commitment) }
    it { should have_one(:commitment) }
    it { should belong_to(:cohort) }
  end

end
