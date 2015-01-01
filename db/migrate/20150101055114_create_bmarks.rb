class CreateBmarks < ActiveRecord::Migration
  def change
    create_table :bmarks do |t|
      t.string :name
      t.text :description
      t.belongs_to :track, index: true
      t.belongs_to :stage, index: true

      t.timestamps null: false
    end
    add_foreign_key :bmarks, :tracks
    add_foreign_key :bmarks, :stages
  end
end
