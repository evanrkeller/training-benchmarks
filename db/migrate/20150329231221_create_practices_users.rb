class CreatePracticesUsers < ActiveRecord::Migration
  def change
    create_table :practices_users do |t|
      t.references :practice
      t.references :user
    end
    add_index :practices_users, [:practice_id, :user_id]
    add_index :practices_users, :practice_id
    add_index :practices_users, :user_id
  end
end
