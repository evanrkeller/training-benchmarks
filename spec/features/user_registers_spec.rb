require 'rails_helper'

describe 'the registration process', type: :feature do
  it 'creates a new user' do
    visit 'registrations/sign_up'
    within('#new_user') do
      fill_in 'First name', with: 'Sample'
      fill_in 'Last name', with: 'User'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Phone', with: '212-555-1234'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content I18n.t('devise.registrations.signed_up')
  end
end
