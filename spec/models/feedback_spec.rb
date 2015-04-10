require 'rails_helper'

RSpec.describe Feedback, :type => :model do
  it { should validate_presence_of :user }
  it { should validate_presence_of :practice }
  it { should validate_presence_of :note }
  it { should belong_to :user }
  it { should belong_to :practice }
end
