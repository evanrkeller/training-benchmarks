require 'rails_helper'

describe 'Practice management', type: :feature do
  before :each do
    @user = FactoryGirl.create(:user, email: 'user@example.com', password: 'password')
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
  end

  describe 'list of practices' do
    it 'deletes a practice after the intention is confirmed', js: true do
      @practice = FactoryGirl.create(:practice)
      visit practices_path
      within(:xpath, "//tr[contains(.,'March 10, 2015,  7:00 pm- 8:00 pm')]") do
        click_link 'Destroy'
      end
      expect(current_path).to eq practices_path
      expect(page).not_to have_text 'March 10, 2015,  7:00 pm- 8:00 pm'
    end

    it 'does not delete a practice if the intention is not confirmed', js: true do
      @practice = FactoryGirl.create(:practice)
      visit practices_path
      page.evaluate_script 'window.confirm = function(msg) { return false; }'
      within(:xpath, "//tr[contains(.,'March 10, 2015,  7:00 pm- 8:00 pm')]") do
        click_link 'Destroy'
      end
      expect(page).to have_text 'March 10, 2015,  7:00 pm- 8:00 pm'
    end
  end
end
