require 'rails_helper'

describe 'Stage management', type: :feature do
  before :each do
    @user = FactoryGirl.create(:user, email: 'user@example.com', password: 'password')
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
  end

  describe 'list of stages' do
    it 'deletes a stage after the intention is confirmed', js: true do
      @stage = FactoryGirl.create(:stage, name: 'Sample')
      visit stage_path(@stage)
      click_link 'Destroy'
      expect(current_path).to eq stages_path
      expect(page).not_to have_text 'Sample'
    end

    it 'does not delete a stage if the intention is not confirmed', js: true do
      @stage = FactoryGirl.create(:stage, name: 'Sample')
      visit stage_path(@stage)
      page.evaluate_script 'window.confirm = function(msg) { return false; }'
      click_link 'Destroy'
      visit stages_path
      expect(page).to have_text 'Sample'
    end
  end
end
