class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :set_locations_size, only: [:new, :edit, :create, :update, :show]

  respond_to :html

  def index
    @tracks = Track.all
    respond_with(@tracks)
  end

  def show
    respond_with(@track)
  end

  def new
    @track = Track.new
    @track.location = Location.first if @locations_size == 1
    respond_with(@track)
  end

  def edit
    @track.location = Location.first if @locations_size == 1
  end

  def create
    @track = Track.new(track_params)
    @track.location = Location.first if @locations_size == 1
    @track.save
    respond_with(@track)
  end

  def update
    @track.location = Location.first if @locations_size == 1
    @track.update(track_params)
    respond_with(@track)
  end

  def destroy
    @track.destroy
    respond_with(@track)
  end

  private

  def set_track
    @track = Track.includes(bmarks: [:stage]).find(params[:id])
  end

  def set_locations_size
    @locations_size = Location.all.size
  end

  def track_params
    params.require(:track).permit(:name, :location_id)
  end
end
