class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    t.string :name
    t.integer :twitter_id, limit: 8
    t.string :image_url
    t.string :provider
    end
  end
end
