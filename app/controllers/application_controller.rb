class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    if session[:user_id]
      current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # ユーザーがログインしていればtrue、していなければfalseを返す
  def logged_in?
    !current_user.nil?
  end
  
  def login
    if current_user.nil?
      redirect_to :user_login, alert: "ログインしてください"
    end
  end
  
  def already_login
    if logged_in?
      redirect_to :rooms, alert: "すでにログインしています"
    end
  end
end
