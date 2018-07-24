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
    # @todo = Todo.new(
    #   body: params[:post][:body],
    #   twitter_id: User.find(current_user.id).twitter_id
    # )
    # @todo.save
    redirect_to todos_path
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
