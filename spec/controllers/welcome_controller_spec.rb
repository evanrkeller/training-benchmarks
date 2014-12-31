require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  context '#index' do
    it 'Renders a basic welcome message' do
      sign_in FactoryGirl.create(:user)
      get :index
      expect(response.body).to match /Welcome/
    end
  end

end
