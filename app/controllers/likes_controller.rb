class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.create(user_id: @user_id, todo_id: @todo_id, twitter_id: @twitter_id)
    @likes = Like.where(todo_id: @todo_id)
    @todo = Todo.find(@todo_id)
  end
    
  def destroy
    like = Like.find_by(todo_id: @todo_id, twitter_id: @twitter_id)
    like.destroy
    @likes = Like.where(todo_id: @todo_id)
    @todo = Todo.find(@todo_id)
  end

  private
  def set_variables
    @user_id = current_user.id
    @todo_id = params[:todo_id]
    @twitter_id = current_user.twitter_id
  end
end
