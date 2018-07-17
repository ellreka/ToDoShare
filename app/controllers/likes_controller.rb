class LikesController < ApplicationController
  def create
    # likesテーブルにlike情報を格納する部分
    @like = Like.new(todo_id: params[:todo_id], twitter_id: User.find(session[:user_id]).twitter_id)
    @like.save
    # todosテーブルのlikesカラムを更新
    @todo = Todo.find_by(id: params[:todo_id])
    @todo.likes = @todo.likes + 1
    @todo.save
    redirect_to root_path
  end
    
  def destroy
  end
end
