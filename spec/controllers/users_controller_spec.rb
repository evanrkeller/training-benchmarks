require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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
      @track = FactoryGirl.create(:track)
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    # This should return the minimal set of attributes required to create a valid
    # User. As you add validations to User, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      FactoryGirl.attributes_for(:user, track: @track)
    end

    let(:invalid_attributes) do
      { email: nil }
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # UsersController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe 'GET index' do
      it 'assigns all users as @users' do
        user = User.create! valid_attributes
        get :index, {}
        # Because you have to create a user to register, the pattern is
        # slightly different than other controller tests
        expect(assigns(:users).size).to eq(2)
        expect(assigns(:users)).to include(user)
      end

      it 'filters users by a selected track' do
        user1 = FactoryGirl.create(:user, track: @track)
        user2 = FactoryGirl.create(:user, track: FactoryGirl.create(:track))
        get :index, by_track: @track.id
        expect(assigns(:users).all).to include(user1)
        expect(assigns(:users).all).not_to include(user2)
      end
    end

    describe 'GET show' do
      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        get :show, id: user.to_param
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'GET new' do
      it 'assigns a new user as @user' do
        get :new, {}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "assigns 'skip_track' to be true" do
        get :new, {}
        expect(assigns(:skip_track)).to eq(true)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        get :edit, id: user.to_param
        expect(assigns(:user)).to eq(user)
      end

      it "assigns 'skip_track' to not be true" do
        user = User.create! valid_attributes
        get :edit, id: user.to_param
        expect(assigns(:skip_track)).not_to eq(true)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new User' do
          expect do
            post :create, user: valid_attributes
          end.to change(User, :count).by(1)
        end

        it 'assigns a newly created user as @user' do
          post :create, user: valid_attributes
          expect(assigns(:user)).to be_a(User)
          expect(assigns(:user)).to be_persisted
        end

        it 'redirects to the created user' do
          post :create, user: valid_attributes
          expect(response).to redirect_to(new_user_url)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved user as @user' do
          post :create, user: invalid_attributes
          expect(assigns(:user)).to be_a_new(User)
        end

        it "re-renders the 'new' template" do
          post :create, user: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        before do
          @updated_track = FactoryGirl.create(:track)
        end

        let(:new_attributes) do
          { email: 'updated@example.com', track_id: @updated_track.id }
        end

        it 'updates the requested user' do
          user = User.create! valid_attributes
          put :update, id: user.to_param, user: new_attributes
          user.reload
          expect(user.email).to eq(new_attributes[:email])
          expect(user.track).to eq(@updated_track)
        end

        it 'assigns the requested user as @user' do
          user = User.create! valid_attributes
          put :update, id: user.to_param, user: valid_attributes
          expect(assigns(:user)).to eq(user)
        end

        it 'redirects to the user' do
          user = User.create! valid_attributes
          put :update, id: user.to_param, user: valid_attributes
          expect(response).to redirect_to(user)
        end
      end

      describe 'with invalid params' do
        it 'assigns the user as @user' do
          user = User.create! valid_attributes
          put :update, id: user.to_param, user: invalid_attributes
          expect(assigns(:user)).to eq(user)
        end

        it "re-renders the 'edit' template" do
          user = User.create! valid_attributes
          put :update, id: user.to_param, user: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested user' do
        user = User.create! valid_attributes
        expect do
          delete :destroy, id: user.to_param
        end.to change(User, :count).by(-1)
      end

      it 'redirects to the users list' do
        user = User.create! valid_attributes
        delete :destroy, id: user.to_param
        expect(response).to redirect_to(users_url)
      end
    end
  end
end
