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

    describe 'GET index' do
      it 'assigns all locations as @locations' do
        location = FactoryGirl.create(:location, valid_attributes)
        get :index, {}
        expect(assigns(:locations)).to eq([location])
      end
    end

    describe 'GET new' do
      it 'assigns a new location as @location' do
        get :new, {}
        expect(assigns(:location)).to be_a_new(Location)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Location' do
          expect do
            post :create, location: valid_attributes
          end.to change(Location, :count).by(1)
        end

        it 'assigns a newly created location as @location' do
          post :create, location: valid_attributes
          expect(assigns(:location)).to be_a(Location)
          expect(assigns(:location)).to be_persisted
        end

        it 'redirects to the locations index' do
          post :create, location: valid_attributes
          expect(response).to redirect_to(locations_path)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved location as @location' do
          post :create, location: invalid_attributes
          expect(assigns(:location)).to be_a_new(Location)
        end

        it "re-renders the 'new' template" do
          post :create, location: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end
  end
end
