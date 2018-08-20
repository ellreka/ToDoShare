class Image < ApplicationRecord
  belongs_to :todo
  belongs_to :user
  validates :user_id, presence: true
  validates :todo_id, presence: true

  # calling method in controller
  def make(twitter_id,name,body,icon_url)
    self.draw_todo_image(twitter_id,name,body)
    # self.rounding_user_icon(twitter_id,icon_url)
    # self.compose_icon_to_todo(twitter_id,name,icon_url)
  end

  def draw_todo_image(twitter_id,name,body)
    base_image = MiniMagick::Image.open("app/assets/images/bases/base_card.png")
    todo_image = base_image.combine_options do |i|
      i.font 'app/assets/fonts/ヒラギノ角ゴシック W3.ttc'
      i.gravity 'center'
      i.draw "text 100,100 '#{body}'"
    end
    todo_image.write("app/assets/images/todos/#{twitter_id}/#{name}")
  end

  def rounding_user_icon(twitter_id,icon_url)
    base_icon = MiniMagick::Image.open("#{icon_url}")
    # base_icon.resize '70x70'
    base_icon.gravity 'center'
    # base_icon.extent '70x70'
    circle_flame = MiniMagick::Image.open("app/assets/images/bases/circle_flame.png")
    rounded_icon = base_icon.composite(circle_flame) do |i|
      i.compose 'CopyOpacity'
    end
    rounded_icon.write("app/assets/images/users/#{twitter_id}/icon.png")
  end

  def compose_icon_to_todo(twitter_id,name,icon_url)
    base_image = MiniMagick::Image.new("app/assets/images/todos/#{twitter_id}/#{name}")
    # open a rouded user_icon
    user_icon = MiniMagick::Image.open("app/assets/images/users/#{twitter_id}/icon.png")
    result_image = base_image.composite(user_icon) do |i|
      i.compose "Over"
      i.gravity 'NorthWest'
      i.geometry "+30+20"
    end
    result_image.write("app/assets/images/todos/#{twitter_id}/#{name}")
  end
end