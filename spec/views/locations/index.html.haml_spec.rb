require 'rails_helper'

RSpec.describe 'locations/index', type: :view do
  it 'has a button for new location' do
    assign(:locations, [Location.create!(name: 'Example Location')])
    render
    assert_select 'a.btn', text: t('new_model', model: Location.model_name.human)
  end
end
