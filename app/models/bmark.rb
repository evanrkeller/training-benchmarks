class Bmark < ActiveRecord::Base
  belongs_to :track
  belongs_to :stage
  has_many :sign_offs
  validates :name, presence: true

  def self.by_stage_and_track
    joins(:stage, :track).order('stages.name, tracks.name')
  end
end
