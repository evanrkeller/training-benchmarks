class AddTrackToUser < ActiveRecord::Migration
  def change
    add_reference :users, :track, index: true
    add_foreign_key :users, :tracks
  end
end
