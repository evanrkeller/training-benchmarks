require 'rails_helper'

RSpec.describe 'practices/show', type: :view do
  before(:each) do
    @practice = assign(:practice, FactoryGirl.create(:practice))
  end

  it 'renders attributes in <p>' do
    render
  end

  it 'shows the stage' do
    render
    expect(rendered).to have_selector('dt', text: Practice.human_attribute_name(:stage) + ':')
  end

  it 'shows the location' do
    render
    expect(rendered).to have_selector('dt', text: Practice.human_attribute_name(:location) + ':')
    expect(rendered).to have_selector('dd', text: @practice.location.name)
  end

  it 'includes a "Delete" button' do
    render
    expect(rendered).to have_link(t('delete'), href: practice_path(@practice))
  end

  describe 'users sections' do
    before do
      @track = FactoryGirl.create(:track, name: 'Example Track')
      @users = [
        FactoryGirl.create(:user, first_name: 'Bill'),
        FactoryGirl.create(:user, first_name: 'Joe', track: @track, practices: [@practice]),
        FactoryGirl.create(:user, first_name: 'Sue'),
        FactoryGirl.create(:user, first_name: 'Dave', track: nil, practices: [@practice])
      ]
    end

    it 'shows a list of unregistered users to be scheduled' do
      render
      expect(rendered).to have_selector 'option', text: @users[0].full_name_with_track
      expect(rendered).not_to have_selector 'option', text: @users[1].full_name_with_track
      expect(rendered).to have_selector 'option', text: @users[2].full_name_with_track
      expect(rendered).not_to have_selector 'option', text: @users[3].full_name_with_track
    end

    it 'has a form for adding unregistered users' do
      render
      assert_select 'form[action=?]', add_user_practice_path(@practice)
    end

    it 'shows a list of registered users that have been scheduled' do
      render
      expect(rendered).not_to have_selector 'td', text: @users[0].full_name
      expect(rendered).to have_selector 'td', text: @users[1].full_name
      expect(rendered).not_to have_selector 'td', text: @users[2].full_name
      expect(rendered).to have_selector 'td', text: @users[3].full_name
    end

    it 'shows the track for scheduled trainees' do
      render
      expect(rendered).to have_selector 'th', text: 'Track'
      expect(rendered).to have_selector 'td', text: @track.name
      expect(rendered).to have_selector 'td', text: t('undeclared')
    end

    it 'has a remove button for registered users' do
      render
      assert_select 'a[href=?]', remove_user_practice_path(@practice, user_id: @users[1].id)
    end

    it 'has a feedback link for registered users' do
      render
      assert_select 'a[href=?]', new_user_feedback_path(@users[1], practice_id: @practice.id)
    end

    it 'has an indication the user already has feedback' do
      feedback = FactoryGirl.create(:feedback, user: @users[1], practice: @practice)
      render
      assert_select 'tr[data-user-id=?]', @users[1].to_param do |row|
        expect(row).to have_selector "a[href='#{edit_user_feedback_path(@users[1], feedback.to_param)}']"
        expect(row).to have_selector 'a.has_feedback'
      end
    end

    it 'has an indication the user does not already have feedback' do
      render
      assert_select 'tr[data-user-id=?]', @users[1].to_param do |row|
        expect(row).to have_selector "a[href='#{new_user_feedback_path(@users[1], practice_id: @practice.id)}']"
        expect(row).to have_selector 'a.needs_feedback'
      end
    end
  end
end
