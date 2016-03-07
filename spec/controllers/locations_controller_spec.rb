require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  context 'when not signed in' do
    context 'GET index' do
      it 'redirects to the sign in path' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'when signed in' do
    before do
      sign_in FactoryGirl.create(:user)
    end

    let(:valid_attributes) do
      { name: 'Example Location' }
    end

    let(:invalid_attributes) do
      { name: nil }
    end

    let(:valid_session) { {} }

    describe 'GET index' do
      it 'assigns all locations as @locations' do
        location = FactoryGirl.create(:location, valid_attributes)
        get :index, {}, valid_session
        expect(assigns(:locations)).to eq([location])
      end
    end
  end
end
