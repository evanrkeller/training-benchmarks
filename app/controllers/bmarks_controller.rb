class BmarksController < ApplicationController
  before_action :set_bmark, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def show
    respond_with(@bmark)
  end

  def new
    @bmark = Bmark.new(bmark_params)
    respond_with(@bmark)
  end

  def edit
  end

  def create
    @bmark = Bmark.new(bmark_params)
    @bmark.save
    respond_with(@bmark)
  end

  def update
    @bmark.update(bmark_params)
    respond_with(@bmark)
  end

  def destroy
    track = @bmark.track
    @bmark.destroy
    redirect_to track_path(track)
  end

  private

  def set_bmark
    @bmark = Bmark.find(params[:id])
  end

  def bmark_params
    params.require(:bmark).permit(:name, :description, :track_id, :stage_id)
  end
end
