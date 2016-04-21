require 'rails_helper'

describe 'Track management', type: :feature do
  before :each do
    @user = FactoryGirl.create(:user, email: 'user@example.com', password: 'password')
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
  end

  describe 'list of tracks' do
    it 'deletes a track after the intention is confirmed', js: true do
      @track = FactoryGirl.create(:track, name: 'Sample')
      visit track_path(@track)
      click_link 'Destroy'
      expect(current_path).to eq tracks_path
      expect(page).not_to have_text 'Sample'
    end

    it 'does not delete a track if the intention is not confirmed', js: true do
      @track = FactoryGirl.create(:track, name: 'Sample')
      visit track_path(@track)
      page.evaluate_script 'window.confirm = function(msg) { return false; }'
      click_link 'Destroy'
      visit tracks_path
      expect(page).to have_text 'Sample'
    end
  end
end
