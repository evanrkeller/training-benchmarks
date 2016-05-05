class Score < ActiveRecord::Base
  belongs_to :bmark
  belongs_to :feedback
end
