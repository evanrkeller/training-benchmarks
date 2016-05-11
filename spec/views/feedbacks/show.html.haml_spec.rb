require 'rails_helper'
include ERB::Util

RSpec.describe 'feedbacks/show', type: :view do
  before(:each) do
    @practice = FactoryGirl.create(:practice)
    @user = assign(:user, FactoryGirl.create(:user, practices: [@practice]))
    @feedback = assign(:feedback, FactoryGirl.create(:feedback, user: @user, practice: @practice,
                                                                note: 'Proceeding nicely'))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/#{html_escape(@feedback.practice.stage_and_time)}/)
    expect(rendered).to match(/#{html_escape(@feedback.user.full_name)}/)
    expect(rendered).to match(/Proceeding nicely/)
  end

  it 'has a back button that returns to the practice' do
    render
    expect(rendered).to match(/#{practice_path(@practice)}/)
  end
end
