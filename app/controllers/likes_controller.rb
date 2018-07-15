class LikesController < ApplicationController
  def create
    @like = Like.create(twitter_id:,todo_id: params[:id])
  end
end
