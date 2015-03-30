require 'rails_helper'

RSpec.describe PracticesController, :type => :controller do

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
    # Practice. As you add validations to Practice, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) {
      {start_time: Time.new(2015, 1, 15, 19, 0, 0), end_time: Time.new(2015, 1, 15, 21, 0, 0)}
    }

    let(:invalid_attributes) {
      {start_time: nil, end_time: nil}
    }

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # PracticesController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all practices as @practices" do
        practice = Practice.create! valid_attributes
        get :index, {}, valid_session
        expect(assigns(:practices)).to eq([practice])
      end
    end

    describe "GET show" do
      it "assigns the requested practice as @practice" do
        practice = Practice.create! valid_attributes
        get :show, {:id => practice.to_param}, valid_session
        expect(assigns(:practice)).to eq(practice)
      end
    end

    describe "GET new" do
      it "assigns a new practice as @practice" do
        get :new, {}, valid_session
        expect(assigns(:practice)).to be_a_new(Practice)
      end
    end

    describe "GET edit" do
      it "assigns the requested practice as @practice" do
        practice = Practice.create! valid_attributes
        get :edit, {:id => practice.to_param}, valid_session
        expect(assigns(:practice)).to eq(practice)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Practice" do
          expect {
            post :create, {:practice => valid_attributes}, valid_session
          }.to change(Practice, :count).by(1)
        end

        it "assigns a newly created practice as @practice" do
          post :create, {:practice => valid_attributes}, valid_session
          expect(assigns(:practice)).to be_a(Practice)
          expect(assigns(:practice)).to be_persisted
        end

        it "redirects to the created practice" do
          post :create, {:practice => valid_attributes}, valid_session
          expect(response).to redirect_to(Practice.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved practice as @practice" do
          post :create, {:practice => invalid_attributes}, valid_session
          expect(assigns(:practice)).to be_a_new(Practice)
        end

        it "re-renders the 'new' template" do
          post :create, {:practice => invalid_attributes}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) {
          {start_time: Time.new(2015, 1, 16, 19, 0, 0), end_time: Time.new(2015, 1, 16, 21, 0, 0)}
        }

        it "updates the requested practice" do
          practice = Practice.create! valid_attributes
          put :update, {:id => practice.to_param, :practice => new_attributes}, valid_session
          practice.reload
          expect(practice.start_time).to eq(new_attributes[:start_time])
          expect(practice.end_time).to eq(new_attributes[:end_time])
        end

        it "assigns the requested practice as @practice" do
          practice = Practice.create! valid_attributes
          put :update, {:id => practice.to_param, :practice => valid_attributes}, valid_session
          expect(assigns(:practice)).to eq(practice)
        end

        it "redirects to the practice" do
          practice = Practice.create! valid_attributes
          put :update, {:id => practice.to_param, :practice => valid_attributes}, valid_session
          expect(response).to redirect_to(practice)
        end
      end

      describe "with invalid params" do
        it "assigns the practice as @practice" do
          practice = Practice.create! valid_attributes
          put :update, {:id => practice.to_param, :practice => invalid_attributes}, valid_session
          expect(assigns(:practice)).to eq(practice)
        end

        it "re-renders the 'edit' template" do
          practice = Practice.create! valid_attributes
          put :update, {:id => practice.to_param, :practice => invalid_attributes}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested practice" do
        practice = Practice.create! valid_attributes
        expect {
          delete :destroy, {:id => practice.to_param}, valid_session
        }.to change(Practice, :count).by(-1)
      end

      it "redirects to the practices list" do
        practice = Practice.create! valid_attributes
        delete :destroy, {:id => practice.to_param}, valid_session
        expect(response).to redirect_to(practices_url)
      end
    end

  end

end
