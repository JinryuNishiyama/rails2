class UsersController < ApplicationController
  before_action :login, except: [:new, :create]
  before_action :already_login, only: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :rooms, notice: "登録完了しました"
    else
      render "new"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to :user, notice: "ユーザー情報を更新しました"
    else
      flash.now[:alert] = "エラー：更新できませんでした"
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :name, :introduction)
  end
end
