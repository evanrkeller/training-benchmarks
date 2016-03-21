class LocationsController < ApplicationController
  before_action :set_location, only: [:edit, :update]

  respond_to :html

  def index
    @locations = Location.all
    respond_with(@locations)
  end

  def new
    @location = Location.new
    respond_with(@location)
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      respond_with(@location)
    end
  end

  def edit
  end

  def update
    @location.update(location_params)
    if @location.save
      redirect_to locations_path
    else
      respond_with(@location)
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
