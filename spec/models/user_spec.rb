require 'spec_helper'

describe User do
  context 'A FactoryGirl factory exists for generating users during testing' do

    before do
      create(:user)
    end

    describe '#create' do
      it 'is a valid factory for users' do
        create(:user).should be_valid
      end
    end

    describe '#validates_presence_of' do
      it { should validate_presence_of :email }
      it { should validate_presence_of :gender }
    end

    describe '#validates_uniqueness_of' do
      it { should validate_uniqueness_of :email }
    end

  end
end