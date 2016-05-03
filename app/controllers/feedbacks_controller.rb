class FeedbacksController < ApplicationController
  before_action :set_user
  before_action :set_feedback, only: [:show, :edit, :update]

  respond_to :html

  def show
    respond_with(@user, @feedback)
  end

  def new
    @feedback = @user.feedbacks.where(practice_id: params[:practice_id]).first ||
                @user.feedbacks.new(practice_id: params[:practice_id])
    respond_with(@user, @feedback)
  end

  def edit
  end

  def create
    @feedback = @user.feedbacks.new(feedback_params)
    @feedback.save
    respond_with(@user, @feedback)
  end

  def update
    @feedback.update(feedback_params)
    respond_with(@user, @feedback)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_feedback
    @feedback = @user.feedbacks.find(params[:id])
  end

  def feedback_params
    params.require(:user_id)
    params.require(:feedback).permit(:practice_id, :note)
  end
end
