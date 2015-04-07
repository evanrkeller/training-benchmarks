require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should belong_to :track }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :phone }
  it { should have_many(:bmarks).through(:track) }
  it { should have_many(:sign_offs) }
  it { should have_and_belong_to_many(:practices) }

  describe '#completed_bmarks' do
    it "should list benchmarks that have been signed off" do
      user = FactoryGirl.create(:user)
      completed_benchmark_one = FactoryGirl.create(:sign_off, user: user).bmark
      completed_benchmark_two = FactoryGirl.create(:sign_off, user: user).bmark
      expect(user.completed_benchmarks).to eq [completed_benchmark_one, completed_benchmark_two]
    end
  end

  describe '#full_name' do
    it 'should return a combination of the first name and last name' do
      user = FactoryGirl.create(:user)
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"
    end
  end
end
