class CreateToDos < ActiveRecord::Migration[5.2]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.string :body
      t.string :twitterId

      t.timestamps
    end
  end
end
