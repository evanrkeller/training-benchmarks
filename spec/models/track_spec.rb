require 'rails_helper'

RSpec.describe Track, type: :model do
  it { should have_many :bmarks }
  it { should have_many :users }
  it { should validate_presence_of :name }
end
