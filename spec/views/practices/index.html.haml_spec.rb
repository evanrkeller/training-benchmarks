require 'rails_helper'

RSpec.describe 'practices/index', type: :view do
  before(:each) do
    assign(:practices, [
             FactoryGirl.create(:practice, start_time: '2015-01-01 15:00', end_time: '2015-01-01 17:00'),
             FactoryGirl.create(:practice, stage: FactoryGirl.create(:stage, name: 'Example Stage'))
           ])
  end

  it 'renders a list of practices' do
    render
  end

  it 'displays the practice using the consolidated start/end time' do
    render
    expect(rendered).to have_selector('th', text: 'Practice Time')
    expect(rendered).not_to have_selector('th', text: 'Start time')
    expect(rendered).not_to have_selector('th', text: 'End time')
    expect(rendered).to have_selector('td', text: 'January 1, 2015,  3:00 pm- 5:00 pm')
  end

  it 'displays the stage for a practice' do
    render
    expect(rendered).to have_selector('th', text: Practice.human_attribute_name(:stage))
    expect(rendered).to have_selector('td', text: 'Example Stage')
  end
end
