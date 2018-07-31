class TodosController < ApplicationController
  require 'rmagick'
  include Magick
  def index
    @todos = Todo.all.order(created_at: 'desc')
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
  end

  def create
    # @todo = current_user.todos.create(
    #   body: params[:post][:body],
    #   twitter_id: current_user.twitter_id
    # )

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET_KEY']
      config.access_token = current_user.access_token
      config.access_token_secret = current_user.access_token_secret
    end

    begin
      # image = open("/Users/akasa/src/project/ToDoShare/app/assets/images/pikachu.jpg")
      # image.display
      # image.write("../assets/images/test.jpg")
      # draw = Draw.new
      # client.update!("#{@todo.body}\n\n#Todo https://secure-ridge-55094.herokuapp.com")
      image = Image.read("/Users/akasa/src/project/ToDoShare/app/assets/images/pikachu.jpg").first
      # image.to_blob
      # Base64.encode64(img.to_blob)
      # image = image_list.cur_image(1)
      draw = Draw.new
      draw.pointsize = 16
      draw.gravity = CenterGravity
      draw.annotate(image,100, 200, 300, 400,"test")
      image.write("/Users/akasa/src/project/ToDoShare/app/assets/images/pikachu-test.jpg")
      drawing = open("/Users/akasa/src/project/ToDoShare/app/assets/images/pikachu-test.jpg")
      # draw_image = open("/Users/akasa/src/project/ToDoShare/app/assets/images/pikachu.jpg")
      client.update_with_media("test",drawing)
    rescue => e
      error = e
    end
    render plain: error || image
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def mypage
    # @todos = Todo.find(:twiiter_id).order(created_at: 'desc')
    @todos = Todo.where(twitter_id: params[:twitter_id])
  end
end
