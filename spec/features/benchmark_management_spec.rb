require 'rails_helper'

describe 'Benchmark management', type: :feature do
  before :each do
    @user = FactoryGirl.create(:user, email: 'user@example.com', password: 'password')
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
  end

  describe 'list of benchmarks' do
    it 'deletes a benchmark after the intention is confirmed', js: true do
      @benchmark = FactoryGirl.create(:bmark, name: 'Sample')
      visit track_path(@benchmark.track)
      within(:xpath, "//tr[contains(.,'Sample')]") do
        click_link 'Destroy'
      end
      expect(current_path).to eq track_path(@benchmark.track)
      expect(page).not_to have_text 'Sample'
    end

    it 'does not delete a user if the intention is not confirmed', js: true do
      @benchmark = FactoryGirl.create(:bmark, name: 'Sample')
      visit track_path(@benchmark.track)
      page.evaluate_script 'window.confirm = function(msg) { return false; }'
      within(:xpath, "//tr[contains(.,'Sample')]") do
        click_link 'Destroy'
      end
      expect(page).to have_text 'Sample'
    end
  end
end
