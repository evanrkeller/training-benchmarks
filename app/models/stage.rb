class Stage < ActiveRecord::Base

  has_many :bmarks
  validates :name, presence: true
  acts_as_list

end
