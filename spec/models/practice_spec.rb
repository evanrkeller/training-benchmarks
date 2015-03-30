require 'rails_helper'

RSpec.describe Practice, :type => :model do
  it {should validate_presence_of :start_time}
  it {should validate_presence_of :end_time}
  it {should have_and_belong_to_many :users}
end
