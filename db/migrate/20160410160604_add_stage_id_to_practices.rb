class AddStageIdToPractices < ActiveRecord::Migration
  def change
    add_reference :practices, :stage, index: true
    add_foreign_key :practices, :stages
  end
end
