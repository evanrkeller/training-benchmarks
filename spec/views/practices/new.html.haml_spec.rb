require 'rails_helper'

RSpec.describe 'practices/new', type: :view do
  before(:each) do
    assign(:practice, Practice.new)
    Stage.create!(name: 'Example Stage')
    Location.create!(name: 'Example Location')
  end

  it 'renders new practice form' do
    render
    assert_select 'form[action=?][method=?]', practices_path, 'post' do
    end
  end

  it 'includes the stage drop-down' do
    render
    expect(rendered).to have_selector('#practice_stage_id > option', text: 'Example Stage')
  end

  it 'includes the location drop-down' do
    render
    expect(rendered).to have_selector('#practice_location_id > option', text: 'Example Location')
  end
end
