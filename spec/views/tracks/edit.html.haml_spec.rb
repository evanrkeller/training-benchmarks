require 'rails_helper'

RSpec.describe 'tracks/edit', type: :view do
  before(:each) do
    @track = assign(:track, Track.create!(
                              name: 'MyString'
    ))
    assign(:locations_size, 0)
  end

  it 'renders the edit track form' do
    render

    assert_select 'form[action=?][method=?]', track_path(@track), 'post' do
      assert_select 'input#track_name[name=?]', 'track[name]'
    end
  end

  context 'with no locations' do
    it 'does not include a location field' do
      render
      expect(rendered).not_to have_selector('label', text: 'Location')
      expect(rendered).not_to have_selector('input#track_location[readonly=readonly]')
      expect(rendered).not_to have_selector('select#track_location_id')
    end
  end

  context 'with one location' do
    it 'includes a read-only location field' do
      assign(:locations_size, 1)
      @track.location = Location.new(name: 'Test Location')
      render
      expect(rendered).to have_selector('label', text: 'Location')
      expect(rendered).to have_selector('input#track_location[readonly=readonly]')
      expect(rendered).to have_selector("input[value=\"#{@track.location.name}\"]")
      expect(rendered).not_to have_selector('select#track_location_id')
    end
  end

  context 'with more than one location' do
    it 'includes a location selector' do
      assign(:locations_size, 2)
      render
      expect(rendered).to have_selector('label', text: 'Location')
      expect(rendered).not_to have_selector('input#track_location[readonly=readonly]')
      expect(rendered).to have_selector('select#track_location_id')
    end
  end
end
