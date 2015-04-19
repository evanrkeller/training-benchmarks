require 'rails_helper'

RSpec.describe StagesController, type: :controller do
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
    # Stage. As you add validations to Stage, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      { name: 'Example Training Stage' }
    end

    let(:invalid_attributes) do
      { name: nil }
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # StagesController. Be sure to keep this updated too.

    describe 'GET index' do
      it 'assigns all stages as @stages' do
        stage = Stage.create! valid_attributes
        get :index, {}
        expect(assigns(:stages)).to eq([stage])
      end
    end

    describe 'GET show' do
      it 'assigns the requested stage as @stage' do
        stage = Stage.create! valid_attributes
        get :show, id: stage.to_param
        expect(assigns(:stage)).to eq(stage)
      end
    end

    describe 'GET new' do
      it 'assigns a new stage as @stage' do
        get :new, {}
        expect(assigns(:stage)).to be_a_new(Stage)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested stage as @stage' do
        stage = Stage.create! valid_attributes
        get :edit, id: stage.to_param
        expect(assigns(:stage)).to eq(stage)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Stage' do
          expect do
            post :create, stage: valid_attributes
          end.to change(Stage, :count).by(1)
        end

        it 'assigns a newly created stage as @stage' do
          post :create, stage: valid_attributes
          expect(assigns(:stage)).to be_a(Stage)
          expect(assigns(:stage)).to be_persisted
        end

        it 'redirects to the created stage' do
          post :create, stage: valid_attributes
          expect(response).to redirect_to(Stage.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved stage as @stage' do
          post :create, stage: invalid_attributes
          expect(assigns(:stage)).to be_a_new(Stage)
        end

        it "re-renders the 'new' template" do
          post :create, stage: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_attributes) do
          { name: 'New Training Stage' }
        end

        it 'updates the requested stage' do
          stage = Stage.create! valid_attributes
          put :update, id: stage.to_param, stage: new_attributes
          stage.reload
          expect(stage.name).to eq(new_attributes[:name])
        end

        it 'assigns the requested stage as @stage' do
          stage = Stage.create! valid_attributes
          put :update, id: stage.to_param, stage: valid_attributes
          expect(assigns(:stage)).to eq(stage)
        end

        it 'redirects to the stage' do
          stage = Stage.create! valid_attributes
          put :update, id: stage.to_param, stage: valid_attributes
          expect(response).to redirect_to(stage)
        end
      end

      describe 'with invalid params' do
        it 'assigns the stage as @stage' do
          stage = Stage.create! valid_attributes
          put :update, id: stage.to_param, stage: invalid_attributes
          expect(assigns(:stage)).to eq(stage)
        end

        it "re-renders the 'edit' template" do
          stage = Stage.create! valid_attributes
          put :update, id: stage.to_param, stage: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested stage' do
        stage = Stage.create! valid_attributes
        expect do
          delete :destroy, id: stage.to_param
        end.to change(Stage, :count).by(-1)
      end

      it 'redirects to the stages list' do
        stage = Stage.create! valid_attributes
        delete :destroy, id: stage.to_param
        expect(response).to redirect_to(stages_url)
      end
    end
  end
end
