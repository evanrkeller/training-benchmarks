require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  context 'when not signed in' do
    context '#index' do
      it 'redirects to the sign in path' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'when signed in' do
    context '#index' do
      render_views
      it 'Renders a basic welcome message' do
        sign_in FactoryGirl.create(:user)
        get :index
        expect(response.body).to match /Welcome/
      end
    end
  end

end
