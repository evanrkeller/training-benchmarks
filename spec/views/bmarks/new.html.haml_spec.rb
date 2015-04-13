require 'rails_helper'

RSpec.describe 'bmarks/new', type: :view do
  before(:each) do
    assign(:bmark, Bmark.new(
                     name: 'MyString',
                     description: 'MyText',
                     track: nil,
                     stage: nil
    ))
  end

  it 'renders new bmark form' do
    render

    assert_select 'form[action=?][method=?]', bmarks_path, 'post' do
      assert_select 'input#bmark_name[name=?]', 'bmark[name]'

      assert_select 'textarea#bmark_description[name=?]', 'bmark[description]'

      assert_select 'select#bmark_track_id[name=?]', 'bmark[track_id]'

      assert_select 'select#bmark_stage_id[name=?]', 'bmark[stage_id]'
    end
  end
end
