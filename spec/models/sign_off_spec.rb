require 'rails_helper'

RSpec.describe SignOff, :type => :model do
  it { should belong_to :user }
  it { should belong_to :bmark }
end
