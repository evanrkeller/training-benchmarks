class Track < ActiveRecord::Base
  belongs_to :location
  has_many :bmarks
  has_many :users
  validates :name, presence: true
  validates :location, presence: true, if: :locations_exist

  scope :by_location, -> (location_id) { where(location_id: location_id) }

  def name_and_location
    if location
      "#{name} (#{location.name})"
    else
      name
    end
  end

  private

  def locations_exist
    Location.exists?
  end
end
