require 'rails_helper'

RSpec.describe 'tracks/index', type: :view do
  before(:each) do
    @tracks = assign(:tracks, [
                       Track.create!(
                         name: 'Name'
                       ),
                       Track.create!(
                         name: 'Name',
                         location: Location.create!(name: 'Test Location')
                       )
                     ])
  end

  it 'renders a list of tracks' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
  end

  it "includes a header for the 'Location' column" do
    render
    expect(rendered).to have_selector('th', text: Track.human_attribute_name(:location))
  end

  it 'includes the name of an assigned location' do
    render
    expect(rendered).to have_selector('td', text: @tracks.last.location.name)
  end

  it "says 'No location assigned' for tracks without an assigned location" do
    render
    expect(rendered).to have_selector('td', text: t('no_location_assigned'))
  end
end
