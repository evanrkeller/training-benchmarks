require 'rails_helper'

describe "User management", :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user, email: 'user@example.com', password: 'password')
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Log in'
  end

  it "displays a list of benchmarks for that user" do
    @benchmark = FactoryGirl.create(:bmark, track: @user.track)
    visit "/users/#{@user.id}"
    expect(page).to have_content @benchmark.name
  end
end
