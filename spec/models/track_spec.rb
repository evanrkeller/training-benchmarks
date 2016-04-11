require 'rails_helper'

RSpec.describe Track, type: :model do
  it { should belong_to :location }
  it { should have_many :bmarks }
  it { should have_many :users }
  it { should validate_presence_of :name }

  context 'when there are no locations' do
    before { allow(Location).to receive(:exists?).and_return(false) }
    it { should_not validate_presence_of(:location) }
  end

  context 'when there is at least one locations' do
    before { allow(Location).to receive(:exists?).and_return(true) }
    it { should validate_presence_of(:location) }
  end

  describe '#name_and_location' do
    before do
      @track = FactoryGirl.create(:track, location: nil)
    end
    describe 'with a location' do
      it 'should return the name and location' do
        @track.location = FactoryGirl.create(:location)
        expect(@track.name_and_location).to eq "#{@track.name} (#{@track.location.name})"
      end
    end

    describe 'without a location' do
      it 'should only return the name' do
        expect(@track.name_and_location).to eq @track.name
      end
    end
  end
end
