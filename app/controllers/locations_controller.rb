class LocationsController < ApplicationController
  respond_to :html

  def index
    @locations = Location.all
    respond_with(@locations)
  end
end
