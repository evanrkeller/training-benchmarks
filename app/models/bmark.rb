class Bmark < ActiveRecord::Base
  belongs_to :track
  belongs_to :stage
  validates :name, presence: true
end
