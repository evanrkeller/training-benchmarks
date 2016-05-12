class Location < ActiveRecord::Base
  has_many :tracks, -> { order(:name) }
  validates :name, presence: true
end
