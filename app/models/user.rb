class User < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_todos, through: :likes, source: :todo
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    twitter_id = auth[:info][:nickname]
    name = auth[:info][:name]
    icon_url = auth[:info][:image]
    access_token = auth[:credentials][:token]
    access_token_secret = auth[:credentials][:secret]
  
    self.find_or_create_by(provider: provider, twitter_id: twitter_id) do |user|
      user.name = name
      user.icon_url = icon_url
      user.access_token = access_token
      user.access_token_secret = access_token_secret
    end
  end

  def mkdir(dir_path)
    unless Dir.exist?("#{dir_path}") then
      Dir.mkdir("#{dir_path}")
    end
  end
end
