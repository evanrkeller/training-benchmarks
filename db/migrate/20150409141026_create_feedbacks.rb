class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.belongs_to :user, index: true
      t.belongs_to :practice, index: true
      t.text :note

      t.timestamps null: false
    end
    add_foreign_key :feedbacks, :users
    add_foreign_key :feedbacks, :practices
  end
end
