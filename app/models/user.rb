class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    twitter_id = auth[:twitter_id]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, twitter_id: twitter_id) do |user|
      user.name = name
      user.image_url = image_url
    end
  end
end
