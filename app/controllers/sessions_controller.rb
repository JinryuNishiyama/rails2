class SessionsController < ApplicationController
  before_action :already_login, only: [:new, :create]
  
  def new
  end
  
  def create
    user = User.find_by(email: "#{params[:email]}")
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :rooms, notice: "ログインしました"
    else
      flash.now[:alert] = "エラー：メールアドレスまたはパスワードが正しくありません"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to :rooms, notice: "ログアウトしました"
  end
end
