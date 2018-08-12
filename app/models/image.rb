class Image < ApplicationRecord
  belongs_to :todo
  belongs_to :user
  validates :user_id, presence: true
  validates :todo_id, presence: true

  def generate(name,body)
    image = MiniMagick::Image.open("app/assets/images/base_card.png")
    image.combine_options do |i|
      i.resize "550x315"
      i.font "app/assets/fonts/ヒラギノ丸ゴ ProN W4.ttc"
      i.gravity 'center'
      i.draw "text 100,100 '#{body}'"
      i.write("app/assets/images/#{name}")
    end
  end
end