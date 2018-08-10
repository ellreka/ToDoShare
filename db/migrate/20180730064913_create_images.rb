class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :twitter_id
      t.integer :todo_id
      t.string :name

      t.timestamps
    end
  end
end
