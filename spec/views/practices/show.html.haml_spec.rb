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
      assert_select 'ul.unscheduled>li', text: /#{@users[0].full_name}/, count: 1
      assert_select 'ul.unscheduled>li', text: /#{@users[1].full_name}/, count: 0
      assert_select 'ul.unscheduled>li', text: /#{@users[2].full_name}/, count: 1
      assert_select 'ul.unscheduled>li', text: /#{@users[3].full_name}/, count: 0
    end

    it 'has a schedule button for unregistered users' do
      render
      assert_select 'a[href=?]', add_user_practice_path(@practice, user_id: @users[0].id)
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
      expect(rendered).to have_selector 'td', text: 'Undeclared'
    end

    it 'has a remove button for registered users' do
      render
      assert_select 'a[href=?]', remove_user_practice_path(@practice, user_id: @users[1].id)
    end

    it 'has a feedback link for registered users' do
      render
      assert_select 'a[href=?]', new_user_feedback_path(@users[1], practice_id: @practice.id)
    end
  end
end
