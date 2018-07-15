class Todo < ApplicationRecord
  has_many :likes, dependent: :destroy
end