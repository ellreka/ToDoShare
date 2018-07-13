class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :twitter_id
      t.string :image_url
      t.string :provider
    end
  end
end
