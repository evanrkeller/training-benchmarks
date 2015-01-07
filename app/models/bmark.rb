class Bmark < ActiveRecord::Base
  belongs_to :track
  belongs_to :stage
  has_many :sign_offs
  validates :name, presence: true
end
