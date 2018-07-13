class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :body
      t.string :twitter_id

      t.timestamps
    end
  end
end
