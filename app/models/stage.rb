class Stage < ActiveRecord::Base

  validates :name, presence: true
  acts_as_list

end
