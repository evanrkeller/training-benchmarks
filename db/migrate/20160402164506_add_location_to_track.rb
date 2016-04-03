class AddLocationToTrack < ActiveRecord::Migration
  def change
    add_reference :tracks, :location, index: true
    add_foreign_key :tracks, :locations
  end
end
