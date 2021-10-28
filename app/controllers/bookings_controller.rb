class BookingsController < ApplicationController
  before_action :login
  before_action :value_check, only: :new
  
  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
    substitution()
    
    session[:room_id] = @room.id
  end
  
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.room_id = session[:room_id]
    
    if @booking.save
      session[:room_id] = nil
      redirect_to booking_path(@booking.id), notice: "予約完了しました"
    else
      flash.now[:alert] = "エラー：「ルーム詳細に戻る」を押して入力し直してください"
      render "new"
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
    if @booking.user_id != current_user.id
      redirect_to :rooms, alert: " エラー：表示できません"
    end
  end
  
  def list
    @bookings = Booking.where(user_id: current_user.id)
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :days, :customers, :total_amount)
  end
  
  def value_check
    if params[:room_id] == nil
      redirect_to :rooms, alert: "エラー：表示できません"
    elsif params[:start_date] == "" || params[:end_date] == "" || params[:customers] == "" || params[:start_date].to_date >= params[:end_date].to_date || params[:customers].to_i <= 0
      redirect_to room_path(params[:room_id]), alert: "エラー：正しく入力してください"
    end
  end
  
  def substitution
    @booking.start_date = params[:start_date]
    @booking.end_date = params[:end_date]
    @booking.days = (params[:end_date].to_date - params[:start_date].to_date).to_i
    @booking.customers = params[:customers]
    @booking.total_amount = @room.fee * @booking.days * @booking.customers
  end
end
