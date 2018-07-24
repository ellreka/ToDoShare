class Like < ApplicationRecord
  belongs_to :todo
  belongs_to :user
  validates :user_id, presence: true
  validates :todo_id, presence: true
end