class ApplicationController < ActionController::Base
<<<<<<< HEAD
  protect_from_forgery with: :exception
=======
<<<<<<< HEAD
    protect_from_forgery with: :exception
=======
  protect_from_forgery with: :exception
>>>>>>> 7b8834edfb3a81da7049fc54be695ac0c5d39dc3
>>>>>>> master
  helper_method :current_user, :logged_in?

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end
end
