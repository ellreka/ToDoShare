class Like < ApplicationRecord
  belongs_to :todo
  belongs_to :user
end
