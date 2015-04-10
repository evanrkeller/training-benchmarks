class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice

  validates :user, :practice, :note, presence: true
end
