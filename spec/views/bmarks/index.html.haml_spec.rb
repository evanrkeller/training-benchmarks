require 'rails_helper'

RSpec.describe "bmarks/index", :type => :view do
  before(:each) do
    @example_track = Track.create!({name: "Example Track"})
    @example_stage = Stage.create!({name: "Example Stage"})
    assign(:bmarks, [
      Bmark.create!(
        :name => "Name",
        :track => @example_track,
        :stage => @example_stage
      ),
      Bmark.create!(
        :name => "Name",
        :track => @example_track,
        :stage => @example_stage
      )
    ])
  end

  it "renders a list of bmarks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => @example_track.name.to_s, :count => 2
    assert_select "tr>td", :text => @example_stage.name.to_s, :count => 2
  end
end
