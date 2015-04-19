require 'rails_helper'

RSpec.describe 'practices/edit', type: :view do
  before(:each) do
    @practice = assign(:practice, FactoryGirl.create(:practice))
  end

  it 'renders the edit practice form' do
    render

    assert_select 'form[action=?][method=?]', practice_path(@practice), 'post' do
    end
  end
end
