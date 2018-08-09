class TodosController < ApplicationController
  require 'mini_magick'
  def index
    @todos = Todo.all.order(created_at: 'desc')
  end

  def show
    @todo = Todo.find(params[:id])
    @image = Image.find_by(todo_id: @todo.id)
    assign_meta_tags(
      title: "Super Test",
      site: @todo.twitter_id,
      image: "https://secure-ridge-55094.herokuapp.com/assets/#{@image.name}",
      url: "https://secure-ridge-55094.herokuapp.com/todos/#{@todo.id}"
    )
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
      base_image = MiniMagick::Image.open("app/assets/images/pikachu.jpg")
      time = Time.now.strftime('%Y-%m-%d-%H-%M-%S')
      image_name = "#{current_user.twitter_id}-#{time}.jpg"
      base_image.gravity 'center'
      base_image.draw "text 200,200 'test'"
      base_image.write("app/assets/images/#{image_name}")
      @image = current_user.images.create(
        twitter_id: current_user.twitter_id,
        todo_id: @todo.id,
        name: image_name,
        path: "app/assets/images/#{image_name}"
      )
      client.update!("https://secure-ridge-55094.herokuapp.com/todos/#{@todo.id}")
    rescue => e
      error = e
    end
     render plain: error || redirect_to todo_path(@todo)
    #  render plain: base_image
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
