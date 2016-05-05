require 'rails_helper'

RSpec.describe Score, type: :model do
  it { should belong_to :bmark }
  it { should belong_to :feedback }
end
