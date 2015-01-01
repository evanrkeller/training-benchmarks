require 'rails_helper'

RSpec.describe "layouts/application" do

  before do
    allow(view).to receive(:user_signed_in?) { false }
  end

  it "doesn't have an untranslated title" do
    render
    expect(rendered).to_not match(/<title>t\('app_title'\)<\/title>/)
  end

  it "has the proper page title" do
    render
    expect(rendered).to match("<title>Training Benchmarks</title>")
  end

  it "highlights the approprate nav element" do
    allow(view).to receive(:current_page?) { |options| options[:controller] == 'tracks' }
    render
    expect(rendered).to match("<li class='active'>\n<a href=\"/tracks\">Tracks</a>\n</li>")
  end
end
