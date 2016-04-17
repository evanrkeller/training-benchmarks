require 'rails_helper'

RSpec.describe 'bmarks/new', type: :view do
  it 'renders new bmark form' do
    assign(:bmark, Bmark.new(
                     name: 'MyString',
                     description: 'MyText',
                     track: FactoryGirl.create(:track),
                     stage: nil
    ))
    render
    assert_select 'form[action=?][method=?]', bmarks_path, 'post' do
      assert_select 'input#bmark_name[name=?]', 'bmark[name]'
      assert_select 'textarea#bmark_description[name=?]', 'bmark[description]'
      assert_select 'input#bmark_track_id[name=?]', 'bmark[track_id]'
      assert_select 'select#bmark_stage_id[name=?]', 'bmark[stage_id]'
    end
  end

  describe 'track selector' do
    before do
      @track = Track.create!(name: 'Test Track', location: Location.create!(name: 'Test Location'))
      assign(:bmark, Bmark.new(
                       name: 'MyString',
                       description: 'MyText',
                       track: @track,
                       stage: nil
      ))
      render
    end

    it 'includes the location name of the track if available' do
      expect(rendered).to have_selector("input[value='Test Track (Test Location)']")
    end

    it 'is read-only' do
      expect(rendered).to have_selector('input#bmark_track[readonly=readonly]')
    end
  end

  it 'only includes the track name if there is no location associated' do
    track = Track.create!(name: 'Test Track', location: nil)
    assign(:bmark, Bmark.new(
                     name: 'MyString',
                     description: 'MyText',
                     track: track,
                     stage: nil
    ))
    render
    expect(rendered).to have_selector("input[value='Test Track']")
  end
end
