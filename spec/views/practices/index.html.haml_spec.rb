require 'rails_helper'

RSpec.describe 'practices/index', type: :view do
  before(:each) do
    assign(:practices, [
      FactoryGirl.create(:practice),
      FactoryGirl.create(:practice)
    ])
  end

  it 'renders a list of practices' do
    render
  end
end
