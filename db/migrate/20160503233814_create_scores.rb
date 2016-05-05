class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :bmark, index: true, foreign_key: true
      t.references :feedback, index: true, foreign_key: true
      t.integer :rating

      t.timestamps null: false
    end
  end
end
