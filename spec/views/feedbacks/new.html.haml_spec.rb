require 'rails_helper'

RSpec.describe 'feedbacks/new', type: :view do
  before(:each) do
    practice = FactoryGirl.create(:practice)
    @user = assign(:user, FactoryGirl.create(:user, practices: [practice]))
    assign(:feedback, FactoryGirl.build(:feedback, user: @user))
  end

  it 'renders new feedback form' do
    render

    assert_select 'form[action=?][method=?]', user_feedbacks_path(@user), 'post' do
      assert_select 'select#feedback_practice_id[name=?]', 'feedback[practice_id]'
      assert_select 'textarea#feedback_note[name=?]', 'feedback[note]'
    end
  end
end
