require 'rails_helper'

RSpec.describe 'bmarks/edit', type: :view do
  before(:each) do
    @bmark = assign(:bmark, Bmark.create!(
                              name: 'MyString',
                              description: 'MyText',
                              track: nil,
                              stage: nil
    ))
  end

  it 'renders the edit bmark form' do
    render
    assert_select 'form[action=?][method=?]', bmark_path(@bmark), 'post' do
      assert_select 'input#bmark_name[name=?]', 'bmark[name]'

      assert_select 'textarea#bmark_description[name=?]', 'bmark[description]'

      assert_select 'select#bmark_track_id[name=?]', 'bmark[track_id]'

      assert_select 'select#bmark_stage_id[name=?]', 'bmark[stage_id]'
    end
  end
end
