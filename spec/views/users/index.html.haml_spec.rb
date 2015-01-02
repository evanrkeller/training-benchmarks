require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    @user_1 = FactoryGirl.create(:user)
    @user_2 = FactoryGirl.create(:user)
    assign(:users, [ @user_1, @user_2 ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => @user_1.email.to_s, :count => 1
    assert_select "tr>td", :text => @user_2.email.to_s, :count => 1
  end
end
