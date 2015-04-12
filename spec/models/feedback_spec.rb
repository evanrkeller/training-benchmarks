require 'rails_helper'

RSpec.describe Feedback, :type => :model do
  it { should validate_presence_of :user }
  it { should validate_presence_of :practice }
  it { should validate_presence_of :note }
  it { should belong_to :user }
  it { should belong_to :practice }
  it 'should only allow one feedback per user per practice' do
    first_feedback = FactoryGirl.create(:feedback)
    expect(FactoryGirl.build(:feedback, user: first_feedback.user, practice: first_feedback.practice)).to be_invalid
  end
end
