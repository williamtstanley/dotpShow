class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_episode
    @current_episode ||= Episode.find(params[:episode_id])
  end

  helper_method :current_episode

  helper_method :current_user

  def user_signed_in?
      session[:user_id].present?
  end

  helper_method :user_signed_in?

  def sign_in(user)
      session[:user_id] = user.id
  end

  def authenticate_user!
      redirect_to new_session_path, alert: "please sign in" unless user_signed_in? && current_user.is_admin?
  end

end
