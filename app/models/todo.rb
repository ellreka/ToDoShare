class Todo < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def like(user)
    likes.create(user_id: user.id, twitter_id: user.twitter_id)
  end

  def relike(user)
    likes.find_by(twitter_id: user.twitter_id).destroy
  end

  def like?(user)
    liked_users.include?(user)
  end

end