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
    @todo = current_user.todos.create(
      body: params[:post][:body],
      twitter_id: current_user.twitter_id
    )

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET_KEY']
      config.access_token = current_user.access_token
      config.access_token_secret = current_user.access_token_secret
    end

    begin
      base_image = Image.read("/Users/akasa/src/project/ToDoShare/app/assets/images/pikachu.jpg").first
      draw = Draw.new
      draw.pointsize = 16
      draw.gravity = CenterGravity
      draw.annotate(base_image,100, 200, 300, 400,"test")
      time = Time.now.strftime('%Y-%m-%d-%H-%M-%S')
      path = "/Users/akasa/src/project/ToDoShare/app/assets/images/#{current_user.name}-#{time}.jpg"
      base_image.write(path)
      draw_image = open(path)
      assign_meta_tags(
        title: "test",
        site: "test",
        description: "TwitterCard Test",
        image: path.slice!("images/")
      )
      client.update!(path.slice!(""))
      # client.update_with_media(@todo.body,draw_image)

      image = current_user.images.create(
        twitter_id: current_user.twitter_id,
        todo_id: @todo.id,
        path: path
      )
    rescue => e
      error = e
    end
    render plain: error || "Twitter.update!"
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def mypage
    @todos = Todo.where(twitter_id: params[:twitter_id]).order(created_at: 'desc')
  end
end
