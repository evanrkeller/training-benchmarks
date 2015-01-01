require 'rails_helper'

RSpec.describe "tracks/index", :type => :view do
  before(:each) do
    assign(:tracks, [
      Track.create!(
        :name => "Name"
      ),
      Track.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of tracks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
