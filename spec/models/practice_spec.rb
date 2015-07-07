require 'rails_helper'

RSpec.describe Practice, type: :model do
  it { should validate_presence_of :start_time }
  it { should validate_presence_of :end_time }
  it { should have_and_belong_to_many :users }
  it { should have_many(:feedbacks).dependent(:destroy) }

  describe '#unregistered_users' do
    it 'should return a list of users that are not registered for the practice' do
      practice = FactoryGirl.create(:practice)
      FactoryGirl.create(:user, practices: [practice])
      unregistered_user = FactoryGirl.create(:user)
      expect(practice.unregistered_users).to eq [unregistered_user]
    end
  end

  describe '#date' do
    it 'should return the date associated with the start time for the practice' do
      practice = FactoryGirl.create(:practice)
      expect(practice.date).to eq practice.start_time.to_date
    end
  end

  describe '#time' do
    it 'should return the time in a proper format' do
      practice = FactoryGirl.create(:practice, start_time: '2015-01-01 15:00', end_time: '2015-01-01 17:00')
      expect(practice.time).to eq 'January 1, 2015,  3:00 pm- 5:00 pm'
      practice_two = FactoryGirl.create(:practice, start_time: '2015-01-02 15:00', end_time: '2015-01-02 17:00')
      expect(practice_two.time).to eq 'January 2, 2015,  3:00 pm- 5:00 pm'
    end
  end
end
