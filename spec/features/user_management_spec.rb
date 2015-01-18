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

  describe "benchmarks" do

    before do
      @benchmark = FactoryGirl.create(:bmark, track: @user.track)
      visit user_path(@user)
    end

    it "displays a list of benchmarks for that user" do
      expect(page).to have_content @benchmark.name
    end

    it "has a button for signing off a user" do
      click_button "Sign Off"
      within ('td.actions') do
        expect(page).to have_text "Complete"
      end
    end
  end

end
