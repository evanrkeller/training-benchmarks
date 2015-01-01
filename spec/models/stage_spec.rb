require 'rails_helper'

RSpec.describe Stage, :type => :model do
  it { should have_many :bmarks }
  it { should validate_presence_of :name }

  describe 'position'

    let!(:first_stage) { Stage.create(name: 'First') }
    let!(:second_stage) { Stage.create(name: 'Second') }
    let!(:third_stage) { Stage.create(name: 'Third') }

    it 'should increment when creating a new stage' do
      expect(second_stage.position).to eq first_stage.position + 1
    end

    it 'should be returned in the proper order' do
      second_stage.move_to_bottom
      expect(Stage.all).to eq [first_stage, third_stage, second_stage]
    end

end
