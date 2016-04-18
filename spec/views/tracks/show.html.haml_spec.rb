require 'rails_helper'

RSpec.describe 'tracks/show', type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
                              name: 'Name'
    ))
    assign(:locations_size, 0)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end

  context 'with no locations' do
    it 'not to show the location field' do
      render
      expect(rendered).not_to have_selector('dt', text: 'Location')
    end
  end

  context 'with at least locations' do
    it 'shows the location for the track when a location has been assigned' do
      assign(:locations_size, 1)
      @track.location = Location.new(name: 'Test Location')
      render
      expect(rendered).to have_selector('dt', text: 'Location')
      expect(rendered).to have_selector('dd', text: @track.location.name)
    end

    it "shows 'No location assigned' for a track when no location has been assigned" do
      assign(:locations_size, 1)
      render
      expect(rendered).to have_selector('dt', text: Track.human_attribute_name(:location) + ':')
      expect(rendered).to have_selector('dd', text: t('no_location_assigned'))
    end
  end

  context 'benchmarks section' do
    before(:each) do
      @track.bmarks << FactoryGirl.create(:bmark)
      @different_track = FactoryGirl.create(:track)
      @different_track.bmarks << FactoryGirl.create(:bmark, name: 'Wrong Track')
    end

    it 'renders a list of benchmarks for that track' do
      render
      expect(rendered).to have_selector('tr>td', text: @track.bmarks.first.name)
    end

    it 'does not include benchmarks that are not part of the track' do
      render
      expect(rendered).not_to have_selector('tr>td', text: 'Wrong Track')
    end

    it 'includes the stage of the benchmark' do
      render
      expect(rendered).to have_selector('tr>th', text: Bmark.human_attribute_name(:stage))
      expect(rendered).to have_selector('tr>td', text: @track.bmarks.first.stage.name)
    end

    it 'includes a button to create a new benchmark' do
      render
      expect(rendered).to match(new_bmark_path)
    end
  end
end
