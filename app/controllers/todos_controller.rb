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
    # render plain: params[:post].inspect
    @todo = Todo.new(post_params)
    @todo.save
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def mypage
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
