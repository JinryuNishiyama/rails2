class RoomsController < ApplicationController
  before_action :login, only: [:new, :create, :list]
  
  def index
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to :rooms_list, notice: "ルームを新規登録しました"
    else
      flash.now[:alert] = "エラー：登録できませんでした"
      render "new"
    end
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def list
    @rooms = Room.where(user_id: current_user.id)
  end
  
  def search
    if params[:area] != nil
      @rooms = Room.search_area(params[:area])
    else
      @rooms = Room.search(params[:keyword])
    end
  end
  
  private
  
  def room_params
    params.require(:room).permit(:title, :address, :fee, :information, :image)
  end
end
