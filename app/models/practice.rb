class Practice < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates :start_time, :end_time, presence: true

  def unregistered_users
    User.all.reject { |user| users.include? user }
  end

  def date
    start_time.to_date
  end
end
