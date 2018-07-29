class TodosController < ApplicationController
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
      client.update!("#{@todo.body}\n\n#Todo https://secure-ridge-55094.herokuapp.com")
    rescue => e
      error = e
    end
    render plain: error || "Twitter.update"
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
