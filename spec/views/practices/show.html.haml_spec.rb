require 'rails_helper'

RSpec.describe "practices/show", :type => :view do
  before(:each) do
    @practice = assign(:practice, FactoryGirl.create(:practice))
  end

  it "renders attributes in <p>" do
    render
  end
end
