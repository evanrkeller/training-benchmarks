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
end
