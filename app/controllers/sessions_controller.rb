class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    flash[:notice] = "ユーザー認証が完了しました。"
    user.mkdir("app/assets/images/todos/#{user.twitter_id}")
    user.mkdir("app/assets/images/users/#{user.twitter_id}")
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました。"
    redirect_to root_path
  end
end
