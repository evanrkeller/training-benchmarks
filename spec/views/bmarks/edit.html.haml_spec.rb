require 'rails_helper'

RSpec.describe 'bmarks/edit', type: :view do
  it 'renders the edit bmark form' do
    bmark = assign(:bmark, Bmark.create!(
                             name: 'MyString',
                             description: 'MyText',
                             track: nil,
                             stage: nil
    ))
    render
    assert_select 'form[action=?][method=?]', bmark_path(bmark), 'post' do
      assert_select 'input#bmark_name[name=?]', 'bmark[name]'
      assert_select 'textarea#bmark_description[name=?]', 'bmark[description]'
      assert_select 'select#bmark_track_id[name=?]', 'bmark[track_id]'
      assert_select 'select#bmark_stage_id[name=?]', 'bmark[stage_id]'
    end
  end

  it 'includes the location name of the track if available' do
    track = Track.create!(name: 'Test Track', location: Location.create!(name: 'Test Location'))
    assign(:bmark, Bmark.create!(
                     name: 'MyString',
                     description: 'MyText',
                     track: track,
                     stage: nil
    ))
    render
    expect(rendered).to have_selector('option', text: track.name_and_location)
  end

  it 'only includes the track name if there is no location associated' do
    track = Track.create!(name: 'Test Track', location: nil)
    assign(:bmark, Bmark.create!(
                     name: 'MyString',
                     description: 'MyText',
                     track: track,
                     stage: nil
    ))
    render
    expect(rendered).to have_selector('option', text: track.name)
  end
end
