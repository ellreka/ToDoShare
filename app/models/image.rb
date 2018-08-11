class Image < ApplicationRecord
  belongs_to :todo
  belongs_to :user
  validates :user_id, presence: true
  validates :todo_id, presence: true

  def generate(name,body)
    base_image = MiniMagick::Image.open("app/assets/images/base_card.png")
    base_image.gravity 'center'
    base_image.draw "text 200,200 '#{body}'"
    base_image.write("app/assets/images/#{name}")
  end
  
end