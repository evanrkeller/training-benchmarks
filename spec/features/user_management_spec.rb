require 'rails_helper'

describe 'User management', type: :feature do
  before :each do
    @user = FactoryGirl.create(:user, email: 'user@example.com', password: 'password')
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
  end

  describe 'benchmarks' do
    before do
      @benchmark = FactoryGirl.create(:bmark, track: @user.track)
      visit user_path(@user)
    end

    it 'displays a list of benchmarks for that user' do
      expect(page).to have_content @benchmark.name
    end

    it 'has a button for signing off a user' do
      click_button 'Sign Off'
      within('td.actions') do
        expect(page).to have_text 'Complete'
      end
    end
  end

  describe 'list of users' do
    it 'deletes a user after the intention is confirmed', js: true do
      @new_user = FactoryGirl.create(:user, first_name: 'Remove', last_name: 'Me')
      visit user_path(@new_user)
      click_link 'Destroy'
      expect(current_path).to eq users_path
      expect(page).not_to have_text 'Remove Me'
    end

    it 'does not delete a user if the intention is not confirmed', js: true do
      @new_user = FactoryGirl.create(:user, first_name: 'Save', last_name: 'Me')
      visit user_path(@new_user)
      page.evaluate_script 'window.confirm = function(msg) { return false; }'
      click_link 'Destroy'
      visit users_path
      expect(page).to have_text 'Save Me'
    end
  end
end
