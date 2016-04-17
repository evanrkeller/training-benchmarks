require 'rails_helper'

RSpec.describe 'bmarks/show', type: :view do
  before(:each) do
    @example_track = Track.create!(name: 'Example Track')
    @example_stage = Stage.create!(name: 'Example Stage')
    @bmark = assign(:bmark, Bmark.create!(
                              name: 'Name',
                              description: 'MyText',
                              track: @example_track,
                              stage: @example_stage
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Example Track/)
    expect(rendered).to match(/Example Stage/)
  end

  it 'includes the location name if associated with the track' do
    @example_track.location = Location.create!(name: 'Example Location')
    @bmark = assign(:bmark, Bmark.create!(
                              name: 'Name',
                              description: 'MyText',
                              track: @example_track,
                              stage: @example_stage
    ))
    render
    expect(rendered).to match(/Example Track \(Example Location\)/)
  end

  it 'back button links to track show page' do
    render
    expect(rendered).to have_selector("a[href='#{track_path(@example_track)}']")
  end
end
