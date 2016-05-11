require 'rails_helper'

RSpec.describe 'feedbacks/edit', type: :view do
  before(:each) do
    @practice = FactoryGirl.create(:practice)
    @user = assign(:user, FactoryGirl.create(:user, practices: [@practice]))
    @feedback = assign(:feedback, FactoryGirl.create(:feedback, user: @user, practice: @practice))
    render
  end

  it 'renders the edit feedback form' do
    assert_select 'form[action=?][method=?]', user_feedback_path(@user, @feedback), 'post' do
      expect(rendered).to have_selector('input#feedback_practice[readonly=readonly]')
      assert_select 'input#feedback_practice_id[name=?][type=hidden]', 'feedback[practice_id]'
      assert_select 'textarea#feedback_note[name=?]', 'feedback[note]'
    end
  end

  it "includes the trainee's name" do
    expect(rendered).to have_selector("input#feedback_user[readonly=readonly][value='#{@user.full_name}']")
  end

  it 'has a back button that returns to the practice' do
    expect(rendered).to match(/#{practice_path(@practice)}/)
  end
end
