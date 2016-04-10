class Practice < ActiveRecord::Base
  belongs_to :stage
  has_and_belongs_to_many :users
  has_many :feedbacks, dependent: :destroy
  validates :stage, :start_time, :end_time, presence: true

  def unregistered_users
    User.all.reject { |user| users.include? user }
  end

  def date
    start_time.to_date
  end

  def time
    DateRangeFormatter.format(start_time, end_time, :with_time)
  end
end
