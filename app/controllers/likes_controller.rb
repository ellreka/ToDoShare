class LikesController < ApplicationController

  def create
    like = Like.new(todo_id: params[:todo_id], twitter_id: twitter_id)
    like.save
    redirect_to root_path
  end
    
  def destroy
    like = Like.find_by(twitter_id: twitter_id)
    like.destroy
    redirect_to root_path
  end

  private

    def twitter_id
      User.find(current_user.id).twitter_id
    end
end
