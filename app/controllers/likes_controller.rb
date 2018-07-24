class LikesController < ApplicationController

  def create
    @todo = Todo.find(params[:todo_id])
    @todo.like(current_user)
    # like = Like.new(todo_id: params[:todo_id], twitter_id: twitter_id)
    # like.save
    redirect_to root_path
  end
    
  def destroy
    @like = Like.find_by(todo_id: params[:todo_id])
    @like.destroy
    # like = Like.find_by(twitter_id: twitter_id)
    # like.destroy
    redirect_to root_path
  end

  private
    def twitter_id
      current_user.twitter_id
    end
end
