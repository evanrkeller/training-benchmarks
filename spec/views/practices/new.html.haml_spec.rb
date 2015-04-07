require 'rails_helper'

RSpec.describe "practices/new", :type => :view do
  before(:each) do
    assign(:practice, Practice.new())
  end

  it "renders new practice form" do
    render

    assert_select "form[action=?][method=?]", practices_path, "post" do
    end
  end
end
