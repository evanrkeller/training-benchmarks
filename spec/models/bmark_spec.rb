require 'rails_helper'

RSpec.describe Bmark, type: :model do
  it { should belong_to :track }
  it { should belong_to :stage }
  it { should have_many(:sign_offs).dependent(:destroy) }
  it { should have_many(:scores).dependent(:destroy) }
  it { should validate_presence_of :name }

  describe '::by_stage_and_track' do
    it 'returns a list of bmarks ordered by first by stage then and then by track name' do
      track_b = FactoryGirl.create(:track, name: 'Track B')
      track_a = FactoryGirl.create(:track, name: 'Track A')
      stage_a = FactoryGirl.create(:stage, name: 'Stage A')
      stage_b = FactoryGirl.create(:stage, name: 'Stage B')
      benchmark_1 = FactoryGirl.create(:bmark, track: track_b, stage: stage_b)
      benchmark_2 = FactoryGirl.create(:bmark, track: track_a, stage: stage_a)
      benchmark_3 = FactoryGirl.create(:bmark, track: track_a, stage: stage_b)
      benchmark_4 = FactoryGirl.create(:bmark, track: track_b, stage: stage_a)
      expect(Bmark.by_stage_and_track).to eq([benchmark_2, benchmark_4, benchmark_3, benchmark_1])
    end
  end
end
