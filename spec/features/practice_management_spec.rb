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
      visit practice_path(@practice)
      click_link 'Destroy'
      expect(current_path).to eq practices_path
      expect(page).not_to have_text 'March 10, 2015,  7:00 pm- 8:00 pm'
    end

    it 'does not delete a practice if the intention is not confirmed', js: true do
      @practice = FactoryGirl.create(:practice)
      visit practice_path(@practice)
      page.evaluate_script 'window.confirm = function(msg) { return false; }'
      click_link 'Destroy'
      visit practices_path
      expect(page).to have_text 'March 10, 2015,  7:00 pm- 8:00 pm'
    end
  end

  describe 'new practice' do
    it 'shows a date/time selector for start date/time', js: true do
      visit new_practice_path
      page.evaluate_script "$('#practice_start_time').data('DateTimePicker').show();"
      expect(page).to have_selector '.bootstrap-datetimepicker-widget'
    end

    it 'sets the end time for 90 minutes after the start time', js: true do
      visit new_practice_path
      page.evaluate_script "$('#practice_start_time').val('2015-03-10 6:30 PM').trigger('change');"
      expect(page).not_to have_field('End time', with: '2015-03-10 08:00 PM')
    end
  end
end
