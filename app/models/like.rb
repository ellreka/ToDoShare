class Like < ApplicationRecord
  belongs_to :todo, optional: true
end