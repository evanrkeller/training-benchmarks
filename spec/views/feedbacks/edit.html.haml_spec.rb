require 'rails_helper'

RSpec.describe 'feedbacks/edit', type: :view do
  before(:each) do
    practice = FactoryGirl.create(:practice)
    @user = assign(:user, FactoryGirl.create(:user, practices: [practice]))
    @feedback = assign(:feedback, FactoryGirl.create(:feedback, user: @user))
  end

  it 'renders the edit feedback form' do
    render

    assert_select 'form[action=?][method=?]', user_feedback_path(@user, @feedback), 'post' do
      assert_select 'select#feedback_practice_id[name=?]', 'feedback[practice_id]'
      assert_select 'textarea#feedback_note[name=?]', 'feedback[note]'
    end
  end
end
