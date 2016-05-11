require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  context 'when not signed in' do
    context 'GET index' do
      it 'redirects to the sign in path' do
        feedback = FactoryGirl.create(:feedback)
        get :show, user_id: feedback.user.id, id: feedback.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'when signed in' do
    before do
      sign_in FactoryGirl.create(:user)
    end

    # This should return the minimal set of attributes required to create a valid
    # Feedback. As you add validations to Feedback, be sure to
    # adjust the attributes here as well.
    let(:user) do
      FactoryGirl.create(:user)
    end

    let(:practice) do
      FactoryGirl.create(:practice)
    end

    let(:valid_attributes) do
      { practice_id: practice.id, note: 'Trainee did well' }
    end

    let(:invalid_attributes) do
      { practice_id: nil, note: nil }
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # FeedbacksController. Be sure to keep this updated too.

    describe 'GET show' do
      it 'assigns the requested feedback as @feedback' do
        feedback = user.feedbacks.create! valid_attributes
        get :show, user_id: user.id, id: feedback.to_param
        expect(assigns(:feedback)).to eq(feedback)
      end
    end

    describe 'GET new' do
      it 'assigns a new feedback as @feedback' do
        get :new, user_id: user.id
        expect(assigns(:feedback)).to be_a_new(Feedback)
      end

      it 'assigns existing feedback as @feedback if a feedback already exists' do
        feedback = FactoryGirl.create(:feedback, user: user, practice: practice)
        get :new, user_id: user.id, practice_id: practice.id
        expect(assigns(:feedback)).to eq(feedback)
      end
    end

    describe 'GET edit' do
      before(:each) do
        @feedback = user.feedbacks.create! valid_attributes
      end

      it 'assigns the requested feedback as @feedback' do
        get :edit, user_id: user.id, id: @feedback.to_param
        expect(assigns(:feedback)).to eq(@feedback)
      end

      it 'has a scorecard' do
        2.times { FactoryGirl.create(:bmark, track: user.track) }
        FactoryGirl.create(:score, feedback: @feedback, bmark: user.track.bmarks.first)
        get :edit, user_id: user.id, id: @feedback.to_param
        expect(assigns(:feedback).scores.size).to eq(2)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Feedback' do
          expect do
            post :create, user_id: user.id, feedback: valid_attributes
          end.to change(Feedback, :count).by(1)
        end

        it 'assigns a newly created feedback as @feedback' do
          post :create, user_id: user.id, feedback: valid_attributes
          expect(assigns(:feedback)).to be_a(Feedback)
          expect(assigns(:feedback)).to be_persisted
        end

        it 'redirects to the created feedback' do
          post :create, user_id: user.id, feedback: valid_attributes
          expect(response).to redirect_to([user, Feedback.last])
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved feedback as @feedback' do
          post :create, user_id: user.id, feedback: invalid_attributes
          expect(assigns(:feedback)).to be_a_new(Feedback)
        end

        it "re-renders the 'new' template" do
          post :create, user_id: user.id, feedback: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_attributes) do
          { note: 'My updated test' }
        end

        it 'updates the requested feedback' do
          feedback = user.feedbacks.create! valid_attributes
          put :update, user_id: user.id, id: feedback.to_param, feedback: new_attributes
          feedback.reload
          expect(feedback.note).to eq(new_attributes[:note])
        end

        it 'assigns the requested feedback as @feedback' do
          feedback = user.feedbacks.create! valid_attributes
          put :update, user_id: user.id, id: feedback.to_param, feedback: valid_attributes
          expect(assigns(:feedback)).to eq(feedback)
        end

        it 'redirects to the feedback' do
          feedback = user.feedbacks.create! valid_attributes
          put :update, user_id: user.id, id: feedback.to_param, feedback: valid_attributes
          expect(response).to redirect_to([user, feedback])
        end
      end

      describe 'with invalid params' do
        it 'assigns the feedback as @feedback' do
          feedback = user.feedbacks.create! valid_attributes
          put :update, user_id: user.id, id: feedback.to_param, feedback: invalid_attributes
          expect(assigns(:feedback)).to eq(feedback)
        end

        it "re-renders the 'edit' template" do
          feedback = user.feedbacks.create! valid_attributes
          put :update, user_id: user.id, id: feedback.to_param, feedback: invalid_attributes
          expect(response).to render_template('edit')
        end
      end
    end
  end
end
