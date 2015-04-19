require 'rails_helper'

RSpec.describe BmarksController, type: :controller do
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

    # This should return the minimal set of attributes required to create a valid
    # Bmark. As you add validations to Bmark, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      { name: 'Example Training Benchmark', description: 'Description of the benchmark' }
    end

    let(:invalid_attributes) do
      { name: nil }
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # BmarksController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe 'GET index' do
      it 'assigns all bmarks as @bmarks' do
        bmark = Bmark.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:bmarks)).to eq([bmark])
      end
    end

    describe 'GET show' do
      it 'assigns the requested bmark as @bmark' do
        bmark = Bmark.create! valid_attributes
        get :show, { id: bmark.to_param }, valid_session
        expect(assigns(:bmark)).to eq(bmark)
      end
    end

    describe 'GET new' do
      it 'assigns a new bmark as @bmark' do
        get :new, {}, valid_session
        expect(assigns(:bmark)).to be_a_new(Bmark)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested bmark as @bmark' do
        bmark = Bmark.create! valid_attributes
        get :edit, { id: bmark.to_param }, valid_session
        expect(assigns(:bmark)).to eq(bmark)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Bmark' do
          expect do
            post :create, { bmark: valid_attributes }, valid_session
          end.to change(Bmark, :count).by(1)
        end

        it 'assigns a newly created bmark as @bmark' do
          post :create, { bmark: valid_attributes }, valid_session
          expect(assigns(:bmark)).to be_a(Bmark)
          expect(assigns(:bmark)).to be_persisted
        end

        it 'redirects to the created bmark' do
          post :create, { bmark: valid_attributes }, valid_session
          expect(response).to redirect_to(Bmark.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved bmark as @bmark' do
          post :create, { bmark: invalid_attributes }, valid_session
          expect(assigns(:bmark)).to be_a_new(Bmark)
        end

        it "re-renders the 'new' template" do
          post :create, { bmark: invalid_attributes }, valid_session
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_attributes) do
          { name: 'Updated Training Benchmark' }
        end

        it 'updates the requested bmark' do
          bmark = Bmark.create! valid_attributes
          put :update, { id: bmark.to_param, bmark: new_attributes }, valid_session
          bmark.reload
          expect(bmark.name).to eq(new_attributes[:name])
        end

        it 'assigns the requested bmark as @bmark' do
          bmark = Bmark.create! valid_attributes
          put :update, { id: bmark.to_param, bmark: valid_attributes }, valid_session
          expect(assigns(:bmark)).to eq(bmark)
        end

        it 'redirects to the bmark' do
          bmark = Bmark.create! valid_attributes
          put :update, { id: bmark.to_param, bmark: valid_attributes }, valid_session
          expect(response).to redirect_to(bmark)
        end
      end

      describe 'with invalid params' do
        it 'assigns the bmark as @bmark' do
          bmark = Bmark.create! valid_attributes
          put :update, { id: bmark.to_param, bmark: invalid_attributes }, valid_session
          expect(assigns(:bmark)).to eq(bmark)
        end

        it "re-renders the 'edit' template" do
          bmark = Bmark.create! valid_attributes
          put :update, { id: bmark.to_param, bmark: invalid_attributes }, valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested bmark' do
        bmark = Bmark.create! valid_attributes
        expect do
          delete :destroy, { id: bmark.to_param }, valid_session
        end.to change(Bmark, :count).by(-1)
      end

      it 'redirects to the bmarks list' do
        bmark = Bmark.create! valid_attributes
        delete :destroy, { id: bmark.to_param }, valid_session
        expect(response).to redirect_to(bmarks_url)
      end
    end
  end
end
