class User < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_todos, through: :likes, source: :todo
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    twitter_id = auth[:info][:nickname]
    name = auth[:info][:name]
    image_url = auth[:info][:image]
    access_token = auth[:credentials][:token]
    access_token_secret = auth[:credentials][:secret]
  
    self.find_or_create_by(provider: provider, twitter_id: twitter_id) do |user|
      user.name = name
      user.image_url = image_url
      user.access_token = access_token
      user.access_token_secret = access_token_secret
    end
  end
 end
