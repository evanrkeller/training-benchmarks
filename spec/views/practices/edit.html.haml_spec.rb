require 'rails_helper'

RSpec.describe 'practices/edit', type: :view do
  before(:each) do
    @practice = assign(:practice, FactoryGirl.create(:practice))
    Stage.create!(name: 'Example Stage')
    Location.create!(name: 'Example Location')
  end

  it 'renders the edit practice form' do
    render
    assert_select 'form[action=?][method=?]', practice_path(@practice), 'post' do
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
