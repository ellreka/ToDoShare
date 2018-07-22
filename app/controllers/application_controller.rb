class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    return unless session[:twitter_id]
    @current_user ||= User.find_by(twitter_id: session[:twitter_id])
  end

  def logged_in?
    !!session[:twitter_id]
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end
end
