require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    @track = FactoryGirl.create(:track, name: 'Example Track')
    @user_1 = FactoryGirl.create(:user, track: @track, first_name: 'Bill')
    @user_2 = FactoryGirl.create(:user, track: @track, first_name: 'Bob')
    assign(:users, [@user_1, @user_2])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: @user_1.full_name.to_s, count: 1
    assert_select 'tr>td', text: @user_2.full_name.to_s, count: 1
    assert_select 'tr>td', text: @track.name.to_s, count: 2
  end

  it "displays \"Undeclared\" if a track isn't set" do
    assign(:users, [FactoryGirl.create(:user, track: nil)])
    render
    expect(rendered).to match(/Undeclared/)
  end

  it "shows the name of the user's location" do
    location = FactoryGirl.create(:location, name: 'Example Location')
    track = FactoryGirl.create(:track, location: location)
    assign(:users, [FactoryGirl.create(:user, track: track)])
    render
    expect(rendered).to have_selector('th', text: 'Location')
    expect(rendered).to have_selector('td', text: 'Example Location')
  end
end
