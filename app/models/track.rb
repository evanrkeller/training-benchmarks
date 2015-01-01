class Track < ActiveRecord::Base

  has_many :bmarks
  validates :name, presence: true

end
