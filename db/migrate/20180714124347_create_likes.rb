class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
    t.integer :todo_id, foreign_key: true
    t.integer :twitter_id, limit: 8, foreign_key: true
    t.timestamps
    end
  end
end
