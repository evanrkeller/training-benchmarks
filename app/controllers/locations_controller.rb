class LocationsController < ApplicationController
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

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
