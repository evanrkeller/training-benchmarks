require 'rails_helper'

RSpec.describe 'feedbacks/new', type: :view do
  before(:each) do
    @practice = FactoryGirl.create(:practice)
    @user = assign(:user, FactoryGirl.create(:user, practices: [@practice]))
  end

  describe 'without a practice' do
    it 'renders new feedback form' do
      assign(:feedback, FactoryGirl.build(:feedback, user: @user, practice: nil))
      render
      assert_select 'form[action=?][method=?]', user_feedbacks_path(@user), 'post' do
        assert_select 'select#feedback_practice_id[name=?]', 'feedback[practice_id]'
        assert_select 'textarea#feedback_note[name=?]', 'feedback[note]'
      end
    end
  end

  describe 'with a practice specified' do
    it "doesn't allow the trainer to change the practice" do
      assign(:feedback, FactoryGirl.build(:feedback, user: @user, practice: @practice))
      render
      expect(rendered).to have_selector(
        "input#feedback_practice[readonly=readonly][value='#{@practice.stage_and_time}']")
      assert_select 'input#feedback_practice_id[name=?][type=hidden]', 'feedback[practice_id]'
    end
  end
end
