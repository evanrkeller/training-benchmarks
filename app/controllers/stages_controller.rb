class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @stages = Stage.all
    respond_with(@stages)
  end

  def show
    respond_with(@stage)
  end

  def new
    @stage = Stage.new
    respond_with(@stage)
  end

  def edit
  end

  def create
    @stage = Stage.new(stage_params)
    @stage.save
    respond_with(@stage)
  end

  def update
    @stage.update(stage_params)
    respond_with(@stage)
  end

  def destroy
    @stage.destroy
    respond_with(@stage)
  end

  private

  def set_stage
    @stage = Stage.find(params[:id])
  end

  def stage_params
    params.require(:stage).permit(:name, :position)
  end
end
