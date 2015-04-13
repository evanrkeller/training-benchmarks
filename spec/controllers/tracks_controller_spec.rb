require 'rails_helper'

RSpec.describe TracksController, type: :controller do
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
      sign_in FactoryGirl.create(:user, track: nil)
    end

    # This should return the minimal set of attributes required to create a valid
    # Track. As you add validations to Track, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      { name: 'Example Training Track' }
    end

    let(:invalid_attributes) do
      { name: nil }
    end

    describe 'GET index' do
      it 'assigns all tracks as @tracks' do
        track = Track.create! valid_attributes
        get :index, {}
        expect(assigns(:tracks)).to eq([track])
      end
    end

    describe 'GET show' do
      it 'assigns the requested track as @track' do
        track = Track.create! valid_attributes
        get :show, id: track.to_param
        expect(assigns(:track)).to eq(track)
      end
    end

    describe 'GET new' do
      it 'assigns a new track as @track' do
        get :new
        expect(assigns(:track)).to be_a_new(Track)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested track as @track' do
        track = Track.create! valid_attributes
        get :edit, id: track.to_param
        expect(assigns(:track)).to eq(track)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Track' do
          expect do
            post :create, track: valid_attributes
          end.to change(Track, :count).by(1)
        end

        it 'assigns a newly created track as @track' do
          post :create, track: valid_attributes
          expect(assigns(:track)).to be_a(Track)
          expect(assigns(:track)).to be_persisted
        end

        it 'redirects to the created track' do
          post :create, track: valid_attributes
          expect(response).to redirect_to(Track.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved track as @track' do
          post :create, track: invalid_attributes
          expect(assigns(:track)).to be_a_new(Track)
        end

        it "re-renders the 'new' template" do
          post :create, track: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_attributes) do
          { name: 'New Training Track' }
        end

        it 'updates the requested track' do
          track = Track.create! valid_attributes
          put :update, id: track.to_param, track: new_attributes
          track.reload
          expect(track.name).to eq(new_attributes[:name])
        end

        it 'assigns the requested track as @track' do
          track = Track.create! valid_attributes
          put :update, id: track.to_param, track: valid_attributes
          expect(assigns(:track)).to eq(track)
        end

        it 'redirects to the track' do
          track = Track.create! valid_attributes
          put :update, id: track.to_param, track: valid_attributes
          expect(response).to redirect_to(track)
        end
      end

      describe 'with invalid params' do
        it 'assigns the track as @track' do
          track = Track.create! valid_attributes
          put :update, id: track.to_param, track: invalid_attributes
          expect(assigns(:track)).to eq(track)
        end

        it "re-renders the 'edit' template" do
          track = Track.create! valid_attributes
          put :update, id: track.to_param, track: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested track' do
        track = Track.create! valid_attributes
        expect do
          delete :destroy, id: track.to_param
        end.to change(Track, :count).by(-1)
      end

      it 'redirects to the tracks list' do
        track = Track.create! valid_attributes
        delete :destroy, id: track.to_param
        expect(response).to redirect_to(tracks_url)
      end
    end
  end
end
