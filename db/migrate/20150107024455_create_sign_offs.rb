class CreateSignOffs < ActiveRecord::Migration
  def change
    create_table :sign_offs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bmark, index: true

      t.timestamps null: false
    end
    add_foreign_key :sign_offs, :users
    add_foreign_key :sign_offs, :bmarks
  end
end
