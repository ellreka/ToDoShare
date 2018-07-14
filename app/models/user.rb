class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
<<<<<<< HEAD
    twitter = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, twitter_id: twitter) do |user|
=======
    twitter_id = auth[:twitter_id]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, twitter_id: twitter_id) do |user|
>>>>>>> 7b8834edfb3a81da7049fc54be695ac0c5d39dc3
      user.name = name
      user.image_url = image_url
    end
  end
end
