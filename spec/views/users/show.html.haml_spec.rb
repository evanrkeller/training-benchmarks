require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @example_track = Track.create!({name: "Example Track"})
    @user = assign(:user, FactoryGirl.create(:user, track: @example_track))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Example Track/)
  end

  it "displays \"Undeclared\" if a track isn't set" do
    assign(:user, FactoryGirl.create(:user, track: nil))
    render
    expect(rendered).to match(/Undeclared/)
  end

  describe 'benchmarks' do

    before do
      @example_benchmark = FactoryGirl.create(:bmark, track: @example_track)
    end

    it "display for the selected track" do
      render
      expect(rendered).to match("#{@example_benchmark.name}")
    end

    it "that have been signed off are indicated" do
      FactoryGirl.create(:sign_off, bmark: @example_benchmark, user: @user)
      render
      expect(rendered).to match("Completed")
    end

  end

end
