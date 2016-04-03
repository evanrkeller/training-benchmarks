class Track < ActiveRecord::Base
  belongs_to :location
  has_many :bmarks
  has_many :users
  validates :name, presence: true
  validates :location, presence: true, if: :locations_exist

  private

  def locations_exist
    Location.exists?
  end
end
