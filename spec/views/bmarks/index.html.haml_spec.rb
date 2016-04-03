require 'rails_helper'

RSpec.describe 'bmarks/index', type: :view do
  before(:each) do
    @example_track_one = Track.create!(name: 'Example Track')
    @example_track_two = Track.create!(name: 'Example Track Two',
                                       location: Location.new(name: 'Example Location'))
    @example_stage = Stage.create!(name: 'Example Stage')
    assign(:bmarks, [
             Bmark.create!(
               name: 'Name',
               track: @example_track_one,
               stage: @example_stage
             ),
             Bmark.create!(
               name: 'Name',
               track: @example_track_two,
               stage: @example_stage
             )
           ])
  end

  it 'renders a list of bmarks' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: @example_stage.name.to_s, count: 2
  end

  it 'includes the name of a location with the track' do
    render
    expect(rendered).to have_selector('tr>td',
                                      text: "#{@example_track_two.name}\n(#{@example_track_two.location.name})")
  end

  it 'does not show anything for tracks without a location' do
    render
    expect(rendered).to have_selector('tr>td', text: @example_track_one.name)
  end
end
