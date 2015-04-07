require 'rails_helper'

RSpec.describe Practice, :type => :model do
  it {should validate_presence_of :start_time}
  it {should validate_presence_of :end_time}
  it {should have_and_belong_to_many :users}

  describe '#unregistered_users' do
    it "should return a list of users that are not registered for the practice" do
      practice = FactoryGirl.create(:practice)
      registered_user = FactoryGirl.create(:user, practices: [practice])
      unregistered_user = FactoryGirl.create(:user)
      expect(practice.unregistered_users).to eq [unregistered_user]
    end
  end
end