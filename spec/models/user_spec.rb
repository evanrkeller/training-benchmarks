require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should belong_to :track }
  it { should have_many(:bmarks).through(:track) }
  it { should have_many(:sign_offs) }

  describe '#completed_bmarks' do
    it "should list benchmarks that have been signed off" do
      user = FactoryGirl.create(:user)
      completed_benchmark_one = FactoryGirl.create(:sign_off, user: user).bmark
      completed_benchmark_two = FactoryGirl.create(:sign_off, user: user).bmark
      expect(user.completed_benchmarks).to eq [completed_benchmark_one, completed_benchmark_two]
    end
  end
end
