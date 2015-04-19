class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :practice

  validates :user, :practice, :note, presence: true
  validates :user, uniqueness: { scope: :practice }
end
