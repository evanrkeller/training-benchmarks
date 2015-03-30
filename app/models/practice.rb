class Practice < ActiveRecord::Base

  has_and_belongs_to_many :users
  validates :start_time, :end_time, presence: true

end
