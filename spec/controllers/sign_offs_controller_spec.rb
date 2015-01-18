require 'rails_helper'

describe SignOffsController, :type => :controller do

  describe "POST create" do

    before do
      sign_in user
    end

    let(:user) { FactoryGirl.create(:user) }
    let(:bmark) { FactoryGirl.create(:bmark, track: user.track) }

    it "creates a new Sign off" do
      expect {
        post :create, {:sign_off => {bmark_id: bmark.id, user_id: user.id} }
      }.to change(user.sign_offs, :count).by(1)
    end

    it "redirects to the user of the sign_off" do
      post :create, {:sign_off => {bmark_id: bmark.id, user_id: user.id} }
      expect(response).to redirect_to(user)
    end

  end

end
