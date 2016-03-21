require 'rails_helper'

RSpec.describe 'locations/index', type: :view do
  before(:each) do
    @example_location = Location.create!(name: 'Example Location')
    assign(:locations, [@example_location])
  end

  it 'has a button for new location' do
    render
    assert_select 'a.btn', text: t('new_model', model: Location.model_name.human)
  end

  it 'has an edit button of each location' do
    render
    assert_select 'tr[data-location-id=?]', @example_location.to_param do
      assert_select 'a[href=?]', edit_location_path(@example_location)
    end
  end
end
