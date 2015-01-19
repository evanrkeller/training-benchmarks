class Track < ActiveRecord::Base

  has_many :bmarks
  has_many :users
  validates :name, presence: true

end
