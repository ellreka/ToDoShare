class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
    t.integer :todo_id
    t.integer :twitter_id, limit: 8
    t.timestamps
    end
  end
end
