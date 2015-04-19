require 'rails_helper'

RSpec.describe Bmark, type: :model do
  it { should belong_to :track }
  it { should belong_to :stage }
  it { should have_many(:sign_offs) }
  it { should validate_presence_of :name }
end
