class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    t.string :name
    t.string :twitter_id
    t.string :image_url
    t.string :provider
    t.string :access_token
    t.string :access_token_secret
    end
  end
end
