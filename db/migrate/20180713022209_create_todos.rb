class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
    t.string :body
    t.integer :twitter_id, limit: 8
    t.integer :likes
    t.timestamps
    end
  end
end
