class SignOff < ActiveRecord::Base
  belongs_to :user
  belongs_to :bmark
end
