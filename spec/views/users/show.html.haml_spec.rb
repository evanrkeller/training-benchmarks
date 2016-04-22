require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @example_track = Track.create!(name: 'Example Track')
    @user = assign(:user, FactoryGirl.create(:user, track: @example_track))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/First name/)
    expect(rendered).to match(/Last name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Example Track/)
  end

  it "displays \"Undeclared\" if a track isn't set" do
    assign(:user, FactoryGirl.create(:user, track: nil))
    render
    expect(rendered).to match(/Undeclared/)
  end

  it 'includes a "Delete" button' do
    render
    expect(rendered).to have_link(t('delete'), href: user_path(@user))
  end

  describe 'benchmarks' do
    before do
      @example_benchmark = FactoryGirl.create(:bmark, track: @example_track)
    end

    it 'display for the selected track' do
      render
      expect(rendered).to match(@example_benchmark.name.to_s)
    end

    it 'that have been signed off are indicated' do
      FactoryGirl.create(:sign_off, bmark: @example_benchmark, user: @user)
      render
      expect(rendered).to match('Completed')
    end
  end

  describe 'feedbacks' do
    before do
      @practice = FactoryGirl.create(:practice, users: [@user])
      FactoryGirl.create(:feedback, user: @user, practice: @practice, note: 'Trainee did well')
    end

    it 'display for the user' do
      render
      expect(rendered).to match('Trainee did well')
    end

    it 'show practice session the feedback was for' do
      render
      expect(rendered).to match(@practice.date.to_s)
    end
  end
end
